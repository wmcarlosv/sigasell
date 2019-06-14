<?php

 class get_host{
  public function site_protocol(){

   //website url
   $protocol = isset($_SERVER['HTTPS']) && ($_SERVER['HTTPS'] === 'on' || $_SERVER['HTTPS'] === 1) || isset($_SERVER['HTTP_X_FORWARDED_PROTO']) && $_SERVER['HTTP_X_FORWARDED_PROTO'] === 'https' ? 'https' : 'http';
   return $protocol;
  }
  public function site_url(){
   return $this->site_protocol() . '://' . $_SERVER['HTTP_HOST'] . DS ;
 }
  }
 $hs = new get_host;

  //functions
  
 function _is_curl_installed() {
     //check for curl extension
    if  (in_array  ('curl', get_loaded_extensions())) {
        return true;
    }
    else {
        return false;
    }
 }
 function pages($perpage = 9,$screen = 0){
   if (!isset($_GET['p']) || $_GET['p']==0 )
    $screen;
   else
    $screen=$_GET['p']-1;
    $start = $screen * $perpage;
    return array('perpage' => $perpage, 'screen' => $screen , 'start' => $start);
 }
 function paging($page,$last_page,$part,$custom=false){
 global $smarty;

 $paging = false;
 
 if(contains(ACCESS, '/admin/')) {
   $l='<li>';
   $li='</li>';
  } else {
   $l='';
   $li='';
 }
 
 if($page != 1){
 $paging.=$l.'<a href="'.$part.($page - 1).'">&lsaquo;</a>'.$li;
 }
 if($page > 4){
 $paging.=$l.'<a href="'.$part.($page-$page+1).'">&laquo;</a>'.$li;
 }
 for($i=4;$i>0;$i--)
 if($page-$i>0){
 $paging.=$l.'<a href="'.$part.($page-$i).'">'.($page-$i).'</a>'.$li;
 }
 if ($page == 0){
 $paging.=$l.'<a>&rsaquo;</a>'.$li;
 }
 elseif($page == $last_page){
 $paging.=$l.'<a>&lsaquo;</a>'.$li;
 }
 else{
 $paging.=$l.'<a>'.$page.'</a>'.$li;
 }
 for($i=1 ; $i<5 ; $i++)
 if($last_page-($page+$i)>0){
 $paging.=$l.'<a href="'.$part.($page+$i).'">'.($page+$i).'</a>'.$li;
 }
 if ($page < $last_page - 5){
 $paging.=$l.'<a href="'.$part.($last_page - 1).'">&raquo;</a>'.$li;
 }
 if ($page != $last_page-1){
 $paging.=$l.'<a href="'.$part.($page + 1).'">&rsaquo;</a>'.$li;
 }
 if($paging && !$custom){
     $smarty->assign('paging',$paging);
 }
  
 if($paging && $custom){
     return $paging;
 }
  
 }
 function redirect($result, $permanent = false) {
    global $hs,$HOST;
    
    //redirect 
	if($permanent) {
 	 header('HTTP/1.1 301 Moved Permanently');
	}
	
	    
	 if (empty($result['controller']) && isset($result['action'])) {
	      header('Location: '.$HOST.$result['action']);
	 }elseif (isset($result['action'])) {
	      header('Location: '.$HOST.$result['controller'].DS.$result['action']);
	 }
	
    exit();
}
 function delete_files($target) {
    //delete files 
    if(is_dir($target)){
        $files = glob( $target . '*', GLOB_MARK ); //GLOB_MARK adds a slash to directories returned
        
        foreach( $files as $file )
        {
            delete_files( $file );      
        }

        rmdir( $target );
    } elseif(is_file($target)) {
        unlink( $target );  
    }
 }
 function fetch($path = ''){
   global $smarty;
   $temp = $smarty->fetch(WWW_ROOT . 'template'.DS . Theme . DS . $path . '.tpl');
    return $temp;
 }
 function labels($r,$i,$d=false){
 global $smarty;
 if(!$d):
 $smarty->assign('_'.$r,$i);
 else:
 $smarty->assign('_'.$r,$i);
 $smarty->assign('__'.$r,$d);
 endif;
 }
 function messages($r,$i,$d=false){
 global $smarty;
 $smarty->assign('_'.$r,$i);
 if($i=='danger' || $i=='warnings'):
  $smarty->assign('__'.$r,'Error: '.$d);
 else:
  $smarty->assign('__'.$r,$d);
 endif;
 }
 function secure_role(){ 
 global $user,$uid;

 if( empty($uid) || $uid == '0') {
  //user session expired
  $_SESSION['success']['expired']=true;
  redirect(['action' => 'oauth?r='.base64_encode(ACCESS)]);
 }

 if( !isset($_SESSION['user']['logged'])) {
  //user is not logged in
  redirect(['action' => 'oauth?r='.base64_encode(ACCESS)]);
 }

  if(contains(ACCESS, '/admin/') && $user->role == 'user') {
   //check for roles 
   redirect(['controller' => 'user', 'action' => $user->username.'/']);
  }
 }
 function mailer($mailer){

 global $mail_option,$option,$mail_username,$mail_host,$mail_port,$mail_ssluse,$mail_pass;
 
 //mailer
 
 $mailAPP = new PHPMailer;
 
 switch($mail_option):
  case 'smtp':
  //use smtp
  $mailAPP->isSMTP();
  $mailAPP->SMTPDebug = 2;
  $mailAPP->Host = $mail_host;
  $mailAPP->Port = $mail_port;
  $mailAPP->SMTPSecure = $mail_ssluse;
  $mailAPP->SMTPAuth = true;
  $mailAPP->Username = $mail_username;
  $mailAPP->Password = $mail_pass;
  break;
 endswitch;

  $mailAPP->setFrom($mailer['from'], $option[0][0]);
  $mailAPP->addReplyTo($mailer['from'], $option[0][0]);
  $mailAPP->addAddress($mailer['to'], $mailer['subject']);
  $mailAPP->Subject = $mailer['subject'];
  $mailAPP->isHTML(true); 
  $mailAPP->msgHTML($mailer['msg']);
  $response = $mailAPP->send();
    
   if(!$response):
    /*var_export($mailAPP->ErrorInfo);exit;*/
       return 2;
   endif;
   
    
    
}
 function reCaptcha($reCAPTCHA_secret_key=false){
     
 //recaptcha
 if(isset($_POST['g-recaptcha-response'])):
  $info = [
  'secret' => $reCAPTCHA_secret_key,
  'response' => $_POST['g-recaptcha-response']];
  
  $verify = curl_init();
 
  curl_setopt($verify, CURLOPT_URL, "https://www.google.com/recaptcha/api/siteverify");
  curl_setopt($verify, CURLOPT_POST, true);
  curl_setopt($verify, CURLOPT_POSTFIELDS, http_build_query($info));
  curl_setopt($verify, CURLOPT_SSL_VERIFYPEER, false);
  curl_setopt($verify, CURLOPT_RETURNTRANSFER, true);
  $response = curl_exec($verify);
  $data = json_decode($response);

  if(isset($data->success) && $data->success == true){
    return true;
  }elseif($data->error-codes || $data->challenge_ts || $data->hostname || $data->success == false){
    return false;
  }
 
 endif;

 }
 function check_request($result,$func=false,$mode=false){

 //check for inputs requests

 if(!empty($result)){
    
  if(!$mode):

   if ($func):
      
    $result = filter_var($func($_POST[$result]), FILTER_SANITIZE_STRING);

   else:

    $result = filter_var($_POST[$result], FILTER_SANITIZE_STRING);
    
   endif;
   
       return $result;
       
    if(empty($result) || !filter_var($result, FILTER_SANITIZE_STRING)):
     
       return false;

     endif;

   elseif($mode):

   switch($mode):
     
   case 'email':

   if ($func):
      
    $result = filter_var($func($_POST[$result]), FILTER_VALIDATE_EMAIL);

   else:

    $result = filter_var($_POST[$result], FILTER_VALIDATE_EMAIL);
    
   endif;

       return $result;

    if(empty($result) || !filter_var($result, FILTER_VALIDATE_EMAIL)):
     
       return false;
       
     endif;
     
  break;
  
  case 'int':
      
   if ($func):
      
    $result = filter_var($func($_POST[$result]), FILTER_VALIDATE_INT);

   else:

    $result = filter_var($_POST[$result], FILTER_VALIDATE_INT);
    
   endif;

       return $result;

    if(empty($result) || !filter_var($result, FILTER_VALIDATE_INT)):
     
       return false;
       
     endif;
 
  break;
  
  case 'ip':
      
   if ($func):
      
    $result = filter_var($func($_POST[$result]), FILTER_VALIDATE_IP);

   else:

    $result = filter_var($_POST[$result], FILTER_VALIDATE_IP);
    
   endif;

       return $result;

    if(empty($result) || !filter_var($result, FILTER_VALIDATE_IP)):
     
       return false;
       
     endif;
 
  break;
  
  case 'url':
      
   if ($func):
      
    $result = filter_var($func($_POST[$result]), FILTER_VALIDATE_URL);

   else:

    $result = filter_var($_POST[$result], FILTER_VALIDATE_URL);
    
   endif;

       return $result;

    if(empty($result) || !filter_var($result, FILTER_VALIDATE_URL)):
     
       return false;
       
     endif;
 
  break;
 
  endswitch;
     
  endif;
  
 }
 }
 function show($path = ''){
  global $smarty;
  
  //display - smarty 
 if(isset($path)){

 $smarty->display(WWW_ROOT . 'template/' . Theme . DS . $path . '.tpl');

 }
  }
 function errorAndDie($error_msg) {
 global $dateForm;

 //check for errors write in => logs => reports.txt
 $debug_file = ROOT.DS.'logs/reports.txt';

 if (!empty($debug_file)) {
  $report = 'Error: '.$dateForm.' | '.$error_msg.PHP_EOL; 
  write($debug_file,$report,"a");
  die('Error: '.$error_msg);

  }
 }
 function alerts($session,$alert){
 global $smarty;

 //alerts
 if(isset($_SESSION[$session][$alert])){
    
 $smarty->assign($alert,true);

 unset($_SESSION[$session]);
 
 }else{
     
 $smarty->assign($alert,false);
 }
	}
 function app_version(){

 //check app version
 $server = 'https://codsem.com/digasell/server/update?v=new';
 $ch = curl_init();
 curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
 curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
 curl_setopt($ch, CURLOPT_URL, $server);
 $result = curl_exec($ch);
 curl_close($ch);
 $arr = json_decode($result, true);
 return $arr;

 }
 
 $ip_visit = getenv('HTTP_CLIENT_IP')?:
    
 getenv('HTTP_X_FORWARDED_FOR')?:
    
 getenv('HTTP_X_FORWARDED')?:
    
 getenv('HTTP_FORWARDED_FOR')?:
    
 getenv('HTTP_FORWARDED')?:

 getenv('REMOTE_ADDR');