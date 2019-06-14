<?php

 require_once (dirname(dirname(dirname(__FILE__))).'/functions.php');

 $fun->do_admcats();

 $fun->do_activate('categories','categories/index');

 $fun->do_deactivate('categories','categories/index');

 $fun->do_delete('categories','categories/index');

 show('Admin/Categories/index');

?>