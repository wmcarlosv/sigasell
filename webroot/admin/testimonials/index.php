<?php

 require_once (dirname(dirname(dirname(__FILE__))).'/functions.php');

 $fun->do_testimonials();

 $fun->do_activate('testimonials','testimonials/index');

 $fun->do_deactivate('testimonials','testimonials/index');

 $fun->do_delete('testimonials','testimonials/index');

 show('Admin/Testimonial/index');

?>