<?php

 require_once (dirname(dirname(dirname(__FILE__))).'/functions.php');

 $fun->do_updata('items');

 $fun->do_upgenerale();

 show('Admin/Items/edit');

?>