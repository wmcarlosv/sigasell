<?php

 class smartyModel{
  
 public function users($id){
  global $smarty;
 
 switch ($id):
  case '0':
  case NULL:
   define('islogged',false);
   $smarty->assign('notlogged', true);
   $smarty->assign('logged',false);
   $smarty->assign('uid',$id);
  break;
 default:
  define('islogged',true);
  $smarty->assign('logged', true);
  $smarty->assign('notlogged',false);
  $smarty->assign('uid',$id);
 break;
 endswitch;
 }
 
 public function sign_option(){
     
 global $smarty,$query,$info,$option,$uid,$HOST;

 $option = $query->opt_all('value,header','cm_config');
 $smarty->assign('HOST',$HOST);
 $smarty->assign('AST',$HOST.AST); 
 $smarty->assign('THM',$HOST.THM); 
 $smarty->assign('ADM',$HOST.ADM); 
 $smarty->assign('USR',$HOST.USR); 
 $smarty->assign('THEME',Theme);
 $smarty->assign('date',Year);
 $smarty->assign('WWW_ROOT',WWW_ROOT);
 $smarty->assign('TMP',WWW_ROOT . 'template' . DS . Theme);
 $smarty->assign('name',$option['0']['0']);
 $smarty->assign('short_desc',$option['1']['0']);
 $smarty->assign('min_deposit',$option['2']['0']);
 $smarty->assign('sumbole',$option['3']['0']);
 $smarty->assign('reCAPTCHA_site_key',$option['4']['0']);
 $smarty->assign('reCAPTCHA_secret_key',$option['5']['0']);
 $smarty->assign('background_image',$option['6']['0']);
 $smarty->assign('Favicon_url',$option['7']['0']);
 $smarty->assign('site_description',$option['8']['0']);
 $smarty->assign('site_title',$option['9']['0']);
 $smarty->assign('taxes',$option['10']['0']);
 $smarty->assign('language',$option['11']['0']);
 $smarty->assign('support_email',$option['12']['0']);
 $smarty->assign('code_head',$option['13']['0']);
 $smarty->assign('footer_code',$option['14']['0']);
 $smarty->assign('currency',$option['16']['0']);
 $smarty->assign('fb_link',$option['17']['0']);
 $smarty->assign('go_link',$option['18']['0']);
 $smarty->assign('tweet_link',$option['19']['0']);
 $smarty->assign('pin_link',$option['20']['0']);
 $smarty->assign('APPversion',$info->version);
 $smarty->assign('Logo',$option['21']['0']);
 $smarty->assign('Logo2',$option['22']['0']);
 $smarty->assign('account_activate_email',$option['23']['0']);
 $smarty->assign('body_code',$option['24']['0']);
 $smarty->assign('captcha_signup',$option['26']['0']);
 $smarty->assign('captcha_login',$option['27']['0']);
 $smarty->assign('captcha_forgot',$option['28']['0']);
 $smarty->assign('keywords',$option['29']['0']);
 $smarty->assign('enable_home_featured',$option['30']['0']);
 $smarty->assign('enable_home_popular',$option['31']['0']);
 $smarty->assign('enable_home_why',$option['32']['0']);
 $smarty->assign('enable_home_testimonial',$option['33']['0']);
 $smarty->assign('enable_home_announcement',$option['34']['0']);
 
 $number_itm = $query->addquery('select','cm_items','count(id) as num_items','i',"1",'status=?');
 $smarty->assign('num_items',number_format($number_itm->num_items));
 $itms = $query->addquery('select','cm_items','sum(sales) as sales','ii',"$uid,1",'user_id=?,status=?');
 $smarty->assign('author_sales',number_format($itms->sales));
 $getitm = $query->addquery('select','cm_items','count(id) as items','ii',"$uid,1",'user_id=?,status=?');
 $smarty->assign('author_items',$getitm->items);
 $data = $query->addquery('select','cm_items','sum(sales) as sales_n');
 $smarty->assign('sales_n',number_format($data->sales_n));
 $data = $query->addquery('select','cm_members','count(id) as user_n');
 $smarty->assign('user_n',number_format($data->user_n));

 //Deposits Methods
 $data = $query->addquery('select','cm_depMethods','status','s','Bitcoin','methods=?');
 $smarty->assign('btc_status',$data->status);
 $data = $query->addquery('select','cm_depMethods','status','s','PayPal','methods=?');
 $smarty->assign('PayPal_status',$data->status);
 
 if (isset($uid)):
  $user = $query->addquery('select','cm_members','*','i', $uid,'id=?');
  $smarty->assign('role',$user->role);
 endif;
 
 }

 public function sign_user_fun(){
 
 global $smarty,$query,$option,$uid,$HOST,$mail_option,$mail_host,$mail_port,$mail_ssluse,$mail_pass,$mail_username;
 
 if(isset($uid)):
    
 $user = $query->addquery('select','cm_members','*','i', $uid,'id=?');
 
 $smarty->assign('username',$user->username);
 $smarty->assign('email',$user->email);
 $smarty->assign('balance',$user->balance);
 $smarty->assign('avatar',$user->avatar);
 $smarty->assign('country',$user->country);
 $smarty->assign('since',$user->since);
 $smarty->assign('uid',$user->id);

 endif;
 
 //mailer
 $smarty->assign('mail_option',$mail_option);
 $smarty->assign('mail_host',$mail_host);
 $smarty->assign('mail_port',$mail_port);
 $smarty->assign('mail_ssl',$mail_ssluse);
 $smarty->assign('mail_pass',$mail_pass);
 $smarty->assign('mail_username',$mail_username);
 
 }
 
 public function sign_deposits(){

 global $smarty,$query,$bitcoin,$paypal;

 $bitcoin = $query->addquery('select','cm_depMethods','*','s', 'Bitcoin','methods=?');
 $paypal = $query->addquery('select','cm_depMethods','*','s', 'PayPal','methods=?');


 //bitcoin
 $smarty->assign('btc_processor',$bitcoin->processor);
 $smarty->assign('publick_key',$bitcoin->publick_key);
 $smarty->assign('secret_key',$bitcoin->secret_key);
 $smarty->assign('ipn',$bitcoin->ipn);
 $smarty->assign('merchant_id',$bitcoin->account);
 $smarty->assign('btc_address',$bitcoin->address);

 //paypal
 $smarty->assign('paypal_account',$paypal->account);

 }

 }

$smart = new smartyModel;
