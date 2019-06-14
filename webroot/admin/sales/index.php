<?php

 require_once (dirname(dirname(dirname(__FILE__))).'/functions.php');

 $fun->do_sales();

 $fun->do_activate('downloads','sales/index');

 $fun->do_deactivate('downloads','sales/index');

 $fun->do_delete('downloads','sales/index');
 
 $fun->do_refund();

 show('Admin/Downloads/sales');

?>