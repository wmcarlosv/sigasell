<?php

 require_once (dirname(dirname(dirname(__FILE__))).'/functions.php');

 $fun->do_themes();

 $fun->do_activate('themes','options/themes');

 $fun->do_deactivate('themes','options/themes');

 $fun->do_delete('themes','options/themes');

 //upload new theme

 if(isset($_POST["new"])){

   if($_FILES["userfile"]["name"]) {

     $filename = $_FILES["userfile"]["name"];
     $source = $_FILES["userfile"]["tmp_name"];
     $type = $_FILES["userfile"]["type"];
     $name = explode(".", $filename);
     $continue = strtolower($name[1]) == 'zip' ? true : false;

    if(!$continue) {
     die("The file you are trying to upload is not a .zip file Please try again.");
    }

     $target_path = WWW_ROOT.'template'.DS.'uploads'.DS.$filename;
     $theme_name = array('main');
 
    if(!in_array($name['0'], $theme_name)):
      $_SESSION['new']['do_error']=true;
      redirect(['controller' => 'admin', 'action' => 'options/themes']);
    endif;

   if(move_uploaded_file($source, $target_path)) {

    $zip = new ZipArchive();
    $x = $zip->open($target_path);

    if ($x === true):
      $zip->extractTo(WWW_ROOT.'template'.DS);
      $zip->close();
      unlink($target_path);
      $query->addquery('insert','cm_themes','name,version,created','sss',[$name[0],'1.0.0',$dateForm]);
    else:
      unlink($target_path);
      $_SESSION['new']['do_error']=true;
      redirect(['controller' => 'admin', 'action' => 'options/themes']);
    endif;
     $_SESSION['new']['pass']=true;
     redirect(['controller' => 'admin', 'action' => 'options/themes']);
   }else {
    $_SESSION['new']['do_error']=true;
    redirect(['controller' => 'admin', 'action' => 'options/themes']);
   }
  }
 } else{
   alerts('new','pass');
   alerts('new','do_error');
 } 

 show('Admin/Options/themes');

?>