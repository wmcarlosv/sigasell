<?php

 require_once (dirname(dirname(__FILE__)).'/loader.php');

 if(!isset($_GET['item_number'])) {
  exit('NOT ALLOWED');
 } else {

  $invoice = $query->addquery('select','cm_invoice','*','i',$_GET['item_number'],'id=?');

 if(isset($_GET['item_number']) && $invoice->token == $_GET['cm']){

  $invoice_number =     $_GET['item_number']; 
  $item_name      =     $_GET['item_name']; 
  $txn_id         =     $_GET['tx']; 
  $payment_gross  =     $_GET['amt']; 
  $currency_code  =     $_GET['cc']; 
  $payment_status =     $_GET['st']; 
  $custom         =     $_GET['cm'];

  //transactions
  $transaction = $query->addquery('select','cm_payments','*','s',$txn_id,'txn_id=?');
	

 //validate
 if(!empty($txn_id) && $payment_gross == $invoice->amount && $payment_status == 'Completed' && $custom == $invoice->token && $transaction->txn_id != $txn_id){

 //success
 $query->addquery('insert','cm_payments','user_id,item_number,txn_id,payment_gross,currency_code,payment_status,type,created','isssssss',[$invoice->user_id,$invoice_number,$txn_id,$payment_gross,$currency_code,$payment_status,'PayPal',$dateForm]);

 $query->addquery('update','cm_invoice','status=?','ii',['1',$invoice_number],'id=?');

 if($invoice->type == '2'):
    
  $item = $query->addquery('select','cm_items','*','i',$invoice->item_id,'id=?');
  $query->addquery('insert','cm_downloads','user_id,item_id,price,amount,purchase_key,created','iissss',[$invoice->user_id,$item->id,$item->price,$invoice->amount,$invoice->token,$dateForm]);
 
 if($item->is_popular == '2'):
   $query->addquery('update','cm_items','is_popular=?','ii',['1',$item->id],'id=?');
 endif;
 
 $query->addquery('update','cm_members','balance=balance+?','ssi',[$invoice->amount,$item->user_id],'id=?');
 $query->addquery('update','cm_items','sales=sales+?,amount_sales=amount_sales+?','isi',[1,$invoice->amount,$item->id],'id=?');
 $query->addquery('insert','cm_statement','user_id,item_id,amount,type,created','iisss',[$invoice->user_id,$item->id,$invoice->amount,'purchase',$dateForm]);
 $query->addquery('insert','cm_statement','user_id,item_id,name,amount,icon_item,avatar,username,type,created','iisssssss',[$item->user_id,$item->id,$item->name,$amAuthor,$item->icon_img,$item->icon_img,$item->username,'sale',$dateForm]);

 session_acv('order','completed');
 $_SESSION["item"]["id"] = $item->id;
 $_SESSION["item"]["name"] = $fun->TitleBuild($item->name);
 redirect(['controller' => 'user','action' => 'downloads']);
    
 elseif($invioce->type == '1'):

  $query->addquery('update','cm_members','balance=balance+?','si',[$payment_gross,$invoice->user_id],'id=?');
  header('location:'.HOST.'user/deposit?status=success');

 endif;

    }else{

  //error

  $query->addquery('insert','cm_payments','user_id,item_number,txn_id,payment_gross,currency_code,payment_status,type,created','isssssss',[$invoice->user_id,$invoice_number,$txn_id,$payment_gross,$currency_code,'Failed','PayPal',$dateForm]);

  header('location:'.HOST.'user/deposit?status=failed');
   }
  }
 }

?> 