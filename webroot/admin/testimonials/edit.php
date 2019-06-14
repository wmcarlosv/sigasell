<?php

 require_once (dirname(dirname(dirname(__FILE__))).'/functions.php');
 
 $fun->do_updata('testimonials');

 $fun->do_uptestimonial();
 
 show('Admin/Testimonial/edit');

?>