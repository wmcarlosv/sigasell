 {include file='../Layout/header.tpl'}
   
    <title>Users - Admin</title>
    <div class="layout-content">
        <div class="layout-content-body">
            <div class="title-bar">

          <h1 class="title-bar-title">
            <span class="d-ib"><div class="fa fa-users"></div> Users </span>
          </h1>
          
 {include file='../Users/menu.tpl'}

     {if $deactivated}<div class="alert alert-success">User Deactivated Successfully</div>{/if}
     {if $activated}<div class="alert alert-success">User Activated Successfully</div>{/if}
     {if $deleted}<div class="alert alert-success">User Deleted Successfully</div>{/if}
     {if $added}<div class="alert alert-success">User Added Successfully</div>{/if}
     {if $updated}<div class="alert alert-success">User Updated Successfully</div>{/if}
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
                <th><div class="fa fa-user"></div> Username</th>
                <th style="text-align: center"><div class="fa fa-sort"></div> Status</th>
                <th style="text-align: center"><div class="fa fa-envelope-o"></div> Email</th>
                <th style="text-align: center"><div class="fa fa-wifi"></div> Login IP</th>
                <th style="text-align: center"><div class="fa fa-calendar"></div> Created</th>
                <th style="text-align: center"><div class="fa fa-mail-reply-all"></div> Actions</th>
               </tr>
               </thead>
               <tbody>
               <tr>
           
            {foreach from=$members item=foo}

                 <td style="font-size: 14px;"><b>#{$foo['id']}</b></td>
                 <td style="font-size: 14px;">{$foo['username']}</td>
                {if $foo['status']==1}
                 <td class="alert alert-success text-center" style="text-align: center">Active</td>
                {elseif $foo['status']==2}
                 <td class="alert alert-danger text-center" style="text-align: center">Inactive</td>
                {elseif $foo['status']==3}
                 <td class="alert alert-warning text-center" style="text-align: center">Pending</td>
                {/if}
                 <td style="text-align: center">{$foo['email']} </td>
                 <td style="text-align: center"><small>{$foo['login_ip']}</small></td>
                 <td style="text-align: center;font-size: 14px;">{$foo['created']}</td>

                 <td style="text-align: center">
                   <a href="{$ADM}users/view/{$foo['id']}/">
                      <button class="btn btn-info btn-xs">View</button>
                    </a>
                 </td>

                 {if $foo['status']==1}
                  <td style="text-align: center">
                    <form method="POST">
                      <input type="hidden" name="id" value="{$foo['id']}"> 
                      <button class="btn btn-danger btn-xs" type="submit" name="deactivate" value="Deactivate" onclick="if (confirm(&quot;Are you sure?&quot;)) { document.post_5a529c86cb181240954732.submit(); } event.returnValue = false; return false;">Deactivate</button>
                    </form>
                   </td>
                 {elseif $foo['status']==2}
                  <td style="text-align: center">
                   <form method="POST">
                     <input type="hidden" name="id" value="{$foo['id']}"> 
                     <button class="btn btn-success btn-xs" type="submit" name="activate" value="activate">Activate</button>
                   </form>
                 </td>
                 {elseif $foo['status']==3}
                  <td style="text-align: center">
                   <form method="POST">
                     <input type="hidden" name="id" value="{$foo['id']}"> 
                     <button class="btn btn-success btn-xs" type="submit" name="activate" value="activate">Activate</button>
                   </form>
                 </td>
                 {/if}
                 
                   <td style="text-align: center">
                     <form method="POST" action="{$ADM}users/edit/{$foo['id']}/">
                      <button class="btn btn-success btn-xs" type="submit">Edit</button>
                     </form> 
                    </td>

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
              
 {if $members}

  <div class="row" style="text-align: center"> 
  <ul class="pagination">{$paging} </ul></div>

 {else}

  <center><span class="alert alert-danger text-center">No users to show...</span></center>

 {/if}
 
                        </div>
                    </div>
                </div>     
                
{include file='../Layout/footer.tpl'}