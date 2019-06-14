<?php

 require_once (dirname(dirname(dirname(__FILE__))).'/functions.php');
 
 $fun->do_updata('categories');

 $fun->do_upcat();
 
 show('Admin/Categories/edit');

?>