<?php
 
 require_once (dirname(dirname(dirname(__FILE__))).'/functions.php');

 $fun->do_items();

 $fun->do_activate('items','items/index');

 $fun->do_deactivate('items','items/index');

 $fun->do_delete('items','items/index');

show('Admin/Items/index');

?>