<?php

 require_once (dirname(dirname(__FILE__)).'/functions.php');

 $fun->do_winfo('Downloads');

 $fun->do_downloads('usr');

 $fun->do_tabs(false,true);

 if(isset($_SESSION["item"])):

 $smarty->assign('itm_complete',$_SESSION["item"]["id"]);

 $smarty->assign('itm_name',$_SESSION["item"]["name"]);

 endif;

 alerts('order','completed');

 show('User/Downloads/index');

?>