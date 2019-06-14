<?php

 class checkouts{
  //checkouts
      public function paypal($costum,$name,$number,$amount,$paypal_account){
      global $HOST,$option;
  
     $cmd ='https://www.paypal.com/cgi-bin/webscr?cmd=_xclick&charset=utf-8&';
     $item_name = 'item_name='.$name.'&';
     $item_number = 'item_number='.$number.'&';
     $item_amount = 'amount='.$amount.'&';
     $paypal_business = 'business='.$paypal_account.'&';
     $currency_paypal = 'currency='.$option[16][0].'&';
     $cancel_return = 'cancel_return='.$HOST.'user/deposit?status=failed&';
     $return = 'return='.$HOST.'user/Paypal_ipn&';
     $notify_url = 'notify_url='.$HOST.'user/Paypal_ipn&';
     $sc_token = 'custom='.$costum;

     header('location:' .$cmd.$item_name.$item_number.$item_amount.$paypal_business.$currency_paypal.$cancel_return.$return.$sc_token);

}
      public function coinpayments($costum,$name,$number,$amount){
      global $HOST,$option;
 
       $cmd = $HOST.'user/confirm?cmd=create_transaction&';
       $item_name = 'item_name='.$name.'&';
       $item_number = 'item_number='.$number.'&';
       $item_amount = 'amount='.$amount.'&';
       $currency1 = 'currency1='.$option[16][0].'&';
       $currency2 = 'currency2=BTC&';
       $sc_token = 'token='.$costum;
       header('location:'.$cmd.$item_name.$item_number.$item_amount.$currency1.$currency2.$sc_token);
}

  }
