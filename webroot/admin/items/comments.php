<?php
 
 require_once (dirname(dirname(dirname(__FILE__))).'/functions.php');

 $fun->do_adcm();

 $fun->do_activate('comments','items/comments');

 $fun->do_deactivate('comments','items/comments');

 $fun->do_delete('comments','items/comments');

show('Admin/Items/comments');

?>