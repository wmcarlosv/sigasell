<?php

 require_once (dirname(dirname(dirname(__FILE__))).'/functions.php');
 
 $fun->do_addcat();
 
 show('Admin/Categories/add');

?>