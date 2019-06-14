<?php
 
 require_once (dirname(dirname(dirname(__FILE__))).'/functions.php');

 $fun->do_categories('type');

 $fun->do_form();

 show('Admin/Items/form');

?>