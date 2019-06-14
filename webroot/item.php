<?php

 require_once ('loader.php');

 /* check for errors */

 $fun->do_check('id','!isset');
 
 $item = $query->addquery('select','cm_items','*','i',$_GET['id'],'id=?');
 
 $fun->do_check($item,'!&');

 /* grabe user info */
 $get = $fun->do_userinfo($item->user_id);
 
 /* purchase item */
 if(isset($_POST["purchase"])):
    $_SESSION['item_id'] = $item->id;
    redirect(['action' => 'purchase']);
 endif;
     
 /* post comment */
 $fun->do_addcomment($item,$get);
 
 /* comments*/
 $fun->do_comments($item->id);

 /* reviews*/
 $fun->do_reviews($item->id);

 /* post review */
 $fun->do_addreview($item,$get);
 
 /* items data */
 $fun->do_item($item->id);

 /* grabe related items */
 $fun->do_products($item->category);

 show('User/Items/index');

?>