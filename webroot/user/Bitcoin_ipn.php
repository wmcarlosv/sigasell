<?php

require_once (dirname(dirname(__FILE__)).'/loader.php');

 $cp_data = $query->addquery('select','cm_depMethods','account,ipn','s','Bitcoin','methods=?');
 $cp_debug_email = '';

  function errorExit($error_msg) {
   global $cp_debug_email; 
    if (!empty($cp_debug_email)) { 
     $report = 'Error: '.$error_msg."\n\n"; 
     $report .= "POST Data\n\n"; 
    foreach ($_POST as $k => $v) { 
     $report .= "|$k| = |$v|\n"; 
  } 
  mail($cp_debug_email, 'CoinPayments IPN Error', $report); 
 } 
    die('IPN Error: '.$error_msg); 
  } 


 if (!isset($_POST['ipn_mode']) || $_POST['ipn_mode'] != 'hmac') {
  errorExit('IPN Mode is not HMAC');
 }

 if (!isset($_SERVER['HTTP_HMAC']) || empty($_SERVER['HTTP_HMAC'])) { 
  errorExit('No HMAC signature sent.'); 
 } 


 if (!isset($_POST['merchant']) || $_POST['merchant'] != trim($cp_data->account)) {
  errorExit('No or incorrect Merchant ID passed'); 
 }

 $request = file_get_contents('php://input'); 
 if ($request === FALSE || empty($request)) { 
  errorExit('Error reading POST data'); 
 }

 $hmac = hash_hmac("sha512", $request, trim($cp_data->ipn));

 //if (!hash_equals($hmac, $_SERVER['HTTP_HMAC'])) { <--- Use this if you are running a version of PHP greather than 5.6.0 with the hash_equals function

 if ($hmac != $_SERVER['HTTP_HMAC']) {
  errorExit('HMAC signature does not match'); 
}

//POST DATA

$txn_id = $_POST['txn_id'];
$item_name = $_POST['item_name'];
$amount1 = floatval($_POST['amount1']); 
$amount2 = floatval($_POST['amount2']); 
$currency1 = $_POST['currency1']; 
$currency2 = $_POST['currency2']; 
$status = intval($_POST['status']); 
$status_text = $_POST['status_text']; 
$item_number = $_POST['item_number'];

  //invoice
  $invoice = $query->addquery('select','cm_invoice','*','i',$item_number,'id=?');
  
 if ($currency1 != $option[17][0]) { 
  errorExit('Original currency mismatch!'); 
 }     

  if ($amount1 < $invoice->amount) { 
   errorExit('Amount is less than order total!'); 
  }
   
  if ($status >= 100 || $status == 2) { 

  //success
  $query->addquery('insert','cm_payments','user_id,item_number,txn_id,payment_gross,amount_btc,currency_code,payment_status,type,created','issssssss',[$invoice->user_id,$item_number,$txn_id,$amount1,$amount2,$currency1,$status_text,'Coinpayments',$dateForm]);
  $query->addquery('update','cm_invoice','status=?','ii',['1',$item_number],'id=?');
  $query->addquery('update','cm_members','balance=balance+?','si',[$amount1,$invoice->user_id],'id=?');
  $query->addquery('update','cm_members','admin_earnings=admin_earnings+?','si',[$amount1,'admin'],'role=?');

 } else if ($status < 0) {

  //progress / error

 } else {

  //pending
  $query->addquery('insert','cm_payments','user_id,item_number,txn_id,payment_gross,amount_btc,currency_code,payment_status,type,created','issssssss',[$invoice->user_id,$item_number,$txn_id,$amount1,$amount2,$currency1,$status_text,'Coinpayments',$dateForm]);

 } 

  die('IPN OK'); 

?>