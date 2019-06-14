 {include file='../Layout/header.tpl'}
   
    <title>Transactions - Admin</title>
    <div class="layout-content">
        <div class="layout-content-body">
            <div class="title-bar">

          <h1 class="title-bar-title">
            <span class="d-ib"><div class="fa fa-history"></div> Transactions </span>
          </h1>
                
 {include file='../Invoices/menu.tpl'}

    </div>

       <div class="row">
            <div class="col-xs-12">
                <div class="panel">
                 <div class="panel-body">
             <div class="table-responsive">
             <table class="table table-middle">
              <thead>
               <tr>
                <th><div class="fa fa-tag"></div> ID</th>
                <th><div class="fa fa-user"></div> User</th>
                <th style="text-align: center"><div class="fa fa-bank"></div> Method</th>
                <th style="text-align: center"><div class="fa fa-dollar"></div> TX ID</th>
                <th style="text-align: center"><div class="fa fa-dollar"></div> Amount</th>
                <th style="text-align: center"><div class="fa fa-unsorted"></div> Status</th>
                <th style="text-align: center"><div class="fa fa-calendar"></div> Created</th>
                <th style="text-align: center"><div class="fa fa-mail-reply-all"></div> Actions</th>
               </tr>
               </thead>
               <tbody>
               <tr>
                   
            {foreach from=$transactions item=foo}

                 <td style="font-size: 14px;"><b>#{$foo['id']}</b></td>
                 <td>
                   <form method="POST" action="{$ADM}users/view/{$foo['user_id']}/">
                     <button class="btn btn-info btn-xs"><i class="fa fa-user"></i> {$foo['username']}</button>
                   </form>
                 </td>
                 
                 <td style="text-align: center;font-size: 14px;">{$foo['type']}</td>
                 
                 <td style="text-align: center;font-size: 14px;">{$foo['txn_id']}</td>

                 <td style="text-align: center;font-size: 14px;">{$sumbole}{$foo['payment_gross']}
                  {if $foo['type'] == 'Coinpayments'}
                      (<b><small>{$foo['amount_btc']} BTC</small></b>)
                  {/if}
                 </td>

                 <td style="text-align: center;font-size: 14px;">{$foo['payment_status']}</td>
                 <td style="text-align: center;font-size: 15px;"><small>{$foo['created']}</small></td>

           {/foreach}

                    </tbody>
                   </table>
                  </div>  
                 </div>         
              </div>
              
 {if $transactions}

  <div class="row" style="text-align: center"> 
  <ul class="pagination">{$paging} </ul></div>

 {else}

  <center><span class="alert alert-danger text-center">No transactions to show...</span></center>

 {/if}
 
                        </div>
                    </div>
                </div>     
                
{include file='../Layout/footer.tpl'}