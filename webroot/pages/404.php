<?php

 require_once (dirname(dirname(__FILE__)).'/loader.php');

 $smarty->assign('title','Page Not Found');

 show('Pages/404/index');

?>