<?php

 require_once (dirname(dirname(__FILE__)).'/functions.php');

 $fun->do_winfo('Statement');

 $fun->do_tabs(false,false,false,false,false,true);

 $fun->do_statements();
 
 show('User/Statement/index');

?>