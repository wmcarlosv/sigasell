<?php

 /* 
  * @functionModel - Almost all functions used can be found here
 */

 class functionModel{

 //ALLOWED EXTENSION [IMAGES]
 public $allowed =  ["jpeg" => "image/jpeg", "png" => "image/png", "jpg" => "image/jpg", "gif" => "image/gif"];

 //IMAGE_LINK
 public $imglink;
 
 //VERIFY_SIZE [5MB]
 public $maxsize = 5 * 1024 * 1024;

 //ZIP_LINK
 public $ziplink;

 //ZIP_SIZE
 public $zipsize;
 
 //ALLOWED EXTENSION [ZIP]
 public $allowedzip = ["application/zip" => "application/zip", "multipart/x-zip" => "application/x-compressed", "application/x-zip-compressed" => "application/x-zip-compressed"];

 public $allowedimg =  ["jpeg" => "image/jpeg", "png" => "image/png", "jpg" => "image/jpg"];

 //VERIFY_SIZE [10MB]
 public $maxsizezip = 10 * 1024 * 1024;

 public function do_install(){
   //redirect to installer
  if(!endsWith(ACCESS, INSTALL_FILE) && !endsWith(ACCESS, LICENSE_FILE) && !endsWith(ACCESS, DATABASE_FILE) && !endsWith(ACCESS, BUILD_FILE) && !endsWith(ACCESS, ADMIN_FILE)):

   header('location: installer/index');
   
  endif;

 }
 
 public function do_update_notice(){

 global $HOST,$smarty,$info;
 
 if(app_version()['version'] > $info->version):

   $smarty->assign('app_version',true);
   $smarty->assign('msg_version','<div class="alert alert-danger">A new version <b>['.app_version()['version'].']</b> has been released click <a href="'.$HOST.'admin/updates/index?v='.app_version()['version'] .'"><b>here</b></a> to update it!</div>');
   
 else:
    
  $smarty->assign('app_version',false);

 endif;

 }

 public function do_user($u){

 global $user,$query;
 
 if (isset($u)):
     
 $user = $query->addquery('select','cm_members','*','i', $u,'id=?');

 endif;
 
 }

 public function do_lang($l){

 require_once(LOCALE.$l.DS.'labels.php');

 require_once(LOCALE.$l.DS.'messages.php');

 }

 public function do_host(){

 global $hs,$HOST,$info;

 if(DB_ERR && $info->install == 'on'):
  errorAndDie('Missing Database Parameter');
 endif;

 if (empty(HOST)):
  $HOST = $hs->site_url();
 else:
  $HOST = HOST;
 endif;
 
 }

 public function time_elapsed_string($datetime, $full = false) {
    $now = new DateTime;
    $ago = new DateTime($datetime);
    $diff = $now->diff($ago);

    $diff->w = floor($diff->d / 7);
    $diff->d -= $diff->w * 7;

    $string = array(
        'y' => 'year',
        'm' => 'month',
        'w' => 'week',
        'd' => 'day',
        'h' => 'hour',
        'i' => 'minute',
        's' => 'second',
    );
    foreach ($string as $k => &$v) {
        if ($diff->$k) {
            $v = $diff->$k . ' ' . $v . ($diff->$k > 1 ? 's' : '');
        } else {
            unset($string[$k]);
        }
    }

    if (!$full) $string = array_slice($string, 0, 1);
    return $string ? implode(', ', $string) . ' ago' : 'just now';
}

 public function limit_text($text, $limit) {
   //short text
      if (str_word_count($text, 0) > $limit) {
          $words = str_word_count($text, 2);
          $pos = array_keys($words);
          $text = substr($text, 0, $pos[$limit]) . '...';
      }
      return $text;
    }

 public function redirect($r){
 
 header('location:'. $r['action']);

 exit;
 
}

 public function do_404(){
 
 global $smarty;
 
 require_once (WWW_ROOT.'pages/404.php');
 exit;
 
}

 public function do_view($to){
 
 global $smarty;
 
 require_once (WWW_ROOT.$to.'.php');

 exit;
 
}

 public function do_required($n){

    if( empty(trim($_POST[$n]))):
       session_acv('req_'.$n,'re_'.$n);
       quick();
    endif;
}


 public function do_arrp($n,$arr){
 
 if(isset($_POST[$n])):
 
  $arr = explode(',',$arr);
  $array = array();
 
  for($i=0; $i < count($arr); $i++):
   $build =  $_POST[$arr[$i]];
   array_push($array, $build);
  endfor;
  
    return $array;
    
 endif;
 
}

 public function do_credits($r=false){

 global $smarty,$query;
 
 if(!$r):
  $data = $query->addquery('fetch','cm_credits','*','i', '1','status=?');
  
   if( isset($_GET['status'])):
     if($_GET['status'] == 'success'):
       $smarty->assign('success',true);
       $smarty->assign('failed',false);
     elseif($_GET['status'] == 'failed'):
       $smarty->assign('failed',true);
       $smarty->assign('success',false);
     endif;
   else:
    $smarty->assign('failed',false);
    $smarty->assign('success',false);
  endif;
 else:
  $data = $query->addquery('fetch','cm_credits','*','i', '1','status=?');
 endif;
 
 $with = array();
 
 while($res=$data->fetch_assoc()):
    
 $arr=array('amount'=>$res['amount']);

 array_push($with,$arr);

 endwhile;
 
  $smarty->assign('credits',$with);

 }

 public function do_deposit(){

 global $option,$query,$smarty,$dateForm,$user,$pm;
 
 if ($this->do_post($this->do_arrp('deposit','paymentWay,amount'),'*','deposit')){

 $payment_method = check_request('paymentWay');
 $payment_amount = $this->do_checkcrd($_POST['amount']);
 $invoiceTokendata = $this->genToken(16);

 if($payment_amount < $option[2][0]):
   session_acv('errorm','small');
   redirect(['controller' => 'user', 'action' => 'deposit']);
 else:

 $id = $query->addquery('insert','cm_invoice','user_id,amount,method,type,token,status,created','issssis',[$user->id,$payment_amount,$payment_method,'1',$invoiceTokendata,'2',$dateForm]);
 $data = $query->addquery('select','cm_invoice','id,token,amount,type','i',$id,'id=?');
 $method = $query->addquery('select','cm_depMethods','account','s',$payment_method,'methods=?');

 switch($payment_method):
  case 'bitcoin':
   $pm->coinpayments($data->token,'Order '.base64_encode($data->id.$data->amount),$data->id,number_format($data->amount, 2, '.', ''));
  break;
  case 'paypal':
   $pm->paypal($data->token,'Order '.base64_encode($data->id.$data->amount),$data->id,number_format($data->amount, 2, '.', ''),$method->account);
  break;
 endswitch;

 endif;
 }else{
     
   if(isset($_SESSION['coinpayment']['msg'])):
    $smarty->assign('coinpayment_msg',$_SESSION['coinpayment']['msg']);
   endif;
   
  alerts('errorm','small');
  alerts('coinpayment','error');
  alerts('deposit','required');

 }

}     

 public function do_purchase(){

 global $option,$query,$smarty,$dateForm,$user,$pm;
 
 if(!isset($_SESSION['item_id'])):
   $this->do_404();
 endif;
 
 /* grabe item info */

 $item = $query->addquery('select','cm_items','*','i', $_SESSION['item_id'],'id=?');
 $smarty->assign('i_name',$item->name);
 $smarty->assign('i_price',$item->price);
 $smarty->assign('i_stars',$item->stars);
 
 /* grabe user info */

 $get = $this->do_userinfo($item->user_id);

 /* purchase item */

 if ($this->do_post($this->do_arrp('purchase','payment_type'),'*','purchase')){

 $payment_type = check_request('payment_type');
 $amount = number_format($item->price + $option['10']['0']);
 $invoiceTokendata = $this->genToken(16);

 switch($payment_type){

 case 'cart':

 if($user->balance < $item->price):
  session_acv('order','small');
  redirect(['action' => 'purchase']);
 endif;
 
 $query->addquery('insert','cm_downloads','user_id,item_id,price,amount,purchase_key,created','iissss',[$user->id,$item->id,$item->price,$amount,$invoiceTokendata,$dateForm]);

 if($item->is_popular == '2'):
  $query->addquery('update','cm_items','is_popular=?','ii',['1',$item->id],'id=?');
 endif;
 
 $query->addquery('update','cm_members','admin_earnings=admin_earnings+?','ss',[$item->price,'admin'],'role=?');
 $query->addquery('update','cm_members','balance=balance-?','si',[$item->price,$user->id],'id=?');
 $query->addquery('update','cm_items','sales=sales+?,amount_sales=amount_sales+?','isi',[1,$item->price,$item->id],'id=?');
 $query->addquery('insert','cm_statement','user_id,item_id,amount,type,created','iisss',[$user->id,$item->id,$item->price,'purchase',$dateForm]);
  session_acv('order','completed');
  $_SESSION["item"]["id"] = $item->id;
  $_SESSION["item"]["name"] = $this->TitleBuild($item->name);
  redirect(['controller' => 'user','action' => 'downloads']);
  
 break;
 
 case 'paypal':

 $id = $query->addquery('insert','cm_invoice','user_id,amount,method,type,item_id,token,status,created','issiisis',[$user->id,$amount,'PayPal','2',$item->id,$invoiceTokendata,'2',$dateForm]);
 $data = $query->addquery('select','cm_invoice','id,token,amount,type','i',$id,'id=?');
 $method = $query->addquery('select','cm_depMethods','account','s','PayPal','methods=?');
 $pm->paypal($data->token,'Order item - '.$item->id,$data->id,number_format($data->amount, 2, '.', ''),$method->account);
  
 break;

 }

 }else{
  alerts('purchase','required');
  alerts('order','small');
 }

}     

 public function do_contact(){

 global $option,$query,$mail_username;
 
 $this->do_winfo('Contact Us');

 if ($this->do_post($this->do_arrp('name','email,message'),'*','contact')):

    /* Message Owner */
    $this->do_maildata('msg_owner');
    $mail = mailer(['from'=>check_request('email',false,'email'),'to'=>$option[12][0],'subject'=>'New Message from '.check_request('name'),'msg'=>fetch('Admin/Mailer/index')]);
    /* Message Sender */
    $this->do_maildata('msg_sender');
    $mail = mailer(['from'=>$option[12][0],'to'=>check_request('email',false,'email'),'subject'=>'We recieve your message','msg'=>fetch('Admin/Mailer/index')]);
    
    if($mail == 2):
      session_acv('contact','do_error');
    else:
      session_acv('contact','sent');
    endif;
      redirect(['action' => 'contact']);
 
 else:
  alerts('contact','sent');
  alerts('contact','do_error');
  alerts('contact','required');
 endif;

}     

 public function do_itm($i,$c){
 
 global $query;
 
 $do = $query->addquery('select','cm_items',$c,'i',$i,'id=?');
 
 return $do->$c;
 
 }

 public function do_checkcrd($am){

 global $smarty,$query;
 
 $data = $query->addquery('select','cm_credits','*','s',$am,'amount=?');
 
   if(!$data):
    
         redirect(['controller' => 'admin', 'action' => 'deposit']);

   else:
    
         return $data->amount;
         
   endif;
    
 }

 public function do_item($id){
 
 global $smarty,$query;
 
 $item = $query->addquery('select','cm_items','*','i', $id,'id=?');
 $cat = $query->addquery('select','cm_categories','*','i', $item->category,'id=?');

 $this->do_winfo($item->name,$item->short_desc,$item->tags);
 $smarty->assign('title',$item->name);
 $smarty->assign('item_id',$item->id);
 $smarty->assign('link_title',$this->TitleBuild($item->name));
 $smarty->assign('link_encode',base64_encode('item/'.$item->id.DS.$this->TitleBuild($item->name).DS));
 $smarty->assign('category',$cat->name);
 $smarty->assign('category_link',$cat->link);
 $smarty->assign('enable_browsers',$cat->enable_browsers);
 $smarty->assign('enable_screenshots',$cat->enable_screenshots);
 $smarty->assign('enable_previewlink',$cat->enable_previewlink);
 $smarty->assign('enable_comments',$cat->enable_comments);
 $smarty->assign('enable_reviews',$cat->enable_reviews);
 $smarty->assign('preview_img',$item->preview_img);
 $smarty->assign('sales',number_format($item->sales));
 $smarty->assign('stars',$item->stars);
 $smarty->assign('content',$item->description);
 $smarty->assign('tags',$this->buildTags(explode(',',$item->tags)));
 $smarty->assign('price',$item->price);
 $smarty->assign('browsers',$item->browsers);
 $smarty->assign('status',$item->status);
 $smarty->assign('created',$item->created);
 $smarty->assign('featured',$item->is_featured);
 $smarty->assign('item_type',$item->type);

 $c = $query->addquery('select','cm_comments','count(id) as comments_num','ii',"$item->id,1",'item_id=?,status=?');
 $smarty->assign('comments_num',number_format($c->comments_num));
 $r = $query->addquery('select','cm_reviews','count(id) as reviews_num','ii',"$item->id,1",'item_id=?,status=?');
 $smarty->assign('reviews_num',number_format($r->reviews_num));
 
}

 public function do_maildata($r,$n=false,$m=false){
 
 global $smarty;

 switch($r):
     
  case 'msg_owner':
   $smarty->assign('m_role',$r);
   $smarty->assign('m_name','Admin');
   $smarty->assign('m_fname',check_request('name'));
   $smarty->assign('m_msg',$_POST['message']);
  break;
  case 'msg_sender':
   $smarty->assign('m_role',$r);
   $smarty->assign('m_name',check_request('name'));
   $smarty->assign('m_msg',$_POST['message']);
  break;
  case 'activate':
   $smarty->assign('m_role',$r);
   $smarty->assign('m_name',$n);
   $smarty->assign('m_msg',$m);
  break;
  case 'recover':
   $smarty->assign('m_role',$r);
   $smarty->assign('m_name',$n);
   $smarty->assign('m_msg',$m);
  break;
  case 'gpass':
   $smarty->assign('m_role',$r);
   $smarty->assign('m_name',$n);
   $smarty->assign('m_msg',$m);
  break;
 endswitch;
 
}

 public function do_updata($r){
 
 global $smarty,$query;
 
  if($r == 'items_files'):
   $data = $query->addquery('select','cm_items','*','i',$_GET['id'],'id=?');
  else:
   $data = $query->addquery('select','cm_'.$r,'*','i',$_GET['id'],'id=?');
  endif;
   $smarty->assign('r_id',$data->id);

 switch($r):
     
  case 'members':
     
   $smarty->assign('r_username',$data->username);
   $smarty->assign('r_role',$data->role);
   $smarty->assign('r_status',$data->status);
   $smarty->assign('r_email',$data->email);
   $smarty->assign('r_balance',$data->balance);
   
   /* view user */
   
   $smarty->assign('r_login_ip',$data->login_ip);
   $smarty->assign('r_register_ip',$data->register_ip);
   $smarty->assign('r_created',$data->created);
   $smarty->assign('r_country',$data->country);
   $smarty->assign('r_first_name',$data->first_name);
   $smarty->assign('r_last_name',$data->last_name);

  break;
  case 'categories':
     
   $smarty->assign('r_name',$data->name);
   $smarty->assign('r_description',$data->short_desc);
   $smarty->assign('r_status',$data->status);
   $smarty->assign('preview_link',$data->enable_previewlink);
   $smarty->assign('compatible_browsers',$data->enable_browsers);
   $smarty->assign('comments_section',$data->enable_comments);
   $smarty->assign('reviews_section',$data->enable_reviews);
  break;
  case 'testimonials':
     
   $smarty->assign('r_name',$data->name);
   $smarty->assign('r_content',$data->content);
   $smarty->assign('r_job',$data->job);
  break;
  case 'announcements':
     
   $smarty->assign('r_title',$data->title);
   $smarty->assign('r_content',$data->content);
  break;
  case 'pages':
     
   $smarty->assign('r_title',$data->title);
   $smarty->assign('r_content',$data->content);
  break;
  case 'items':

   $cats = $query->addquery('select','cm_categories','*','i',$data->category,'id=?');
   $this->do_categories('adm');
   $smarty->assign('r_name',$data->name);
   $smarty->assign('r_description',$data->description);
   $smarty->assign('r_category',$data->category);
   $smarty->assign('r_tags',$data->tags);
   $smarty->assign('r_demo',$data->demo_url);
   $smarty->assign('r_type',$data->type);
   $smarty->assign('r_price',$data->price);
   $smarty->assign('r_browsers',explode(',',$data->browsers));
   $smarty->assign('enable_browsers',$cats->enable_browsers);
   $smarty->assign('enable_previewlink',$cats->enable_previewlink);
  break;
  case 'items_files':
      
  /* Nothing */
  
  break;
 endswitch;
 
}
 
 public function do_usdata($r){
 
 global $smarty,$query,$user;
 
 switch($r):
     
  case 'personal':
     
   $smarty->assign('f_name',$user->first_name);
   $smarty->assign('l_name',$user->last_name);
   $smarty->assign('email',$user->email);
   $smarty->assign('country',$user->country);

  break;
  case 'homepage':
     
   $smarty->assign('homeimg',$user->homepage);
   
  break;
  case 'notifications':
     
   $smarty->assign('newsletter',$user->newsletter);
   
  break;
 endswitch;
 
}

 public function do_setuser(){
     
 global $smarty,$query,$user;

 switch($_GET['r']):
    
  case 'personal-information':

   $this->do_winfo('Personal Information');
   $this->do_usdata('personal');
   
   
  if($this->do_post($this->do_arrp('settings','f_name,l_name,email'),'*','settings')):

    /* Update Personal Information */
    
    $data = $query->addquery('update','cm_members','first_name=?,last_name=?,email=?,country=?','ssssi',[check_request('f_name'),check_request('l_name'),check_request('email'),check_request('country'),$user->id],'id=?');
    session_acv('settings','personal');
    redirect(['controller' => 'user', 'action' => 'settings?r='.$_GET['r']]);
 
  else:
   alerts('settings','personal');
   alerts('settings','required');
  endif;

  show('User/Settings/index');

 break;

 case 'change-your-password':
    
    $this->do_winfo('Change Your Password');

  if($this->do_post($this->do_arrp('pass','newpassword,confnewpassword,prepass'),'*','pass')):

    /* Update Password */
    
     $data = $query->addquery('select','cm_members','recover','i',$user->id,'id=?');
     $decodeRec = base64_decode($data->recover);
     $md5Rec = md5($decodeRec);
     $newpass = check_request('newpassword','md5');
     $Confnewpass = check_request('confnewpassword','md5');
     $prepass = check_request('prepass','md5');
     $newRecover = check_request('newpassword','base64_encode');

    if($user->password == $prepass && $newpass == $Confnewpass && $md5Rec == $prepass):
      $query->addquery('update','cm_members','password=?,recover=?','ssi',[$newpass,$newRecover,$user->id],'id=?');
      session_acv('settings','pass');
      redirect(['controller' => 'user', 'action' => 'settings?r='.$_GET['r']]);
    elseif($newpass != $Confnewpass):
      session_acv('settings','confirm');
      redirect(['controller' => 'user', 'action' => 'settings?r='.$_GET['r']]);
    elseif($md5Rec == $prepass):
      session_acv('settings','unchange');
      redirect(['controller' => 'user', 'action' => 'settings?r='.$_GET['r']]);
	else:
      session_acv('settings','unchange');
      redirect(['controller' => 'user', 'action' => 'settings?r='.$_GET['r']]);
	endif;
	
  else:
   alerts('settings','pass');
   alerts('settings','confirm');
   alerts('settings','unchange');
   alerts('pass','required');
  endif;

 show('User/Settings/password');

 break;

 case 'avatar-images':
    
    $this->do_winfo('Avatar Images');

  if($this->do_post($this->do_arrp('avatar','csrf'),'*','avatar')):

    //UPLOAD IMAGE
    
    $this->files([
      'photo' => $_FILES["photo"],
      'error' => $_FILES["photo"]["error"],
      'path' => 'template/uploads/user/avatar_',
      'controller' => 'user', 
      'action' => 'settings?r='.$_GET['r']
      ],'photo');

    /* Update Avatar Image */

    $query->addquery('update','cm_members','avatar=?','si',[$this->img(),$user->id],'id=?');
    session_acv('settings','upavatar');
    redirect(['controller' => 'user', 'action' => 'settings?r='.$_GET['r']]);
	
  else:
   alerts('settings','upavatar');
   alerts('avatar','required');
   alerts('photo','format_img');
   alerts('photo','size_img');
  endif;

 show('User/Settings/avatar');

  break;

 case 'homepage-images':
    
   $this->do_winfo('Homepage Images');
   $this->do_usdata('homepage');

  if($this->do_post($this->do_arrp('homepage','csrf'),'*','homepage')):

    //UPLOAD IMAGE
    
    $this->files([
      'photo' => $_FILES["photo"],
      'error' => $_FILES["photo"]["error"],
      'path' => 'template/uploads/user/homepage_',
      'controller' => 'user', 
      'action' => 'settings?r='.$_GET['r']
      ],'photo');

    /* Update Homepage Image */

    $query->addquery('update','cm_members','homepage=?','si',[$this->img(),$user->id],'id=?');
    session_acv('settings','homepage');
    redirect(['controller' => 'user', 'action' => 'settings?r='.$_GET['r']]);
	
  else:
   alerts('settings','homepage');
   alerts('homepage','required');
   alerts('photo','format_img');
   alerts('photo','size_img');
  endif;
  
  show('User/Settings/homep');

 break;

 case 'email-notifications':
    
   $this->do_winfo('Email Notifications');
   $this->do_usdata('notifications');

  if($this->do_post($this->do_arrp('notifications','csrf'),'*','notifications')):

    /* Update Email Notifications */
    
    $data =  $query->addquery('update','cm_members','newsletter=?','ii',[check_request('newsletter'),$user->id],'id=?');
    session_acv('settings','notifications');
    redirect(['controller' => 'user', 'action' => 'settings?r='.$_GET['r']]);
 
  else:
   alerts('settings','notifications');
   alerts('notifications','required');
  endif;
  
 show('User/Settings/newsletter');

 break;

 default:
    
   $this->do_winfo('Personal Information');
   $this->do_usdata('personal');
   
   
  if($this->do_post($this->do_arrp('settings','f_name,l_name,email'),'*','settings')):

    /* Update Personal Information */
    
    $data = $query->addquery('update','cm_members','first_name=?,last_name=?,email=?,country=?','ssssi',[check_request('f_name'),check_request('l_name'),check_request('email'),check_request('country'),$user->id],'id=?');
    session_acv('settings','personal');
    redirect(['controller' => 'user', 'action' => 'settings']);
 
  else:
   if(!isset($_GET['r'])):
    alerts('settings','personal');
    alerts('settings','required');
   endif;
  endif;

  show('User/Settings/index');

 break;

 endswitch;
     
 }

 public function do_upuser(){
     
 global $smarty,$query;

  if(isset($_POST['up-user'])):

     $data = $query->addquery('update','cm_members','role=?,status=?,username=?,first_name=?,last_name=?,email=?,balance=?','sisssssi',[check_request('role'),check_request('status',false,'int'),check_request('username'),check_request('f_name'),check_request('l_name'),check_request('email'),check_request('balance'),$_GET['id']],'id=?');

   if($data):
      $_SESSION['users']['updated']=true;
      redirect(['controller' => 'admin', 'action' => 'users/index']);
   elseif(!$data):
      $_SESSION['users']['do_error']=true;
      redirect(['controller' => 'admin', 'action' => 'users/edit/'.$_GET['id'].DS]);
   endif;
  else:
      alerts('users','do_error');
      alerts('users','required');
  endif;
     
 }

 public function do_upgenerale(){
     
 global $smarty,$query;

  if(isset($_POST['up-item'])):

     $data = $query->addquery('update','cm_items','name=?,description=?,category=?,demo_url=?,tags=?,type=?,price=?,browsers=?','ssisssisi',[check_request('name'),check_request('description'),check_request('category'),check_request('demo'),check_request('tags'),check_request('type'),check_request('price'),implode(',',$_POST['compatibleBrowsers']),$_GET['id']],'id=?');

   if($data):
      $_SESSION['items']['updated']=true;
      redirect(['controller' => 'admin', 'action' => 'items/index']);
   elseif(!$data):
      $_SESSION['items']['do_error']=true;
      redirect(['controller' => 'admin', 'action' => 'items/edit/'.$_GET['id'].DS]);
   endif;
  else:
      alerts('items','do_error');
      alerts('items','required');
  endif;
     
 }

 public function do_upfiles(){
     
 global $smarty,$query,$option;

  if(isset($_POST['up-files'])):
  
  $data = $query->addquery('select','cm_items','*','i',$_GET["id"],'id=?');

 if(!empty($_FILES["thumbnail"]["name"])):

  /* UPLOAD THUMBNAIL */
    
  $this->files([
      'photo' => $_FILES["thumbnail"],
      'error' => $_FILES["thumbnail"]["error"],
      'path' => 'template/uploads/files/thumbnail_',
      'controller' => 'admin', 
      'action' => 'items/files/'.$_GET['id'].DS
      ],'thumbnail');
      
  $thumbnail = $this->img();
 else:
  $thumbnail = $data->icon_img;
 endif;
 
 
  if(!empty($_FILES["previewImage"]["name"])):

  /* UPLOAD PREVIEW IMG */
    
  $this->files([
      'photo' => $_FILES["previewImage"],
      'error' => $_FILES["previewImage"]["error"],
      'path' => 'template/uploads/files/preview_',
      'controller' => 'admin', 
      'action' => 'items/files/'.$_GET['id'].DS
      ],'previewImage');
      
  $previewImage = $this->img();
 else:
  $previewImage = $data->preview_img;
 endif;
 
  if(!empty($_FILES["mainfiles"]["name"])):

  /* UPLOAD MAIN FILES (ZIP) */
    
  $this->ZipFiles([
      'photo' => $_FILES["mainfiles"],
      'error' => $_FILES["mainfiles"]["error"],
      'path' => 'template/uploads/items/'.strtolower($option[0][0]).'-'.$this->titlebuild($data->name).'-',
      'controller' => 'admin',
      'action' => 'items/files/'.$_GET['id'].DS,
      'extract' => 2
      ],'mainfiles');
      
  $mainfiles = $this->zip();
 else:
  $mainfiles = $data->main_file;
 endif;

     $data = $query->addquery('update','cm_items','icon_img=?,preview_img=?,main_file=?','sssi',[$thumbnail,$previewImage,$mainfiles,$_GET['id']],'id=?');

   if($data):
      $_SESSION['files']['updated']=true;
      redirect(['controller' => 'admin', 'action' => 'items/index']);
   elseif(!$data):
      $_SESSION['files']['do_error']=true;
      redirect(['controller' => 'admin', 'action' => 'items/files/'.$_GET['id'].DS]);
   endif;
  else:
      alerts('files','do_error');
      alerts('files','required');
  endif;
     
 }

 public function do_upcat(){
     
 global $smarty,$query;

  if(isset($_POST['up-cat'])):

     $data = $query->addquery('update','cm_categories','name=?,short_desc=?,enable_previewlink=?,enable_browsers=?,enable_comments=?,enable_reviews=?,status=?','ssiiiiii',[check_request('name'),check_request('short_desc'),check_request('preview_link'),check_request('compatible_browsers'),check_request('comments_section'),check_request('reviews_section'),check_request('status',false,'int'),$_GET['id']],'id=?');

   if($data):
      $_SESSION['categories']['updated']=true;
      redirect(['controller' => 'admin', 'action' => 'categories/index']);
   elseif(!$data):
      $_SESSION['categories']['do_error']=true;
      redirect(['controller' => 'admin', 'action' => 'categories/edit/'.$_GET['id'].DS]);
   endif;
  else:
      alerts('categories','do_error');
      alerts('categories','required');
  endif;
     
 }

 public function do_uptestimonial(){
     
 global $smarty,$query;

  if(isset($_POST['up-testimonial'])):

     $data = $query->addquery('update','cm_testimonials','name=?,content=?,job=?','sssi',[check_request('name'),check_request('content'),check_request('job'),$_GET['id']],'id=?');

   if($data):
      $_SESSION['testimonials']['updated']=true;
      redirect(['controller' => 'admin', 'action' => 'testimonials/index']);
   elseif(!$data):
      $_SESSION['testimonials']['do_error']=true;
      redirect(['controller' => 'admin', 'action' => 'testimonials/edit/'.$_GET['id'].DS]);
   endif;
  else:
      alerts('testimonials','do_error');
      alerts('testimonials','required');
  endif;
     
 }

 public function do_upannouncement(){
     
 global $smarty,$query;

  if(isset($_POST['up-announcement'])):

     $data = $query->addquery('update','cm_announcements','title=?,content=?','ssi',[check_request('title'),$_POST['content'],$_GET['id']],'id=?');

   if($data):
      $_SESSION['announcements']['updated']=true;
      redirect(['controller' => 'admin', 'action' => 'announcements/index']);
   elseif(!$data):
      $_SESSION['announcements']['do_error']=true;
      redirect(['controller' => 'admin', 'action' => 'announcements/edit/'.$_GET['id'].DS]);
   endif;
  else:
      alerts('announcements','do_error');
      alerts('announcements','required');
  endif;
     
 }

 public function do_upage(){
     
 global $smarty,$query;

  if(isset($_POST['up-page'])):

     $data = $query->addquery('update','cm_pages','title=?,content=?,short=?','sssi',[check_request('title'),$_POST['content'],$this->limit_text(check_request('content'),30),$_GET['id']],'id=?');

   if($data):
      $_SESSION['pages']['updated']=true;
      redirect(['controller' => 'admin', 'action' => 'pages/index']);
   elseif(!$data):
      $_SESSION['pages']['do_error']=true;
      redirect(['controller' => 'admin', 'action' => 'pages/edit/'.$_GET['id'].DS]);
   endif;
  else:
      alerts('pages','do_error');
      alerts('pages','required');
  endif;
     
 }

 public function do_upemail(){
     
 global $smarty,$query;

  if(isset($_POST['up-email'])):

     $query->addquery('update','cm_config','value=?','ss',[check_request('support_email',false,'email'),'support_email'],'header=?');
     $email_data = get_opmail(check_request('option'),check_request('host'),check_request('port'),check_request('ssl'),check_request('pass'),check_request('username'));

      write(MAILER.'CONFIG.php',$email_data,'w');
      $_SESSION['email']['mailer']=true;
      redirect(['controller' => 'admin', 'action' => 'options/email']);
  else:
      alerts('email','do_error');
      alerts('email','mailer');
  endif;
     
 }

 public function do_upayments(){
     
 global $smarty,$query;

  if(isset($_POST['up-payments'])):

      $query->addquery('update','cm_config','value=?','ss',[check_request('currency'),'currency'],'header=?');
      $query->addquery('update','cm_config','value=?','ss',[check_request('sumbole'),'sumbole'],'header=?');
      $query->addquery('update','cm_config','value=?','ss',[check_request('min_deposit'),'min_deposit'],'header=?');
      $query->addquery('update','cm_config','value=?','ss',[check_request('taxes'),'taxes'],'header=?');
      $query->addquery('update','cm_depMethods','status=?,account=?','iss',[check_request('post_paypal'),check_request('paypal_business'),'PayPal'],'methods=?');
      $query->addquery('update','cm_depMethods','status=?,publick_key=?,secret_key=?,ipn=?,account=?,address=?','issssss',[check_request('post_bitcoin'),check_request('publick_key'),check_request('secret_key'),check_request('ipn'),check_request('merchant_id'),check_request('btcaddr'),'Bitcoin'],'methods=?');
      $_SESSION['payments']['updated']=true;
      redirect(['controller' => 'admin', 'action' => 'options/payment']);
  else:
      alerts('payments','do_error');
      alerts('payments','updated');
  endif;
     
 }

 public function do_options(){
     
 global $smarty,$query,$info;

  /* generale options */

  if(isset($_POST['up-generale'])):
  
     $query->addquery('update','cm_config','value=?','ss',[check_request('name'),'name'],'header=?');
     $query->addquery('update','cm_config','value=?','ss',[check_request('site_title'),'site_title'],'header=?');
     $query->addquery('update','cm_config','value=?','ss',[check_request('site_description'),'site_description'],'header=?');
     $query->addquery('update','cm_config','value=?','ss',[check_request('account_activate_email'),'account_activate_email'],'header=?');
     $query->addquery('update','cm_config','value=?','ss',[check_request('keywords'),'keywords'],'header=?');
     $query->addquery('update','cm_config','value=?','ss',[check_request('short_desc'),'short_desc'],'header=?');
     $app_data = get_app(check_request('main_domain'),Theme,$info->install,$info->version,$info->id,$info->app,$info->start,$info->update);
      
     if(!empty(check_request('main_domain'))):
       write(CONFIG.'app.php',$app_data,'w');
       $_SESSION['options']['generale']=true;
     else:
       $_SESSION['options']['do_error']=true;
     endif;
      redirect(['controller' => 'admin', 'action' => 'options/index']);

  else:
      alerts('options','generale');
      alerts('options','do_error');
  endif;
  
  /* design options */

  if(isset($_POST['up-design'])):

   if(!empty(check_request('logo_url')) && !empty(check_request('logo_url_home')) && !empty(check_request('icon_url')) && !empty(check_request('background_image'))):
       
     /*---- img stracture -----*/

     $data = $query->addquery('update','cm_config','value=?','ss',[check_request('background_image'),'background_image'],'header=?');
     $data = $query->addquery('update','cm_config','value=?','ss',[check_request('logo_url'),'logo_url'],'header=?');
     $data = $query->addquery('update','cm_config','value=?','ss',[check_request('logo_url_home'),'logo_url_home'],'header=?');
     $data = $query->addquery('update','cm_config','value=?','ss',[check_request('icon_url'),'icon_url'],'header=?');
     
      $_SESSION['options']['design']=true;
   else:
      $_SESSION['options']['do_error']=true;
   endif;
      redirect(['controller' => 'admin', 'action' => 'options/index']);
  else:
      alerts('options','design');
  endif;
  
  /* interg options */

  if(isset($_POST['up-interg'])):

     $data = $query->addquery('update','cm_config','value=?','ss',[check_request('head_code'),'head_code'],'header=?');
     $data = $query->addquery('update','cm_config','value=?','ss',[check_request('body_code'),'body_code'],'header=?');
     $data = $query->addquery('update','cm_config','value=?','ss',[check_request('footer_code'),'footer_code'],'header=?');

     $_SESSION['options']['interg']=true;
     redirect(['controller' => 'admin', 'action' => 'options/index']);
  else:
      alerts('options','interg');
  endif;
     
  /* captcha options */

  if(isset($_POST['up-captcha'])):
 
     $data = $query->addquery('update','cm_config','value=?','ss',[check_request('reCAPTCHA_site_key'),'reCAPTCHA_site_key'],'header=?');
     $data = $query->addquery('update','cm_config','value=?','ss',[check_request('reCAPTCHA_secret_key'),'reCAPTCHA_secret_key'],'header=?');
     $data = $query->addquery('update','cm_config','value=?','ss',[check_request('captcha_signup'),'captcha_signup'],'header=?');
     $data = $query->addquery('update','cm_config','value=?','ss',[check_request('captcha_login'),'captcha_login'],'header=?');
     $data = $query->addquery('update','cm_config','value=?','ss',[check_request('captcha_forgot'),'captcha_forgot'],'header=?');
     $_SESSION['options']['captcha']=true;
     redirect(['controller' => 'admin', 'action' => 'options/index']);
     
  else:
      alerts('options','captcha');
  endif;
  
  /* system options */

  if(isset($_POST['up-system'])):

     /*---- home stracture -----*/

     $data = $query->addquery('update','cm_config','value=?','ss',[check_request('enable_home_featured'),'enable_home_featured'],'header=?');
     $data = $query->addquery('update','cm_config','value=?','ss',[check_request('enable_home_popular'),'enable_home_popular'],'header=?');
     $data = $query->addquery('update','cm_config','value=?','ss',[check_request('enable_home_why'),'enable_home_why'],'header=?');
     $data = $query->addquery('update','cm_config','value=?','ss',[check_request('enable_home_testimonial'),'enable_home_testimonial'],'header=?');
     $data = $query->addquery('update','cm_config','value=?','ss',[check_request('enable_home_announcement'),'enable_home_announcement'],'header=?');
     $data = $query->addquery('update','cm_config','value=?','ss',[check_request('language'),'language'],'header=?');

      $_SESSION['options']['system']=true;
      redirect(['controller' => 'admin', 'action' => 'options/index']);
  else:
      alerts('options','system');
  endif;
  

  /* social options */
  
  if(isset($_POST['up-social'])):
 
     $data = $query->addquery('update','cm_config','value=?','ss',[check_request('fb_link'),'fb_link'],'header=?');
     $data = $query->addquery('update','cm_config','value=?','ss',[check_request('go_link'),'go_link'],'header=?');
     $data = $query->addquery('update','cm_config','value=?','ss',[check_request('tweet_link'),'tweet_link'],'header=?');
     $data = $query->addquery('update','cm_config','value=?','ss',[check_request('pin_link'),'pin_link'],'header=?');
     $_SESSION['options']['social']=true;
     redirect(['controller' => 'admin', 'action' => 'options/index']);
  else:
      alerts('options','social');
  endif;
  
  /* security options */

  if(isset($_POST['up-security'])):

     $data = $query->addquery('update','cm_config','value=?','ss',[check_request('enable_captcha'),'enable_captcha'],'header=?');
     $data = $query->addquery('update','cm_config','value=?','ss',[check_request('reCAPTCHA_site_key'),'reCAPTCHA_site_key'],'header=?');

   if($data):
      $_SESSION['options']['security']=true;
   elseif(!$data):
      $_SESSION['options']['do_error']=true;
   endif;
      redirect(['controller' => 'admin', 'action' => 'options/index']);
  else:
      alerts('options','security');
  endif;
     
 }

 public function do_login(){
 
 global $option,$query,$ip_visit,$user,$smarty;

 /* check logged in users */

 if(islogged):
  $this->role($user->role,$user->username);
 endif;

 if($this->do_post($this->do_arrp('login','username','password'),'*','login')){

   if(reCaptcha($option['5']['0']) == true || $option['26']['0'] == '2'){

     $data = $query->addquery('select','cm_members','*','s',check_request('username'),'username=?');

    /* check user status */
    if($data->status == '2'):
       session_acv('sign','pending');
       redirect(['action' => 'oauth']);
    elseif($data->status == '3'):
       session_acv('sign','banned');
       redirect(['action' => 'oauth']);
    endif;

    /* check correct fields */
    if($data->password == check_request('password','md5')):
       $this->forcelogged($data->id);
       $query->addquery('update','cm_members','login_ip=?','si',[$ip_visit,$data->id],'id=?');
       $this->role($data->role,check_request('username'));
    else:
      session_acv('sign','invalid');
      redirect(['action' => 'oauth']);
    endif;

   }elseif(reCaptcha($option['5']['0']) == false && $option['26']['0'] == '1'){
     session_acv('sign','recaptcha');
     redirect(['action' => 'oauth']);
   }
 
 }else{
   alerts('sign','pending');
   alerts('sign','banned');
   alerts('sign','invalid');
   alerts('sign','recaptcha');
   alerts('login','required');
   alerts('sign','activated');
   alerts('sign','token_wrong');
 }
 
}

 public function do_signup(){
 global $option,$smarty,$query,$ip_visit,$dateForm;
 
  $arr = $this->do_arrp('register','username,password,passwordcheck,email,f_name,l_name');

 if ($this->do_post($arr,'*','register')){
  
   if(reCaptcha($option['5']['0']) == true || $option['26']['0'] == '2'){
     if($this->find((object)['word' => check_request('email',false,'email'),'role' => 'email'])){
        session_acv('signup','rep_email');
        redirect(['action' => 'oauth']);
     }
     if(check_request('password','md5') != check_request('passwordcheck','md5')){
        session_acv('signup','passwords');
        redirect(['action' => 'oauth']);
     }

    if($this->find((object)['word' => check_request('username'),'role' => 'username'])){
       session_acv('signup','rep_username');
       redirect(['action' => 'oauth']);
    }


 $username = check_request('username');
 $pass = check_request('password','md5');
 $email = check_request('email',false,'email');
 $recover = check_request('password','base64_encode');
 $first_name = check_request('f_name');
 $last_name = check_request('l_name');
 $newsletter = check_request('signup_newsletter');
 $since = date("F").' '.date("Y");

 $data = $query->addquery('insert','cm_members','username,password,email,first_name,last_name,recover,register_ip,created,newsletter,since','ssssssssis',[$username,$pass,$email,$first_name,$last_name,$recover,$ip_visit,$dateForm,$newsletter,$since]);

 if($option['23']['0'] == '2'){
   session_acv('sign','express_login');
   redirect(['action' => 'oauth']);
 }elseif($option['23']['0'] == '1'){

 $genToken = $this->genToken(16);
 $mail_encode = check_request('email','base64_encode');
 $query->addquery('update','cm_members','status=?,token=?','isi',['2',$genToken,$data],'id=?');
 $this->do_maildata('activate',$first_name,'<a href="'.HOST.'verify/'.$genToken.'/">Confirm Your Address</a>');
 mailer(['from'=> 'noreply@codsem.com','to'=> $email,'subject' => 'Confirm Your Account at '.$option[0][0],'msg'=> fetch('Admin/Mailer/index')]);
 
      session_acv('signup','mail_sent');
      redirect(['action' => 'oauth']);

 }
 
 }elseif(reCaptcha($option['5']['0']) == false && $option['27']['0'] == '1'){
   session_acv('sign','recaptcha');
   redirect(['action' => 'oauth']);
  }
 }else{
 alerts('signup','rep_email');
 alerts('signup','passwords');
 alerts('signup','rep_username');
 alerts('signup','mail_sent');
 alerts('success','expired');
 alerts('sign','express_login');
 alerts('register','required');
 }
}
 
 public function do_verify_mail(){
    
 global $query;
 
 if(!isset($_GET['id']) || empty($_GET['id'])):
  $this->do_404();
 endif;

 $data = $query->addquery('select','cm_members','*','s',$_GET['id'],'token=?');

  if(!$data):
    $_SESSION['sign']['token_wrong']=true;
    redirect(['action' => 'oauth']);
  elseif($_GET['id'] == $data->token):
    $query->addquery('update','cm_members','token=?,status=?','sis',['','1',$data->token],'token=?');
    $_SESSION['sign']['activated']=true;
    redirect(['action' => 'oauth']);
  endif;
 
 }
 
 public function do_forgot_password(){
    
 global $query,$user,$option,$smarty;
 
 /* check logged in users */

 if(islogged):
  $this->role($user->role,$user->username);
 endif;

 $this->do_winfo('Forgot Your Password');

 if(isset($_GET['id'])){

 $rec_token = $_GET['id'];
 $data = $query->addquery('select','cm_members','*','s',$rec_token,'token=?');

 if(!$data):
  $_SESSION['gpass']['inrecover']=true;
  redirect(['action' => 'forgot-password']);
 endif;

  if($rec_token == $data->token){

    $query->addquery('update','cm_members','token=?','ss',['',$data->id],'id=?');
    $this->do_maildata('gpass',$data->first_name,base64_decode($data->recover));
    mailer(['from'=> 'noreply@codsem.com','to'=>$data->email,'subject' =>'Your Password '.$option[0][0],'msg'=>fetch('Admin/Mailer/index')]);
    $_SESSION['gpass']['recovered']=true;
    redirect(['action' => 'forgot-password']);

  }

 }else{
  alerts('gpass','recovered');
  alerts('gpass','inrecover');
 }


 if($this->do_post($this->do_arrp('rec','username'),'*','rec')){

  if (empty($option[12][0])):
      errorAndDie('Administration not specified their email');
  endif;
   
   if(reCaptcha($option['5']['0']) == true || $option['28']['0'] == '2'){

     $data = $query->addquery('select','cm_members','*','s',check_request('username'),'username=?');

    /* look for user */
     if(!$data):
       session_acv('fpass','not_found');
       redirect(['action' => 'forgot-password']);
     endif;

    $rec_token = $this->genToken(16);
    $query->addquery('update','cm_members','token=?','ss',[$rec_token,check_request('username')],'username=?');
    $this->do_maildata('recover',$data->first_name,'<a href="'.HOST.'forgot-password/'.$rec_token.'/">Confirm</a>');
   
    mailer([
        'from'=> 'noreply@codsem.com',
        'to'=>$data->email,
        'subject' =>'Confirm Password Recover',
        'msg'=>fetch('Admin/Mailer/index')]);
        
    session_acv('fpass','sent');
    redirect(['action' => 'forgot-password']);

   }elseif(reCaptcha($option['5']['0']) == false && $option['28']['0'] == '1'){
     session_acv('fpass','recaptcha');
     redirect(['action' => 'forgot-password']);
   }
 
 }else{
   alerts('fpass','sent');
   alerts('fpass','not_found');
   alerts('fpass','recaptcha');
   alerts('rec','required');
 }
 
 
 }

 public function do_profile($member){
 
 global $smarty,$query;
 
 $p_itm = $query->addquery('select','cm_items','sum(sales) as sales','ii',"$member->id,1",'user_id=?,status=?');
 
 $p_getitm = $query->addquery('select','cm_items','count(id) as items','ii',"$member->id,1",'user_id=?,status=?');
 
 $smarty->assign('profile_adm_items',number_format($p_getitm->items));
 
 $smarty->assign('profile_adm_sales',number_format($p_itm->sales));

 $smarty->assign('country',$member->country);

 $smarty->assign('homepage',$member->homepage);

 $smarty->assign('username',$member->username);

 $smarty->assign('avatar',$member->avatar);

 $smarty->assign('since',$member->since);

 $smarty->assign('role',$member->role);

 $smarty->assign('uid_profile',$member->id);

 $role = str_replace('.php','',$_GET['role']);

 switch($role):
  
  case 'portfolio':
      
    $this->do_tabs(false,true);

    $this->do_winfo('Portfolio');

    $this->do_portfolio($member->id);

    show('User/Portfolio/index');

  break;
  
  default:
    
    $this->do_tabs(true);

    $this->do_winfo($member->username);

    show('User/Profile/index');

  break;

 endswitch;

}

 public function do_portfolio($id){
 
 global $smarty,$query,$result;
 
 $data = $query->limit('cm_items','*','sales','asc',$result['start'].','.$result['perpage'],'ii',"$id,1",'user_id=?,status=?');

 $with = array();
 
 while($res=$data->fetch_assoc()):
    
 $arr=array('id'=>$res['id'],'name'=>$res['name'],'price'=>$res['price'],'icon_img'=>$res['icon_img'],'preview_img'=>$res['preview_img'],'sales'=>$res['sales'],'stars'=>$res['stars'],'username'=>$this->do_username($res['user_id']),'title_link'=>$this->TitleBuild($res['name']));

 array_push($with,$arr);

 endwhile;
  paging($result['screen']+1,ceil($query->num_rows('cm_items','*','ii',"$id,1",'user_id=?,status=?')/$result['perpage'])+1,'portfolio&p=');
  $smarty->assign('portfolio',$with);

 }

 public function do_username($id){
 
 global $query;
 
 $do = $query->addquery('select','cm_members','username','i', $id,'id=?');
 return $do->username;
 
 }

 public function do_userinfo($id){
 
 global $query;
 
 $do = $query->addquery('select','cm_members','*','i', $id,'id=?');
 
 return $do;
 
 }

 public function do_testimonial($m){
 
 global $option,$smarty,$query;
 
 switch($m):
 
  case 'limit':
      
   $data = $query->addquery('fetch','cm_testimonials','*','i',1,'status=?');
 
  break;

  case 'fetch':
      
   $data = $query->limit('cm_testimonials','*','id','desc','0,8','i','1','status=?');

  break;

 endswitch;
 
 $with = array();
 
 while($res=$data->fetch_assoc()):
    
 $arr=array('id'=>$res['id'],'name'=>$res['name'],'avatar'=>$res['image'],'content'=>$res['content'],'job'=>$res['job']);

 array_push($with,$arr);

 endwhile;

 $smarty->assign('testimonial',$with);

}

 public function do_products($cat,$link=false,$nam=false){
 
 global $smarty,$query,$result;
 
 $data = $query->limit('cm_items','*','sales','asc','6','i',$cat,'category=?');

 $with = array();
 
 while($res=$data->fetch_assoc()):
    
 $arr=array('id'=>$res['id'],'name'=>$res['name'],'price'=>$res['price'],'icon_img'=>$res['icon_img'],'preview_img'=>$res['preview_img'],'sales'=>$res['sales'],'stars'=>$res['stars'],'username'=>$this->do_username($res['user_id']),'link'=>$this->TitleBuild($res['name']));

 array_push($with,$arr);

 endwhile;

 if(!$nam):
    
  $smarty->assign('related',$with);

 else:
    
  $smarty->assign($nam,$with);
  
 endif;

 if(isset($link)):

 paging($result['screen']+1,ceil($query->num_rows('cm_items','*','i',$cat,'category=?')/$result['perpage'])+1,$link.'&p=');

 endif;

}

 public function do_reviews($id){

 global $smarty,$query,$result;

 $data = $query->limit('cm_reviews','*','id','desc',$result['start'].','.$result['perpage'],'ii', "$id,1",'item_id=?,status=?');

 $with = array();
 
 while($res=$data->fetch_assoc()):
    
 $arr=array('id'=>$res['id'],'username'=>$this->do_username($res['user_id']),'avatar'=>$this->do_userinfo($res['user_id'])->avatar,'review'=>$res['review'],'stars'=>$res['stars'],'ago'=>$this->time_elapsed_string($res['ago']));

 array_push($with,$arr);

 endwhile;

 $smarty->assign('wrv',$with);

 paging($result['screen']+1,ceil($query->num_rows('cm_reviews','*','ii',"$id,1",'item_id=?,status=?')/$result['perpage'])+1,'&p=');

}

 public function do_comments($id){

 global $smarty,$query,$result;

 $data = $query->limit('cm_comments','*','id','desc',$result['start'].','.$result['perpage'],'ii', "$id,1",'item_id=?,status=?');

 $with = array();
 
 while($res=$data->fetch_assoc()):
    
 $arr=array('id'=>$res['id'],'username'=>$this->do_username($res['user_id']),'avatar'=>$this->do_userinfo($res['user_id'])->avatar,'isauthor'=>$res['isauthor'],'ispurchased'=>$res['ispurchased'],'comment'=>$res['comment'],'ago'=>$this->time_elapsed_string($res['ago']));

 array_push($with,$arr);

 endwhile;

 $smarty->assign('wcm',$with);

 paging($result['screen']+1,ceil($query->num_rows('cm_comments','*','ii',"$id,1",'item_id=?,status=?')/$result['perpage'])+1,'&p=');

}

 public function do_adcm(){

 global $smarty,$query,$result;

 $data = $query->limit('cm_comments','*','id','desc',$result['start'].','.$result['perpage']);

 $with = array();

 
 while($res=$data->fetch_assoc()):
    
 $arr=array('id'=>$res['id'],'item_id'=>$res['item_id'],'user_id'=>$res['user_id'],'username'=>$this->do_username($res['user_id']),'ispurchased'=>$res['ispurchased'],'comment'=>$this->limit_text($res['comment'],10),'status'=>$res['status'],'created'=>$res['created'],'link'=>$this->TitleBuild($this->do_itm($res['item_id'],'name')));

 array_push($with,$arr);

 endwhile;

 $smarty->assign('comments',$with);

 paging($result['screen']+1,ceil($query->num_rows('cm_comments','*')/$result['perpage'])+1,'comments&p=');

}

 public function do_adrev(){

 global $smarty,$query,$result;

 $data = $query->limit('cm_reviews','*','id','desc',$result['start'].','.$result['perpage']);

 $with = array();

 
 while($res=$data->fetch_assoc()):
    
 $arr=array('id'=>$res['id'],'item_id'=>$res['item_id'],'user_id'=>$res['user_id'],'stars'=>$res['stars'],'username'=>$this->do_username($res['user_id']),'review'=>$this->limit_text($res['review'],5),'status'=>$res['status'],'created'=>$res['created'],'link'=>$this->TitleBuild($this->do_itm($res['item_id'],'name')));

 array_push($with,$arr);

 endwhile;

 $smarty->assign('reviews',$with);

 paging($result['screen']+1,ceil($query->num_rows('cm_reviews','*')/$result['perpage'])+1,'reviews&p=');

}

 public function do_statements(){

 global $smarty,$query,$result,$user;

 $data =  $query->limit('cm_statement','*','id','desc',$result['start'].','.$result['perpage'],'ii',"$user->id,1",'user_id=?,status=?');

 $with =array();

 while($res=$data->fetch_assoc()):
    
 $arr=array('id'=>$res['id'],'amount'=>$res['amount'],'item_id'=>$res['item_id'],'type'=>$res['type'],'name'=>$this->do_itm($res['item_id'],'name'),'created'=>$res['created'],'title_name'=>$this->TitleBuild($this->do_itm($res['item_id'],'name')));

 array_push($with,$arr);

 endwhile;

 $smarty->assign('statements',$with);

 paging($result['screen']+1,ceil($query->num_rows('cm_statement','*','ii',"$user->id,1",'user_id=?,status=?')/$result['perpage'])+1,'statement?p=');

}

 public function do_downloads($role){

 global $smarty,$query,$result,$user;

 switch($role):
  case 'usr':
  $data = $query->limit('cm_downloads','*','id','desc',$result['start'].','.$result['perpage'],'ii',"$user->id,1",'user_id=?,status=?');
  paging($result['screen']+1,ceil($query->num_rows('cm_downloads','*','ii',"$user->id,1",'user_id=?,status=?')/$result['perpage'])+1,'downloads?p=');
  break;
  case 'adm':
  $data = $query->limit('cm_downloads','*','id','desc',$result['start'].','.$result['perpage']);
  paging($result['screen']+1,ceil($query->num_rows('cm_downloads','*')/$result['perpage'])+1,'downloads?p=');
  break;
 endswitch;

  $with = array();
  while($res=$data->fetch_assoc()):
  $arr=array('id'=>$res['id'],'item_id'=>$res['item_id'],'user_id'=>$res['user_id'],'purchase_key'=>$res['purchase_key'],'user'=>$this->do_username($res['user_id']),'name'=>$this->do_itm($res['item_id'],'name'),'price'=>$this->do_itm($res['item_id'],'price'),'icon_img'=>$this->do_itm($res['item_id'],'icon_img'),'status'=>$res['status'],'created'=>$res['created'],'link'=>$this->TitleBuild($this->do_itm($res['item_id'],'name')));
  array_push($with,$arr);
  endwhile;

  $smarty->assign('download',$with);

}

 public function do_sales(){

 global $smarty,$query,$result;

  $data = $query->limit('cm_downloads','*','id','desc',$result['start'].','.$result['perpage']);
  paging($result['screen']+1,ceil($query->num_rows('cm_downloads','*')/$result['perpage'])+1,'index?p=');
 
 $with = array();
 
 while($res=$data->fetch_assoc()):
    
 $arr=array('id'=>$res['id'],'item_id'=>$res['item_id'],'user_id'=>$res['user_id'],'amount'=>$res['amount'],'user'=>$this->do_username($res['user_id']),'name'=>$this->do_itm($res['item_id'],'name'),'price'=>$this->do_itm($res['item_id'],'price'),'key'=>$res['purchase_key'],'status'=>$res['status'],'created'=>$res['created'],'link'=>$this->TitleBuild($this->do_itm($res['item_id'],'name')));

 array_push($with,$arr);

 endwhile;

 $smarty->assign('sales',$with);

}

 public function do_members(){

 global $smarty,$query,$result;

  $data = $query->limit('cm_members','*','id','desc',$result['start'].','.$result['perpage']);
  paging($result['screen']+1,ceil($query->num_rows('cm_members','*')/$result['perpage'])+1,'index?p=');
 
 $with = array();
 
 while($res=$data->fetch_assoc()):
    
 $ar=array('id'=>$res['id'],'role'=>$res['role'],'status'=>$res['status'],'username'=>$res['username'],'email'=>$res['email'],'login_ip'=>$res['login_ip'],'register_ip'=>$res['register_ip'],'created'=>$res['created']);
 
 array_push($with,$ar);

 endwhile;

 $smarty->assign('members',$with);
 alerts('users','updated');

}

 public function do_invoices($role=false){

 global $smarty,$query,$result,$user;
 
 if(!$role):
  $data = $query->limit('cm_invoice','*','id','desc',$result['start'].','.$result['perpage']);
  paging($result['screen']+1,ceil($query->num_rows('cm_invoice','*')/$result['perpage'])+1,'index?p=');
 else:
  $data = $query->limit('cm_invoice','*','id','desc',$result['start'].','.$result['perpage'],'iii',"$user->id,$role,1",'user_id=?,type=?,status=?');
  paging($result['screen']+1,ceil($query->num_rows('cm_invoice','*','iii',"$user->id,$role,1",'user_id=?,type=?,status=?')/$result['perpage'])+1,'index?p=');
 endif;
 
 $with = array();
 
 while($res=$data->fetch_assoc()):
    
 $ar=array('id'=>$res['id'],'user_id'=>$res['user_id'],'username'=>$this->do_username($res['user_id']),'amount'=>$res['amount'],'method'=>$res['method'],'type'=>$res['type'],'token'=>$res['token'],'status'=>$res['status'],'created'=>$res['created']);
 
 array_push($with,$ar);

 endwhile;

 $smarty->assign('invoices',$with);

}

 public function do_transactions(){

 global $smarty,$query,$result;
 
  $data = $query->limit('cm_payments','*','id','desc',$result['start'].','.$result['perpage']);
  paging($result['screen']+1,ceil($query->num_rows('cm_payments','*')/$result['perpage'])+1,'transactions?p=');
 
 $with = array();
 
 while($res=$data->fetch_assoc()):
    
 $ar=array('id'=>$res['id'],'user_id'=>$res['user_id'],'username'=>$this->do_username($res['user_id']),'txn_id'=>$res['txn_id'],'item_number'=>$res['item_number'],'payment_gross'=>$res['payment_gross'],'amount_btc'=>$res['amount_btc'],'currency_code'=>$res['currency_code'],'type'=>$res['type'],'payment_status'=>$res['payment_status'],'created'=>$res['created']);
 
 array_push($with,$ar);

 endwhile;

 $smarty->assign('transactions',$with);

}

 public function do_testimonials(){

 global $smarty,$query,$result;
 
  $data = $query->limit('cm_testimonials','*','id','desc',$result['start'].','.$result['perpage']);
  paging($result['screen']+1,ceil($query->num_rows('cm_testimonials','*')/$result['perpage'])+1,'index&p=');
 
 $with = array();
 
 while($res=$data->fetch_assoc()):
    
 $ar=array('id'=>$res['id'],'name'=>$res['name'],'image'=>$res['image'],'status'=>$res['status'],'created'=>$res['created']);
 
 array_push($with,$ar);

 endwhile;

 $smarty->assign('testimonials',$with);
 alerts('testimonials','updated');
 alerts('testimonials','added');
}

 public function do_announcements($role=false){

 global $smarty,$query,$result;
 
 if($role):
  $data = $query->addquery('fetch','cm_announcements','*','i','1','status=?');
 else:
  $data = $query->limit('cm_announcements','*','id','desc',$result['start'].','.$result['perpage']);
  paging($result['screen']+1,ceil($query->num_rows('cm_announcements','*')/$result['perpage'])+1,'index?p=');
  alerts('announcements','added');
  alerts('announcements','updated');
 endif;
 
 $with = array();
 
 while($res=$data->fetch_assoc()):
    
 $ar=array('id'=>$res['id'],'title'=>$res['title'],'content'=>$res['content'],'status'=>$res['status'],'created'=>$res['created']);
 
 array_push($with,$ar);

 endwhile;
 
 $smarty->assign('announcements',$with);

}

 public function do_categories($role){
 
 global $smarty,$query,$result;
  
  switch($role):
   case 'usr':
    $data = $query->limit('cm_categories','*','id','desc','0,10','i','1','status=?');
   break;
   case 'adm':
    $data = $query->addquery('fetch','cm_categories','*','i','1','status=?');
   break;
   case 'type':
    $data = $query->addquery('select','cm_categories','*','i',$_GET[$role],'id=?');
    $smarty->assign('enable_browsers',$data->enable_browsers);
    $smarty->assign('enable_previewlink',$data->enable_previewlink);
   break;
  endswitch;

 if($role != 'type'):
  $with = array();
  while($res=$data->fetch_assoc()):
  $arr=array('id'=>$res['id'],'name'=>$res['name'],'link'=>$res['link'],'enable_browsers'=>$res['enable_browsers'],'enable_screenshots'=>$res['enable_screenshots'],'enable_previewlink'=>$res['enable_previewlink'],'status'=>$res['status'],'created'=>$res['created']);
  array_push($with,$arr);
  endwhile;
  //assign
  $smarty->assign('categories',$with);
 endif;

}

 public function do_admcats(){
 
 global $smarty,$query,$result;
  
   $data = $query->limit('cm_categories','*','id','desc',$result['start'].','.$result['perpage']);
   paging($result['screen']+1,ceil($query->num_rows('cm_categories','*')/$result['perpage'])+1,'index?p=');
   alerts('categories','added');
   alerts('categories','updated');

 $with = array();
 
 while($res=$data->fetch_assoc()):
    
 $arr=array('id'=>$res['id'],'name'=>$res['name'],'link'=>$res['link'],'status'=>$res['status'],'created'=>$res['created']);

 array_push($with,$arr);

 endwhile;
 
 if(!endsWith(ACCESS, 'categories/add')):
     
 $smarty->assign('adm_cats',$with);

 endif;
 
}

 public function do_pages($role=false){
 
 global $smarty,$query,$result;
      
   if($role):
   $data = $query->limit('cm_pages','*','id','desc',$result['start'].','.$result['perpage']);
   paging($result['screen']+1,ceil($query->num_rows('cm_pages','*')/$result['perpage'])+1,'index?p=');
   alerts('pages','added');
   alerts('pages','updated');
   else:
   $data = $query->limit('cm_pages','*','id','desc','0,7','ii','2,1','protect=?,status=?');
   endif;
   
 $with = array();
 
 while($res=$data->fetch_assoc()):
    
 $arr=array('id'=>$res['id'],'title'=>$res['title'],'status'=>$res['status'],'protect'=>$res['protect'],'created'=>$res['created']);

 array_push($with,$arr);

 endwhile;

 if(!endsWith(ACCESS, 'pages/add')):
     
 $smarty->assign('pages',$with);

 endif;

}

 public function do_protected_pages(){
 
 global $smarty,$query,$result;
      
   $data = $query->limit('cm_pages','*','id','desc','0,7','ii','1,1','protect=?,status=?');
   
 $with = array();
 while($res=$data->fetch_assoc()):
 $arr=array('id'=>$res['id'],'title'=>$res['title'],'status'=>$res['status'],'protect'=>$res['protect'],'created'=>$res['created']);
 array_push($with,$arr);
 endwhile;

 $smarty->assign('protected',$with);

}

 public function do_themes($role=false){
 
 global $smarty,$query,$result;
      
 $data = $query->limit('cm_themes','*','id','asc','0,8');
 paging($result['screen']+1,ceil($query->num_rows('cm_themes','*')/8)+1,'themes?p=');

 $with = array();
 
 while($res=$data->fetch_assoc()){

 $ar=array('id'=>$res['id'],'name'=>$res['name'],'status'=>$res['status'],'created'=>$res['created']);

 array_push($with,$ar);

 }

 $smarty->assign('themes',$with);

}

 public function do_allproducts($r){
 
 global $smarty,$query;
      
   $data = $query->limit('cm_items','*','sales','desc',$r['start'].','.$r['perpage'],'i',1,'status=?');

 $with = array();
 
 while($res=$data->fetch_assoc()):
    
 $arr=array('id'=>$res['id'],'username'=>$this->do_username($res['user_id']),'icon_img'=>$res['icon_img'],'preview_img'=>$res['preview_img'],'name'=>$res['name'],'browsers'=>$res['browsers'],'price'=>$res['price'],'sales'=>$res['sales'],'stars'=>$res['stars'],'link'=>$this->titlebuild($res['name']));

 array_push($with,$arr);

 endwhile;

 $smarty->assign('allproducts',$with);

 paging($r['screen']+1,ceil($query->num_rows('cm_items','*','i',"1",'status=?')/$r['perpage'])+1,'all&p=');

}

 public function do_catproducts($r){
 
 global $smarty,$query;
      
   $data = $query->limit('cm_items','*','sales','desc',$r['start'].','.$r['perpage'],'i',1,'status=?');

 $with = array();
 
 while($res=$data->fetch_assoc()):
    
 $arr=array('id'=>$res['id'],'username'=>$this->do_username($res['user_id']),'icon_img'=>$res['icon_img'],'preview_img'=>$res['preview_img'],'name'=>$res['name'],'browsers'=>$res['browsers'],'price'=>$res['price'],'sales'=>$res['sales'],'stars'=>$res['stars'],'link'=>$this->TitleBuild($res['name']));

 array_push($with,$arr);

 endwhile;

 $smarty->assign('allproducts',$with);

 paging($r['screen']+1,ceil($query->num_rows('cm_items','*','i',"1",'status=?')/$r['perpage'])+1,'all&p=');

}

 public function do_search(){
 
 global $option,$query,$smarty,$result;

 /* search items */

 if(isset($_GET['term'])):
    
  $smarty->assign('term',$_GET['term']);
  $term = $_GET['term'];
  $lmt = $result['start'].','.$result['perpage'];

  $search = $query->normal("select * from cm_items where name like '%$term%' ORDER BY sales desc LIMIT $lmt");

  $wsearch =array();
  while($res=$search->fetch_assoc()):
   $arsearch=array('id'=>$res['id'],'username'=>$this->do_username($res['user_id']),'icon_img'=>$res['icon_img'],'preview_img'=>$res['preview_img'],'name'=>$res['name'],'category'=>$res['category'],'browsers'=>$res['browsers'],'price'=>$res['price'],'sales'=>$res['sales'],'stars'=>$res['stars'],'title_link'=>$this->TitleBuild($res['name']));
   array_push($wsearch,$arsearch);
  endwhile;
   $smarty->assign('wsearch',$wsearch);
   paging($result['screen']+1,ceil($query->num_rows('cm_items','*','s',"%$term%",'name like ?')/$result['perpage'])+1,'&p=');

 else:
    
  $smarty->assign('term','');
  $search = $query->limit('cm_items','*','sales','desc',$result['start'].','.$result['perpage'],'i','1','status=?');
  $wsearch =array();

  while($res=$search->fetch_assoc()):
   $arsearch=array('id'=>$res['id'],'username'=>$this->do_username($res['user_id']),'icon_img'=>$res['icon_img'],'preview_img'=>$res['preview_img'],'name'=>$res['name'],'category'=>$res['category'],'browsers'=>$res['browsers'],'price'=>$res['price'],'sales'=>$res['sales'],'title_link'=>$this->TitleBuild($res['name']));
   array_push($wsearch,$arsearch);
  endwhile;
   $smarty->assign('wsearch',$wsearch);
   paging($result['screen']+1,ceil($query->num_rows('cm_items','*','i',"1",'status=?')/$result['perpage'])+1,'&p=');

 endif;
 
}

 public function do_tags(){
 
 global $option,$query,$smarty,$result;

 /* tags */

if(isset($_GET['term'])):
 $term = str_replace('.php','',$_GET['term']);
 $term = str_replace('-',' ',$term);
 $this->do_winfo('Results for '.$term);
 $smarty->assign('term',$term);
 $lmt = $result['start'].','.$result['perpage'];
 $tags = $query->normal("select * from cm_items where tags like '%$term%' ORDER BY sales desc LIMIT $lmt");
 $wtags =array();
 while($res=$tags->fetch_assoc()):
 $artags=array('id'=>$res['id'],'username'=>$this->do_username($res['user_id']),'icon_img'=>$res['icon_img'],'preview_img'=>$res['preview_img'],'name'=>$res['name'],'category'=>$res['category'],'browsers'=>$res['browsers'],'price'=>$res['price'],'sales'=>$res['sales'],'stars'=>$res['stars'],'title_link'=>$this->TitleBuild($res['name']));
 array_push($wtags,$artags);
 endwhile;
 $smarty->assign('wtags',$wtags);
 paging($result['screen']+1,ceil($query->num_rows('cm_items','*','s',"%$term%",'tags like ?')/$result['perpage'])+1,'&p=');
else:
 $this->do_404();
endif;
 
}

 public function do_freebee(){
 
 global $smarty,$query,$result;

 /* freebee */
 $data = $query->limit('cm_items','*','id','desc',$result['start'].','.$result['perpage'],'is',"1,free",'status=?,type=?');
 $with = array();
 while($res=$data->fetch_assoc()):
  $ar=['id'=>$res['id'],'username'=>$this->do_username($res['user_id']),'icon_img'=>$res['icon_img'],'preview_img'=>$res['preview_img'],'name'=>$res['name'],'browsers'=>$res['browsers'],'price'=>$res['price'],'sales'=>$res['sales'],'stars'=>$res['stars'],'title_link'=>$this->TitleBuild($res['name'])];
  array_push($with,$ar);
 endwhile;
 $smarty->assign('freebee',$with);

   paging($result['screen']+1,ceil($query->num_rows('cm_items','*','is',"1,free",'status=?,type=?')/$result['perpage'])+1,'?p=');

}

 public function do_popularitems($p=false){
   
 global $smarty,$query,$result;

 if($p):
   $data = $query->limit('cm_items','*','stars','desc',$result['start'].','.$result['perpage'],'si','is_popular=?,status=?');
   paging($result['screen']+1,ceil($query->num_rows('cm_items','*','si',"1,1",'is_popular=?,status=?')/$result['perpage'])+1,'popular?p=');
 else:
   $data = $query->limit('cm_items','*','id','desc','3','si',"1,1",'is_popular=?,status=?');
 endif;
 
 $with = array();

 while($res=$data->fetch_assoc()){
    
 $ar=['id'=>$res['id'],'username'=>$this->do_username($res['user_id']),'icon_img'=>$res['icon_img'],'preview_img'=>$res['preview_img'],'name'=>$res['name'],'browsers'=>$res['browsers'],'price'=>$res['price'],'sales'=>$res['sales'],'stars'=>$res['stars'],'title_link'=>$this->TitleBuild($res['name'])];

 array_push($with,$ar);

 }

 $smarty->assign('wpopular',$with);
 
 }

 public function do_featureditems($p=false){
   
 global $smarty,$query,$result;

 if($p):
   $data = $query->limit('cm_items','*','sales','desc',$result['start'].','.$result['perpage'],'si',"1,1",'is_featured=?,status=?');
   paging($result['screen']+1,ceil($query->num_rows('cm_items','*','si',"1,1",'is_featured=?,status=?')/$result['perpage'])+1,'featured?p=');
 else:
   $data = $query->limit('cm_items','*','id','desc','3','si',"1,1",'is_featured=?,status=?');
 endif;
 
 $with = array();

 while($res=$data->fetch_assoc()){
    
 $ar=['id'=>$res['id'],'username'=>$this->do_username($res['user_id']),'icon_img'=>$res['icon_img'],'preview_img'=>$res['preview_img'],'name'=>$res['name'],'browsers'=>$res['browsers'],'price'=>$res['price'],'sales'=>$res['sales'],'stars'=>$res['stars'],'title_link'=>$this->TitleBuild($res['name'])];

 array_push($with,$ar);

 }

 $smarty->assign('wfeatured',$with);
 
 }

 public function do_newitems(){
   
 global $smarty,$query,$result;

 $data = $query->limit('cm_items','*','id','desc','9','i',1,'status=?');
 
 $with = array();

 while($res=$data->fetch_assoc()){
    
 $ar=['id'=>$res['id'],'username'=>$this->do_username($res['user_id']),'icon_img'=>$res['icon_img'],'preview_img'=>$res['preview_img'],'name'=>$res['name'],'browsers'=>$res['browsers'],'price'=>$res['price'],'sales'=>$res['sales'],'stars'=>$res['stars'],'title_link'=>$this->TitleBuild($res['name'])];

 array_push($with,$ar);

 }

 $smarty->assign('wnew',$with);
 
 }

 public function do_items(){
 global $smarty,$query,$result;

 $data = $query->limit('cm_items','*','id','desc',$result['start'].','.$result['perpage']);

 $with = array();
 while($res=$data->fetch_assoc()){
  $ar=['id'=>$res['id'],'name'=>$res['name'],'demo_url'=>$res['demo_url'],'main_file'=>$res['main_file'],'sales'=>$res['sales'],'price'=>$res['price'],'category'=>$this->LoadCat($res['category']),'status'=>$res['status']];
  array_push($with,$ar);
 }

 $smarty->assign('items',$with);
 paging($result['screen']+1,ceil($query->num_rows('cm_items','*')/$result['perpage'])+1,'index?p=');
 alerts('items','updated');
 alerts('files','updated');
 }

 public function do_activate($r,$a){
 
 global $smarty,$query,$info;
      
 if( isset($_POST['activate'])):
   $data = $query->addquery('update','cm_'.$r,'status=?','ii',[1,check_request('id',false,'int')],'id=?');
   
   if($r == 'invoice'):
   $query->addquery('update','cm_members','balance=balance+?','si',[check_request('am'),check_request('uid',false,'int')],'id=?');
   elseif($r == 'themes'):
   write(CONFIG.'app.php',get_app($HOST,check_request('name'),$info->install,$info->version,$info->id,$info->app,$info->start,$info->update),'w');
   endif;
   
   if($data):
      $_SESSION['activate']['activated']=true;
   elseif(!$data):
      $_SESSION['activate']['do_error']=true;
   endif;
      redirect(['controller' => 'admin', 'action' => $a]);
 else:
      alerts('activate','activated');
      alerts('activate','do_error');
 endif;
   
 }

 public function do_deactivate($r,$a){
 
 global $smarty,$query;
      
 if( isset($_POST['deactivate'])):
   $data = $query->addquery('update','cm_'.$r,'status=?','ii',[2,check_request('id',false,'int')],'id=?');
   if($data):
      $_SESSION['deactivate']['deactivated']=true;
   elseif(!$data):
      $_SESSION['deactivate']['do_error']=true;
   endif;
      redirect(['controller' => 'admin', 'action' => $a]);
 else:
      alerts('deactivate','deactivated');
      alerts('deactivate','do_error');
 endif;
   
 }

 public function do_refund(){
 
 global $smarty,$query;
      
 if( isset($_POST['refund'])):
   $data = $query->addquery('update','cm_downloads','status=?','ii',[3,check_request('id',false,'int')],'id=?');
   $data = $query->addquery('update','cm_members','balance=balance+?','si',[check_request('am'),check_request('user_id',false,'int')],'id=?');

   if($data):
      $_SESSION['refund']['refunded']=true;
   elseif(!$data):
      $_SESSION['refund']['do_error']=true;
   endif;
      redirect(['controller' => 'admin', 'action' => 'sales/index']);
 else:
      alerts('refund','refunded');
      alerts('refund','do_error');
 endif;
   
 }
 
 public function do_download(){

 global $query,$user;

 if(!isset($_GET['id'])):
  $this->do_404();
 endif;
  $key = $_GET['id'];
  $download = $query->addquery('select','cm_downloads','item_id','is', "$user->id,$key",'user_id=?,purchase_key=?');
  if(!$download):
   $this->do_404();
  endif;
  $item = $query->addquery('select','cm_items','*','i',$download->item_id,'id=?');

 if(!$item):
  $this->do_404();
 endif;

    
   //start download
     
   $file = WWW_ROOT.'template/uploads/items/'.DS.basename($item->main_file);
 
     if (headers_sent()) {
        exit('HTTP header already sent');
     } else {
      if (!is_file($file)) {
        header($_SERVER['SERVER_PROTOCOL'].' 404 Not Found');
        exit('File not found');
      } else if (!is_readable($file)) {
        header($_SERVER['SERVER_PROTOCOL'].' 403 Forbidden');
        exit('File not readable');
      } else {

        header($_SERVER['SERVER_PROTOCOL'].' 200 OK');
        header("Content-Type: application/zip");
        header("Content-Transfer-Encoding: Binary");
        header("Content-Length: ".filesize($file));
        header("Content-Disposition: attachment; filename=\"".basename($file)."\"");
        
        // disable cache
        header('Expires: ' . gmdate('D, d M Y H:i:s') . ' GMT');
        header("Cache-control: private");
        header('Pragma: private');
        ob_end_clean();
        readfile($file);
      exit;
      }
            
    }

}

 public function do_freedownload(){

 global $query;

 if(!isset($_GET['id'])):
  $this->do_404();
 endif;
 
  $id = $_GET['id'];
  $item = $query->addquery('select','cm_items','*','si',"free,$id",'type=?,id=?');

 if(!$item):
  $this->do_404();
 endif;

   //start download
     
   $file = WWW_ROOT.'template/uploads/items/'.DS.basename($item->main_file);
 
     if (headers_sent()) {
        exit('HTTP header already sent');
     } else {
      if (!is_file($file)) {
        header($_SERVER['SERVER_PROTOCOL'].' 404 Not Found');
        exit('File not found');
      } else if (!is_readable($file)) {
        header($_SERVER['SERVER_PROTOCOL'].' 403 Forbidden');
        exit('File not readable');
      } else {

        header($_SERVER['SERVER_PROTOCOL'].' 200 OK');
        header("Content-Type: application/zip");
        header("Content-Transfer-Encoding: Binary");
        header("Content-Length: ".filesize($file));
        header("Content-Disposition: attachment; filename=\"".basename($file)."\"");
        
        // disable cache
        header('Expires: ' . gmdate('D, d M Y H:i:s') . ' GMT');
        header("Cache-control: private");
        header('Pragma: private');
        ob_end_clean();
        readfile($file);
      exit;
      }
            
    }

}

 public function do_delete($r,$a){
 
 global $smarty,$query;
      
 if(isset($_POST['delete'])):
   $data = $query->addquery('delete','cm_'.$r,false,'i',check_request('id',false,'int'),'id=?');
   
     if($r == 'themes'):
      delete_files(WWW_ROOT.'template'.DS.check_request('name'));
     endif;

      $_SESSION['delete']['deleted']=true;
      redirect(['controller' => 'admin', 'action' => $a]);
 else:
      alerts('delete','deleted');
 endif;
   
 }

 public function do_build($i,$n){
 
  if(isset($_GET['p']) && !empty($_GET['p'])):
   $build = 'item'.DS.$i.DS.$this->TitleBuild($n).DS.'&p='.$_GET['p'];
  else:
   $build = 'item'.DS.$i.DS.$this->TitleBuild($n).DS;
  endif;
 
   return $build;
 }

 public function do_adduser(){

 global $query,$dateForm;

 /* add user */
 
 $since = date("F").' '.date("Y");
 
 $arr = $this->do_arrp('add-user','role,status,username,password,email');
 
 if ($this->do_post($arr,'*','add-user')){
 
   if($this->find((object)['word' => check_request('email',false,'email'),'role' => 'email']) || $this->find((object)['word' => check_request('username'),'role' => 'username'])):
    session_acv('add_user','do_exist');
    redirect(['action' => 'admin/users/add']);
   endif;
 
 $data = $query->addquery('insert','cm_members','role,status,username,password,email,recover,since,created','sissssss',[check_request('role'),check_request('status'),check_request('username'),check_request('password','md5'),check_request('email',false,'email'),check_request('password','base64_encode'),$since,$dateForm]);

  if(!$data):
   session_acv('add_user','do_error');
   redirect(['action' => 'admin/users/add']);
  endif;

   session_acv('users','added');
   redirect(['action' => 'admin/users/index']);

 }
 
 else{

 alerts('add_user','do_error');
 alerts('add_user','do_exist');
 alerts('add-user','required');
 
  }
 }

 public function do_addcomment($item,$get){

 global $query,$user,$dateForm;

 /* add comment */

  if ($this->do_post($this->do_arrp('comment','comment_txt'),'*','comment')):
 
    $data = $query->addquery('insert','cm_comments','item_id,user_id,comment,created','iiss',[$item->id,$user->id,check_request('comment_txt'),$dateForm]);

   if(!$data):
    session_acv('comment','do_error');
   elseif(number_format($data)):
    session_acv('comment','cadded');
   endif;
    redirect(['action' => $this->do_build($item->id,$item->name)]);
 
 else:
    alerts('comment','cadded');
    alerts('comment','do_error');
    alerts('comment','required');
 endif;
 
 }
 
 public function do_addreview($item,$get){

 global $query,$user,$dateForm,$smarty;

  $ch = $query->addquery('select','cm_downloads','isreviewed','ii', "$user->id,$item->id",'user_id=?,item_id=?');
  $smarty->assign('isreviewed',$ch->isreviewed);
  $smarty->assign('buyer',$this->is_buyer($item->id));
 
  /* add review */

  if ($this->do_post($this->do_arrp('review','review_txt'),'*','review')):
   
   $star_1 = $this->getstar($_POST['rate_1']);
   $star_2 = $this->getstar($_POST['rate_2']);
   $star_3 = $this->getstar($_POST['rate_3']);
   $star_4 = $this->getstar($_POST['rate_4']);
   $star_5 = $this->getstar($_POST['rate_5']);
   $arr = explode(',',$star_1.','.$star_2.','.$star_3.','.$star_4.','.$star_5);
   $stars = $this->MaxStars($arr);
 
  if($stars == NULL):
    session_acv('review','wrong');
    redirect(['action' => $this->do_build($item->id,$item->name)]);
  endif;
 
 
    $data = $query->addquery('insert','cm_reviews','item_id,user_id,review,stars,created','iisss',[$item->id,$user->id,check_request('review_txt'),$stars,$dateForm]);
    $query->addquery('update','cm_downloads','isreviewed=?','iii',['1',$item->id,$user-id],'item_id=?,user_id=?');
    $query->addquery('update','cm_items','stars=?','si',[$this->starRating($item->id),$item->id],'id=?');
   
   if(!$data):
    session_acv('review','do_error');
   elseif(number_format($data)):
    session_acv('review','radded');
   endif;
    redirect(['action' => $this->do_build($item->id,$item->name)]);

 else:
    alerts('review','radded');
    alerts('review','do_error');
    alerts('review','required');
 endif;
 
 }
 
 public function do_addcat(){

 global $query,$dateForm;

 /* add categoey */
 
 $arr = $this->do_arrp('add-cat','name,short_desc,preview_link,compatible_browsers,comments_section,reviews_section,status');
 
 if ($this->do_post($arr,'*','add-cat')){
 
 $data = $query->addquery('insert','cm_categories','name,short_desc,link,enable_browsers,enable_previewlink,enable_comments,enable_reviews,status,created','sssiiiiis',[check_request('name'),check_request('short_desc'),$this->TitleBuild(check_request('name')),check_request('compatible_browsers'),check_request('preview_link'),check_request('comments_section'),check_request('reviews_section'),check_request('status'),$dateForm]);

  if(!$data):
   session_acv('add_cat','do_error');
   redirect(['action' => 'admin/categories/add']);
  endif;

   session_acv('categories','added');
   redirect(['action' => 'admin/categories/index']);

 }
 
 else{

 alerts('add_cat','do_error');
 alerts('add-cat','required');
 
  }
 }
 
 public function do_addtestimonial(){

 global $query,$dateForm;

 /* add testimonial */
 
 if($this->do_post($this->do_arrp('add-testimonial','name,job,content'),'*','add-testimonial')){
 
      //UPLOAD AVATAR
     
    $this->files([
      'photo' => $_FILES["photo"],
      'error' => $_FILES["photo"]["error"],
      'path' => 'template/uploads/images/testimonial_',
      'controller' => 'admin', 
      'action' => 'testimonials/add'
      ],'photo');

 $data = $query->addquery('insert','cm_testimonials','name,job,content,image,created','sssss',[check_request('name'),check_request('job'),check_request('content'),$this->img(),$dateForm]);

  if(!$data):
   session_acv('add_testimonial','do_error');
   redirect(['action' => 'admin/testimonials/add']);
  endif;

   session_acv('testimonials','added');
   redirect(['action' => 'admin/testimonials/index']);

 }
 
 else{

 alerts('add_testimonial','do_error');
 alerts('add-testimonial','required');
 
  }
 }
 
 public function do_addannoce(){

 global $query,$dateForm;

 /* add announcement */
 
 if($this->do_post($this->do_arrp('add-announcement','title,content'),'*','add-announcement')){

 $data = $query->addquery('insert','cm_announcements','title,content,created','sss',[check_request('title'),$_POST['content'],$dateForm]);

  if(!$data):
   session_acv('add_announcement','do_error');
   redirect(['action' => 'admin/testimonials/add']);
  endif;

   session_acv('announcements','added');
   redirect(['action' => 'admin/announcements/index']);

 }
 
 else{

 alerts('add_announcement','do_error');
 alerts('add-announcement','required');
 
  }
 }

 public function do_addpage(){

 global $query,$dateForm;

 /* add page */
 
 if($this->do_post($this->do_arrp('add-page','title,content'),'*','add-page')){

 $data = $query->addquery('insert','cm_pages','title,content,short,created','ssss',[check_request('title'),$_POST['content'],$this->limit_text(check_request('content'),30),$dateForm]);

  if(!$data):
   session_acv('add_page','do_error');
   redirect(['action' => 'admin/pages/add']);
  endif;

   session_acv('pages','added');
   redirect(['action' => 'admin/pages/index']);

 }
 
 else{

 alerts('add_page','do_error');
 alerts('add-page','required');
 
  }
 }
 
 public function do_form(){

 global $query,$dateForm,$user;

 /* add item */
 
 if($this->do_post($this->do_arrp('next','name,content,tags'),'*','next')){

 $data = $query->addquery('insert','cm_items','user_id,name,description,short_desc,category,tags,price,demo_url,browsers,type,created','isssissssss',[$user->id,check_request('name'),$_POST['content'],$this->limit_text(check_request('content'),30),$_GET['type'],check_request('tags'),check_request('price'),check_request('demo'),implode(',',$_POST['compatibleBrowsers']),check_request('type'),$dateForm]);

  if(!$data):
   session_acv('form','do_error');
   redirect(['action' => 'admin/items/form?type='.$_GET['type']]);
  endif;

   session_acv('form','added');
   redirect(['action' => 'admin/items/finish/'.$data.DS]);

 }else{
   alerts('form','do_error');
   alerts('next','required');
  }
 }

 public function do_formfinish(){

 global $query,$dateForm,$option;

 /* upload & finish */
 
 if($this->do_post($this->do_arrp('finish','csrf'),'*','finish')){

 
 if(empty($_FILES["thumbnail"]["name"]) || empty($_FILES["previewImage"]["name"]) || empty($_FILES["mainfiles"]["name"]) ):
   session_acv('finish','required');
   redirect(['action' => 'admin/items/finish/'.$_GET['id'].DS]);
 endif;
 
  /* ITEM */
  
  $data = $query->addquery('select','cm_items','name','i',$_GET["id"],'id=?');

  /* UPLOAD THUMBNAIL */
    
  $this->files([
      'photo' => $_FILES["thumbnail"],
      'error' => $_FILES["thumbnail"]["error"],
      'path' => 'template/uploads/files/thumbnail_',
      'controller' => 'admin', 
      'action' => 'items/finish/'.$_GET['id'].DS
      ],'thumbnail');
      
  $thumbnail = $this->img();
 
  /* UPLOAD PREVIEW IMG */
    
  $this->files([
      'photo' => $_FILES["previewImage"],
      'error' => $_FILES["previewImage"]["error"],
      'path' => 'template/uploads/files/preview_',
      'controller' => 'admin', 
      'action' => 'items/finish/'.$_GET['id'].DS
      ],'previewImage');
      
  $previewImage = $this->img();
  

  /* UPLOAD MAIN FILES (ZIP) */
    
  $this->ZipFiles([
      'photo' => $_FILES["mainfiles"],
      'error' => $_FILES["mainfiles"]["error"],
      'path' => 'template/uploads/items/'.strtolower($option[0][0]).'-'.$this->titlebuild($data->name).'-',
      'controller' => 'admin',
      'action' => 'items/finish/'.$_GET['id'].DS,
      'extract' => 2
      ],'mainfiles');
      
  $mainfiles = $this->zip();
 
  $data = $query->addquery('update','cm_items','icon_img=?,preview_img=?,main_file=?,status=?','sssii',[$thumbnail,$previewImage,$mainfiles,1,$_GET['id']],'id=?');

  if(!$data):
   session_acv('form','do_error');
   redirect(['action' => 'admin/items/finish/'.$_GET['id'].DS]);
  endif;

   session_acv('form','added');
   redirect(['action' => 'admin/items/index']);

 }else{
 alerts('form','added');
 alerts('form','do_error');
 alerts('next','required');
  }
 }

 public function do_page_display(){

 global $query,$smarty;

 /* display page */
 
 if(!isset($_GET["id"]) || empty($_GET["id"])):
  $this->do_404();
 endif;
 
 $data = $query->addquery('select','cm_pages','*','i',$_GET["id"],'id=?');
 
 if(!$data):
  $this->do_404();
 endif;
 
 $smarty->assign('title',$data->title);
 $smarty->assign('content',$data->content);
 $this->do_winfo($data->title,$data->short);

 }

 public function do_catname($n,$m){
 
 global $smarty,$query;
 
 $category_get = str_replace('.php','',$_GET[$n]);

 if($m == 'l'):
 
  $smarty->assign('catlink',$category_get);

 elseif($m == 'n'):
     
  $cat = $query->addquery('select','cm_categories','name','si',"$category_get,1",'link=?,status=?');

  $this->do_check($cat,'!');

  $category_get = $cat->name;

 elseif($m == 'i'):

  $cat = $query->addquery('select','cm_categories','id','si',"$category_get,1",'link=?,status=?');

  $this->do_check($cat,'!');

  $category_get = $cat->id;

 endif;
 
    return $category_get;

}

 public function do_tabs($p=false,$d=false,$s=false,$h=false,$dep=false,$st=false){
 
 global $smarty;
      
 $smarty->assign('profile',$p);
    
 $smarty->assign('downloads',$d);
 
 $smarty->assign('settings',$s);

 $smarty->assign('history',$h);

 $smarty->assign('deposit',$dep);

 $smarty->assign('statement',$st);
 
}

 public function do_winfo($t,$d=false,$k=false,$s=false){
 
 global $smarty;
      
 $smarty->assign('site_title',$t);
    
 if(isset($d)):
 
 $smarty->assign('site_description',$d);
 
 $smarty->assign('keywords',$k);

 $smarty->assign('canonical',$s);

 endif;

}

 public function do_check($s,$m){
 
 switch($m):
 
 case '!isset':
     
   if(!isset($_GET["$s"])):

     $this->do_404();
 
   endif; 
   
 break;
 
 case '!':
     
   if(!$s):

     $this->do_404();
 
   endif;
   
 break;
 
 case '!&':
     
   if(!$s || $s->status == '2'):

     $this->do_404();
 
   endif;
   
 break;
 
 endswitch;
 
 
}
 
 public function do_post($a,$p,$f){
 
 global $sr;
 

 if(isset($_POST["$f"])):
 
 if($_SERVER["REQUEST_METHOD"] == 'POST'){
 
 if($sr->csrf_token() == $this->do_wcheck('csrf')):
 
     $c = count($a);
 
        $array = array();

        for ($i = 0; $i < $c; $i++):
      // var_export($a);
     //  exit;
         if($p == '*'):
          if(empty(trim($a[$i]))):
             session_acv($f,'required');
             quick();
          endif;
         else:
          $this->do_required($a[$i]);
         endif;

        endfor;
 
     return true;
     
    else:
       redirect(['action' => 'pages/error']);
    endif;

 if(count(array_filter($_POST))!=count($_POST)):
    session_acv($f,'required');
    quick();
 endif;


 }
 
 endif;
 
}

 public function do_wcheck($s,$m=false,$f=false){
    
  if(!$m):

    if($f):
      
      $result = filter_var($f($_POST[$s]), FILTER_SANITIZE_STRING);

       else:

      $result = filter_var($_POST[$s], FILTER_SANITIZE_STRING);
    
    endif;
   
         return $result;

  elseif($m):

    switch($m):
     
  case 'int':
      
   if ($f):
      
    $result = filter_var($f($_POST[$s]), FILTER_VALIDATE_INT);

   else:

    $result = filter_var($_POST[$s], FILTER_VALIDATE_INT);
    
   endif;

       return $result;
 
  break;
  
  case 'ip':
      
   if ($f):
      
    $result = filter_var($f($_POST[$s]), FILTER_VALIDATE_IP);

   else:

    $result = filter_var($_POST[$s], FILTER_VALIDATE_IP);
    
   endif;

       return $result;
 
  break;
  
  case 'url':
      
   if ($f):
      
    $result = filter_var($f($_POST[$s]), FILTER_VALIDATE_URL);

   else:

    $result = filter_var($_POST[$s], FILTER_VALIDATE_URL);
    
   endif;

       return $result;
 
  break;
 
  endswitch;
     
  endif;
  
 
 
}

 public function do_scheck($s,$m=false,$f=false){
    
  if(!$m):

    if($f):
      
      $result = filter_var($f($s), FILTER_SANITIZE_STRING);

       else:

      $result = filter_var($s, FILTER_SANITIZE_STRING);
    
    endif;
   
         return $result;

  elseif($m):

    switch($m):
     
  case 'int':
      
   if ($f):
      
    $result = filter_var($f($s), FILTER_VALIDATE_INT);

   else:

    $result = filter_var($s, FILTER_VALIDATE_INT);
    
   endif;

       return $result;
 
  break;
  
  case 'ip':
      
   if ($f):
      
    $result = filter_var($f($s), FILTER_VALIDATE_IP);

   else:

    $result = filter_var($s, FILTER_VALIDATE_IP);
    
   endif;

       return $result;
 
  break;
  
  case 'url':
      
   if ($f):
      
    $result = filter_var($f($s), FILTER_VALIDATE_URL);

   else:

    $result = filter_var($s, FILTER_VALIDATE_URL);
    
   endif;

       return $result;
 
  break;
 
  endswitch;
     
  endif;
  
 
 
}

 public function role($role,$username=false){

 switch($role):

 case 'user':

	   if(isset($_GET['r'])):
         quick(['origin' => '/project/oauth', 'redirect' => base64_decode($_GET['r'])]);
	   else:
         redirect(['controller' => 'user', 'action' => $username.'/']);
	   endif;

 break;

 case 'admin':

	   if(isset($_GET['r'])):
         quick(['origin' => '/project/oauth', 'redirect' => base64_decode($_GET['r'])]);
	   else:
         redirect(['controller' => 'admin', 'action' => 'dashboard']);
	   endif;

 break;

 endswitch;
 
 }

 public function forcelogged($id){

 $_SESSION['user']['logged'] = true;

 $_SESSION['user']['uid'] = $id;

}
 
 public function find($data){

 global $query;

 $find = $query->addquery('select','cm_members','id','s',$data->word,$data->role.'=?');

 return $find;

}
 
 public function genToken($num){

 $tk = bin2hex(openssl_random_pseudo_bytes($num));

 return $tk;

}

 public function titleBuild($string){

 $rep = str_replace('-','',strtolower($string));
     
 $rep = str_replace('  ','-',$rep);

 $rep = str_replace('   ','-',$rep);

 $rep = str_replace(' ','-',$rep);

 $rep = str_replace('_','-',$rep);

 $rep = str_replace('>','',$rep);

 $rep = str_replace('<','',$rep);

 $rep = str_replace('|','',$rep);

 $rep = str_replace(',','',$rep);

    return $rep;
    
 }

 public function getstar($rate){
    
 if( isset($rate) && !empty($rate)):
   $res = $rate;
 else:
   $res = '0';
 endif;
    
  return $res;
    
}

 public function MaxStars($array){
 $maxs = array_keys($array, max($array));
 $count = count($maxs);
 
 if($count > 1):
  return $maxs[$count];
 else:
  return $maxs[0] + 1;
 endif;

}

 public function starRating($id){
     
 global $query;
     
 $one = $query->addquery('select','cm_reviews','count(id) as stars','iii', "1,1,$id",'stars=?,status=?,item_id=?');
 $two = $query->addquery('select','cm_reviews','count(id) as stars','iii', "2,1,$id",'stars=?,status=?,item_id=?');
 $three = $query->addquery('select','cm_reviews','count(id) as stars','iii', "3,1,$id",'stars=?,status=?,item_id=?');
 $four = $query->addquery('select','cm_reviews','count(id) as stars','iii', "4,1,$id",'stars=?,status=?,item_id=?');
 $five = $query->addquery('select','cm_reviews','count(id) as stars','iii', "5,1,$id",'stars=?,status=?,item_id=?');

 $array = ['1' => $one->stars, '2' => $two->stars,'3' => $three->stars, '4' => $four->stars,'5' => $five->stars];
 $maxs = array_keys($array, max($array));
 $count = count($maxs);
 
 if($count > 1):
  return $maxs[$count-1];
 else:
  return $maxs[0];
 endif;
 
     
 }

 public function is_buyer($itm,$role=false){
     
 global $query,$uid;
 
 if(isset($uid)):
 
    $buyer = $query->addquery('select','cm_downloads','id,user_id','iii', "1,$itm,$uid",'status=?,item_id=?,user_id=?');
 
    if(isset($buyer->user_id) && $buyer->user_id == $uid):
     
      return true;
 
    else:
     
      return false;

    endif;
     
 endif;
 
 }

 public function buildTags($arr){

 global $HOST;

  $array = array();
 
  for($i=0; $i < count($arr); $i++):
     
  $build = '<a href="'.$HOST.'browse/tags/'.$this->titleBuild($arr[$i]).'">'.$arr[$i].'</a>';

  array_push($array, $build);

  endfor;

    return implode('', $array);

}

 public function LoadCat($id){
 
 global $query;
 
 $cat = $query->addquery('select','cm_categories','name,link','ii',"$id,1",'id=?,status=?');
 
 return $cat->name;
 
 }
 
 public function do_adm_statistics(){
     
 global $query,$smarty;

//admin earnings

$data = $query->addquery('select','cm_members','admin_earnings','s','admin','role=?');

$smarty->assign('admearn',number_format($data->admin_earnings, 2, '.', ''));

//number of users

$data = $query->addquery('select','cm_members','count(id) as users','s','user','role=?');

$smarty->assign('users',number_format($data->users));

//balances of users

$data = $query->addquery('select','cm_members','sum(balance) as balances','s','user','role=?');

$smarty->assign('balances',number_format($data->balances, 2, '.', ''));

//number of sales

$data = $query->addquery('select','cm_items','sum(sales) as sales');

$smarty->assign('sales',number_format($data->sales));

//number of items

$data = $query->addquery('select','cm_items','count(id) as items','1','status=?');

$smarty->assign('items',number_format($data->items));

//number of categories

$data = $query->addquery('select','cm_categories','count(id) as categories','1','status=?');

$smarty->assign('categories',number_format($data->categories));

//number of Announcements

$data = $query->addquery('select','cm_announcements','count(id) as announcements','1','published=?');

$smarty->assign('announcements',number_format($data->announcements));

//number of Pages

$data = $query->addquery('select','cm_pages','count(id) as pages','1','status=?');

$smarty->assign('pages',number_format($data->pages));


/* ------------------------------------------------------ */

//number of Comments

$data = $query->addquery('select','cm_comments','count(id) as comments','1','status=?');

$smarty->assign('comments',number_format($data->comments));

//number of active users

$data = $query->addquery('select','cm_members','count(id) as active_users','is','1,user','status=?,role=?');

$smarty->assign('active_users',number_format($data->active_users));

//number of pending users

$data = $query->addquery('select','cm_members','count(id) as pending_users','is','2,user','status=?,role=?');

$smarty->assign('pending_users',number_format($data->pending_users));

//number of inactive users

$data = $query->addquery('select','cm_members','count(id) as inactive_users','is','3,user','status=?,role=?');

$smarty->assign('inactive_users',number_format($data->inactive_users));


//deposts number

$data = $query->addquery('select','cm_invoice','count(id) as deposcount');

$smarty->assign('deposcount',number_format($data->deposcount));
	
//paid

$data = $query->addquery('select','cm_invoice','sum(amount) as depospaid','i','1','status=?');

$smarty->assign('depospaid',number_format($data->depospaid));

//unpaid

$data = $query->addquery('select','cm_invoice','sum(amount) as deposunpaid','i','2','status=?');

$smarty->assign('deposunpaid',number_format($data->deposunpaid, 2, '.', ''));
     
     
 }

 public function verify($api_key,$method){
    // verify a purchase
    cdm($api_key,$method);
 
 }
 
 public function files($file,$name){
 //upload images
 global $HOST;
 
 if(isset($file['photo']) && $file['error'] == 0){

   $filename = $_FILES["$name"]["name"];
   $filetype = $_FILES["$name"]["type"];
   $filesize = $_FILES["$name"]["size"];

   //VERIFY==EXTENSION
   $ext = pathinfo($filename, PATHINFO_EXTENSION);
   if(!array_key_exists($ext, $this->allowed)){ 
    $_SESSION['photo']['format_img']=true;
    Redirect(['controller' => $file['controller'], 'action' => $file['action']]);
  }
   if($filesize > $this->maxsize) {
    $_SESSION['photo']['size_img']=true;
    Redirect(['controller' => $file['controller'], 'action' => $file['action']]);
  }
    
  //VERIFY==MYME
  if(in_array($filetype, $this->allowed)){

   $temp = explode(".", $_FILES["$name"]["name"]);
   $newfilename = round(microtime(true)) . '.' . end($temp);
   move_uploaded_file($_FILES["$name"]["tmp_name"], WWW_ROOT.$file['path'].$newfilename);
   $this->imglink = $HOST.$file['path'].$newfilename;

  } else {
   $_SESSION['photo']['format_img']=true;
   Redirect(['controller' => $file['controller'], 'action' => $file['action']]);
   }
  }
 }
    
 public function img(){return $this->imglink;}

 public function ZipFiles($file,$name){
  //upload zip files
  global $HOST;

  if(isset($_FILES["$name"]["name"])) {

	$filename = $_FILES["$name"]["name"];
	$source = $_FILES["$name"]["tmp_name"];
	$type = $_FILES["$name"]["type"];
    $filesize = $_FILES["$name"]["size"];

    if($filesize > $this->maxsizezip) { 
     $_SESSION['err']['size_zip']=true;
     Redirect(['controller' => $file['controller'], 'action' => $file['action']]);
   }
 
    //VERIFY==MYME
    if(in_array($type, $this->allowedzip)){

     $temp = explode(".", $_FILES["$name"]["name"]);
     $newfilename = round(microtime(true)) . '.' . end($temp);
     move_uploaded_file($_FILES["$name"]["tmp_name"], WWW_ROOT.$file['path'].$newfilename);

    if($file["extract"] == '2'):
      $this->ziplink = $HOST.$file['path'].$newfilename;
      $this->zipsize = $filesize;

    elseif($file["extract"] == '1'):
      
	  $target_path = WWW_ROOT.$file['path'].$newfilename;  // change this to the correct site path

		$zip = new ZipArchive();
		$x = $zip->open($target_path);
		if ($x === true) {
        $array = array();
        for ($i = 0; $i < $zip->numFiles; $i++) {
        global $filename;
        $filename = $zip->getNameIndex($i);
        
        //if not allowed image type
        $ext = pathinfo($filename, PATHINFO_EXTENSION);
        if(!array_key_exists($ext, $this->allowedimg)){ 

        $_SESSION['err']['format_inside_screen']=true;
        Redirect(['controller' => $file['controller'], 'action' => $file['action']]);
        }
		$zip->extractTo(WWW_ROOT.$file['extract_in']); // change this to the correct site path
        $newroundfile = round(microtime(true));
        rename(WWW_ROOT.$file['extract_in'].$filename, WWW_ROOT.$file['extract_in'].$i.$newroundfile.'-'.$filename);
        array_push($array, $i.$newroundfile.'-'.$filename);
        }

            $this->ziplink = implode(',', $array);
			$zip->close();

			unlink($target_path);
		}
  endif;
	
  } else {
    $_SESSION['err']['format_zip']=true;
    Redirect(['controller' => $file['controller'], 'action' => $file['action']]);
   }
  }
 }

 public function zip(){return $this->ziplink;}

 public function zip_size(){return $this->zipsize;}

}

$fun = new functionModel;