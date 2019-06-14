<?php

 require_once (dirname(dirname(dirname(__FILE__))).'/functions.php');
 
 $fun->do_updata('members');

 show('Admin/Users/view');

?>