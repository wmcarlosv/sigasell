<?php

 require_once (dirname(dirname(__FILE__)).'/functions.php');

 $fun->do_winfo('Deposit history');

 $fun->do_tabs(false,false,false,true);

 $fun->do_invoices(1);

 show('User/Deposit/history');

?>