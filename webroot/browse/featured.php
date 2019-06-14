<?php

 require_once (dirname(dirname(__FILE__)).'/loader.php');

 $fun->do_winfo('Featured Items');

 $fun->do_featureditems(true);

 show('User/Browse/featured');

?>