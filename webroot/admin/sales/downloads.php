<?php

 require_once (dirname(dirname(dirname(__FILE__))).'/functions.php');

 $fun->do_downloads('adm');

 $fun->do_delete('downloads','sales/downloads');
 
 show('Admin/Downloads/index');

?>