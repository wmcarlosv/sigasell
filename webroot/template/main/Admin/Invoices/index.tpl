 {include file='../Layout/header.tpl'}
   
    <title>Invoices - Admin</title>
    <div class="layout-content">
        <div class="layout-content-body">
            <div class="title-bar">

          <h1 class="title-bar-title">
            <span class="d-ib"><div class="fa fa-bank"></div> Invoices </span>
          </h1>
                
 {include file='../Invoices/menu.tpl'}

     {if $activated}<div class='alert alert-success'>Invoice Marked As Paid!</div>{/if}
     {if $deleted}<div class="alert alert-success">Invoice Deleted Successfully</div>{/if}
     {if $do_error}<div class="alert alert-danger">Error: Somthing Wrong! Please Try again.</div>{/if}

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
                <th style="text-align: center"><div class="fa fa-dollar"></div> Amount</th>
                <th style="text-align: center"><div class="fa fa-bank"></div> Method</th>
                <th style="text-align: center"><div class="fa fa-unsorted"></div> Status</th>
                <th style="text-align: center"><div class="fa fa-calendar"></div> created</th>
                <th style="text-align: center"><div class="fa fa-mail-reply-all"></div> Actions</th>
               </tr>
               </thead>
               <tbody>
               <tr>
            {foreach from=$invoices item=foo}

                 <td style="font-size: 14px;"><b>#{$foo['id']}</b></td>
                 <td>
                   <form method="POST" action="{$ADM}users/view/{$foo['user_id']}/">
                     <button class="btn btn-info btn-xs"><i class="fa fa-user"></i> {$foo['username']}</button>
                   </form>
                 </td>

                 <td style="text-align: center;font-size: 14px;">{$sumbole}{$foo['amount']}</td>
                 <td style="text-align: center;font-size: 14px;">{$foo['method']}</td>

                {if $foo['status']==1}
                  <td class="alert alert-success text-center" style="text-align: center;font-size: 15px;">Paid</td>
                {elseif $foo['status']==2}
                  <td class="alert alert-danger text-center" style="text-align: center;font-size: 15px;">Unpaid</td>
                {/if}
                 
                 <td style="text-align: center;font-size: 15px;"><small>{$foo['created']}</small></td>

                {if $foo['status']==2}

                  <td style="text-align: center">
                   <form method="POST">
                     <input type="hidden" name="id" value="{$foo['id']}"> 
                     <input type="hidden" name="am" value="{$foo['amount']}"> 
                     <input type="hidden" name="uid" value="{$foo['user_id']}"> 
                     <button class="btn btn-success btn-xs" type="submit" name="activate" value="activate">Mark As Paid</button>
                   </form>
                 </td>

              {/if}

                   <td style="text-align: center">
                     <form method="POST">
                      <input type="hidden" name="id" value="{$foo['id']}"> 
                      <button class="btn btn-warning btn-xs" type="submit" name="delete" value="Delete" onclick="if (confirm(&quot;Are you sure?&quot;)) { document.post_5a529c86cb181240954732.submit(); } event.returnValue = false; return false;">Delete</button>
                     </form> 
                    </td>
                    </tr>
           {/foreach}

                    </tbody>
                   </table>
                  </div>  
                 </div>         
              </div>
              
 {if $invoices}

  <div class="row" style="text-align: center"> 
  <ul class="pagination">{$paging} </ul></div>

 {else}

  <center><span class="alert alert-danger text-center">No Categories to show...</span></center>

 {/if}
 
                        </div>
                    </div>
                </div>     
                
{include file='../Layout/footer.tpl'}