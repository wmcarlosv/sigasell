<?php

 function contains($haystack, $needle){
    // string contains specific word?
    if (strpos($haystack, $needle) !== false) {
        return true;
     } else {
        return false;
     }
  }
 function startsWith($haystack, $needle) {
    // search backwards starting from haystack length characters from the end
    return $needle === "" || strrpos($haystack, $needle, -strlen($haystack)) !== false;
 }

 function endsWith($haystack, $needle) {
    // search forward starting from end minus needle length characters
    return $needle === "" || (($temp = strlen($haystack) - strlen($needle)) >= 0 && strpos($haystack, $needle, $temp) !== false);
 }
 
 function write($file,$content,$mode){
    // create a file and write content into it
   $fp = fopen($file,$mode);
        fwrite($fp,$content);
        fclose($fp);
  }
  
 function quick($arr=false){
    // quick redirect
   if(!$arr):
    header('location: '.ACCESS);
   else:
    header('location: '.str_replace($arr['origin'],$arr['redirect'],ACCESS));
   endif;
   exit;
  }

 function session_acv($name='',$action=''){
    // activate a session by name
   if(isset($action)){
    $_SESSION[$name][$action]=true;
   }
  }