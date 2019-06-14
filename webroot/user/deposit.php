<?php

 require_once (dirname(dirname(__FILE__)).'/functions.php');

 $fun->do_winfo('Deposit Cash');

 $fun->do_tabs(false,false,false,false,true);

 $fun->do_credits();

 $fun->do_deposit();

 show('User/Deposit/index');
 
?>