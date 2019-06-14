<?php

 require_once ('loader.php');

 $fun->do_winfo('Create an Account');


 /* start signup*/

 $fun->do_signup();
 
 /* start login*/
 
 $fun->do_login();

 show('OAuth/Account/index');

?>