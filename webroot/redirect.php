<?php

require_once ('loader.php');

 /* check for errors */

 $fun->do_check('id','!isset');

 $item = $query->addquery('select','cm_items','name,id,demo_url','i', $_GET['id'],'id=?');

 $fun->do_check($item,'!&');
 
 //redirect to demo
 
 $fun->redirect(['action' => $item->demo_url]);

?>