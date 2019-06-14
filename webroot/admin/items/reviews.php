<?php
 
 require_once (dirname(dirname(dirname(__FILE__))).'/functions.php');

 $fun->do_adrev();

 $fun->do_activate('reviews','items/reviews');

 $fun->do_deactivate('reviews','items/reviews');

 $fun->do_delete('reviews','items/reviews');

show('Admin/Items/reviews');

?>