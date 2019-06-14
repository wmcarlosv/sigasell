<?php
 
 require_once (dirname(dirname(dirname(__FILE__))).'/functions.php');

 $fun->do_categories('adm');

 show('Admin/Items/add');

?>