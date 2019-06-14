<?php

 require_once (dirname(dirname(__FILE__)).'/loader.php');

 $smarty->assign('title','CSRF token mismatch');

 show('Pages/Errors/index');

?>