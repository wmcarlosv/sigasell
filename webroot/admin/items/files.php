<?php

 require_once (dirname(dirname(dirname(__FILE__))).'/functions.php');

 $fun->do_updata('items_files');

 $fun->do_upfiles();

 show('Admin/Items/files');

?>