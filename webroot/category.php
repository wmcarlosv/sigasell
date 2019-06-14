<?php

require_once ('loader.php');

 /* check for errors */

 $fun->do_check('cat','!isset');

 /* start categories products */

 $ctn = $fun->do_catname('cat','l');
 
 $fun->do_categories('usr');
 
 /* Display ALL Categories */

if($ctn == 'all'):

 $fun->do_winfo('ALL Categories');

 $smarty->assign('cat_name','ALL Categories');

 $fun->do_allproducts($result);

else:

 /* Display Other Categories */

 $fun->do_winfo($fun->do_catname('cat','n'));

 $smarty->assign('cat_name',$fun->do_catname('cat','n'));

 $fun->do_products($fun->do_catname('cat','i'),$ctn,'allproducts');

 endif;


show('User/Browse/category');

?>