<?php
 require_once (dirname(dirname(__FILE__)).'/functions.php');

 if( isset($_POST['activation-verify'] ) ){
   $fun->verify(check_request('api_key'),'activation');
 } else{
  $smarty->assign('license_msg',$_SESSION['license_msg']);
  alerts('license','activated');
  alerts('license','wrong');
 }
 
show('Admin/Activation/index');

?>