<?php
 
 class Request{

	public function csrf_token() {

		if(isset($_SESSION['csrfToken'])) 

			return $_SESSION['csrfToken']; 

		else{

			$token = bin2hex(openssl_random_pseudo_bytes(32));

			$_SESSION['csrfToken'] = $token;

			return $token;

		}

	}
 }
 $sr = new Request;
 $smarty->assign('csrfToken',$sr->csrf_token());