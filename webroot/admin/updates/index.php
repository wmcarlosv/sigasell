<?php

 require_once (dirname(dirname(dirname(__FILE__))).'/functions.php');

 if(isset($_POST["submit"])){

 if($_FILES["userfile"]["name"]) {

   $filename = $_FILES["userfile"]["name"];
   $source = $_FILES["userfile"]["tmp_name"];
   $type = $_FILES["userfile"]["type"];

   $name = explode(".", $filename);
   $accepted_types = array('application/zip', 'application/x-zip-compressed', 'multipart/x-zip', 'application/x-compressed');

  foreach($accepted_types as $mime_type) {
    if($mime_type == $type) {
      $okay = true;
    break;
   }
  }

  $continue = strtolower($name[1]) == 'zip' ? true : false;

  if(!$continue) {
    die("The file you are trying to upload is not a .zip file Please try again.");
  }

 $target_path = ROOT.DS.'updates'.DS.$filename;

 if(move_uploaded_file($source, $target_path)) {

   $zip = new ZipArchive();
   $x = $zip->open($target_path);

 if ($x === true):
   $zip->extractTo(ROOT.DS);
   $zip->close();
   unlink($target_path);
 endif;

 /*
 |--------------------------------------------------------------------------
 | Uploaded / extracted 
 |--------------------------------------------------------------------------
 |
 | Set version / rewrite some files
 |
 */
 
 //rewrite files
  
  $appConfig = get_app($HOST,Theme,'on',$_GET['v'],$sr->csrf_token(),$info->app,$info->start,$dateForm);
  write(CONFIG.'app.php',$appConfig,'w');
 
  $requirements = get_requirements();
  $fname = WWW_ROOT.'home.php';
  $fhandle = fopen($fname,"r");
  $content = fread($fhandle,filesize($fname));
  $content = str_replace("//REQUIREMENT", "$requirements", $content);
  write($fname,$content,'w');

   $smarty->assign('up_err',false);
   redirect(['controller' => 'admin', 'action' => 'updates/complete']);

  }else{

    $smarty->assign('up_err',true);
   }
  }
 } else {
   $smarty->assign('up_err',false);
 }

 show('Admin/Updates/index');
 
 ?>