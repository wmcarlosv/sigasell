<?php

 require_once (dirname(dirname(__FILE__)).'/loader.php');

 $fun->do_winfo('Popular Items');

 $fun->do_popularitems(true);

 show('User/Browse/popular');

?>