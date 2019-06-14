<?php

require_once (dirname(dirname(__FILE__)).'/loader.php');

 /* check for errors */

 $fun->do_check('username','!isset');

 $member = $query->addquery('select','cm_members','*','s', $_GET['username'],'username=?');

 $fun->do_check($member,'!');

 $fun->do_profile($member);

?>