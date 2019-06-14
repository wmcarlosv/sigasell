<?php
/*
	Codsem.com API Class - v1
	Copyright 2018-2019 Codsem.com. All rights reserved.	
	License: GPLv2 - http://www.gnu.org/licenses/gpl-2.0.txt
*/

class CodesemAPI {
	private $api_key = ''; //client api key
	private $ch = null;
	
	public function Setup($api_key) {
		$this->api_key = $api_key;
		$this->ch = null;
	}
	

	/**
	 * Verify a purchase using client purchase code <br />
	 * @param "purchase code" The purchase code of purchased item can be found on downloads section.
	*/
	public function VerifyPurchase($purchase_code) {		
		$req = array(
			'purchase_code' => $purchase_code,
		);
		return $this->api_call('verify_purchase', $req);
	}


	private function is_setup() {
		return (!empty($this->api_key));
	}
	
	private function api_call($cmd, $req = array()) {
		if (!$this->is_setup()) {
			return array('error' => 'You have not called the Setup function with your API key!');
		}
		
		// Set the API command and required fields
        $req['version'] = 1;
		$req['cmd'] = $cmd;
		$req['key'] = $this->api_key;
		$req['format'] = 'json'; //supported values are json
	    
		// Generate the query string
		$post_data = http_build_query($req, '', '&');

		// Calculate the HMAC signature on the POST data
		$hmac = hash_hmac('sha512', $post_data, $this->api_key);
	    
		// Create cURL handle and initialize (if needed)
		if ($this->ch === null) {
			$this->ch = curl_init('https://api.codsem.com/api');
			curl_setopt($this->ch, CURLOPT_FAILONERROR, TRUE);
			curl_setopt($this->ch, CURLOPT_RETURNTRANSFER, TRUE);
			curl_setopt($this->ch, CURLOPT_SSL_VERIFYPEER, 0);
		}
		curl_setopt($this->ch, CURLOPT_HTTPHEADER, array('HMAC: '.$hmac));
		curl_setopt($this->ch, CURLOPT_POSTFIELDS, $post_data);
	    
		$data = curl_exec($this->ch);   
		
		if ($data !== FALSE) {
			if (PHP_INT_SIZE < 8 && version_compare(PHP_VERSION, '5.4.0') >= 0) {
				// We are on 32-bit PHP, so use the bigint as string option.
				$dec = json_decode($data, TRUE, 512, JSON_BIGINT_AS_STRING);
			} else {
				$dec = json_decode($data, TRUE);
			}
			if ($dec !== NULL && count($dec)) {
				return $dec;
			} else {
				// If you are using PHP 5.5.0 or higher you can use json_last_error_msg() for a better error message
				return array('error' => 'Unable to parse JSON result ('.json_last_error().')');
			}
		} else {
			return array('error' => 'cURL error: '.curl_error($this->ch));
		}
	}
};