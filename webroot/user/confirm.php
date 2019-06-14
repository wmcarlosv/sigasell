<?php

 require_once (dirname(dirname(__FILE__)).'/functions.php');
 require_once ('Coinpayment/coinpayments.inc.php');

 $data = $query->addquery('select','cm_depMethods','*','s','Bitcoin','methods=?');
 $cps = new CoinPaymentsAPI();
 $cps->Setup($data->secret_key, $data->publick_key);
 $invoice = $query->addquery('select','cm_invoice','*','s',$_GET['token'],'token=?');

 if( isset($_GET['cmd']) && $_GET['token'] == $invoice->token){

   $cmd_coinpayment = $_GET['cmd'];
   $item_name = $_GET['item_name'];
   $item_number = $_GET['item_number'];
   $amount = $_GET['amount'];
   $currency1 = $_GET['currency1'];
 
 switch($data->address){
  case NULL:
  $req = array(
    
  'cmd' => $cmd_coinpayment,
  'amount' => $amount,
  'currency1' => $currency1,
  'currency2' => 'BTC',
  'item_number'=> $item_number,
  'item_name' => $invoice->type,
  'ipn_url' => $HOST.'user/Bitcoin_ipn',

 );
  break;
  
  case true:
  $req = array(

  'cmd' => $cmd_coinpayment,
  'amount' => $amount,
  'currency1' => $currency1,
  'currency2' => 'BTC',
  'address' => $data->address,
  'item_number'=> $item_number,
  'item_name' => $invoice->type,
  'ipn_url' => $HOST.'user/Bitcoin_ipn',

);
    break;
}

 $result = $cps->CreateTransaction($req);

 if ($result['error'] == 'ok') {
  header('location:'.$result['result']['status_url']);
 }else{
  session_acv('coinpayment','error');
  $_SESSION['coinpayment']['msg']=$result['error'];
  header('location:'.$HOST.'user/deposit');
 }
 
}