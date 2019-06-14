 {include file='../Layout/header.tpl'}
   
    <title>Items - Admin</title>
    <div class="layout-content">
        <div class="layout-content-body">
            <div class="title-bar">

          <h1 class="title-bar-title">
            <span class="d-ib"><div class="fa fa-cubes"></div> Admin Items</span>
          </h1>
          
 {include file='../Items/menu.tpl'}

     {if $updated}<div class='alert alert-success'>Item Updated Successfully</div>{/if}
     {if $deactivated}<div class='alert alert-success'>Item Deactivated Successfully</div>{/if}
     {if $activated}<div class='alert alert-success'>Item Activated Successfully</div>{/if}
     {if $deleted}<div class="alert alert-success">Item Deleted Successfully</div>{/if}
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
                <th><div class="fa fa-pencil"></div> Name</th>
                <th style="text-align: center"><div class="fa fa-link"></div> Demo</th>
                <th style="text-align: center"><div class="fa fa-file-zip-o"></div> Files</th>
                <th style="text-align: center"><div class="fa fa-money"></div> Sales</th>
                <th style="text-align: center"><div class="fa fa-list-alt"></div> Category</th>
                <th style="text-align: center"><div class="fa fa-dollar"></div> Price</th>
                <th style="text-align: center"><div class="fa fa-unsorted"></div> Status</th>
                <th style="text-align: center"><div class="fa fa-mail-reply-all"></div> Actions</th>
               </tr>
               </thead>
               <tbody>
               <tr>
            {foreach from=$items item=foo}

                 <td style="font-size: 14px;"><b>#{$foo['id']}</b></td>
                 <td style="font-size: 14px;">{$foo['name']}</td>
                 <td style="text-align: center"><a href="{$foo['demo_url']}" target="_blank"><button class="btn btn-info btn-xs"><i class="fa fa-eye" style="font-size: 15px;"></i></button></a></td>
                 <td style="text-align: center"><a href="{$foo['main_file']}"><button class="btn btn-success btn-xs"><i class="fa fa-download" style="font-size: 15px;"></i></button></a></td>
                 <td style="text-align: center">{$foo['sales']} </td>
                 <td style="text-align: center;font-size: 14px;">{$foo['category']}</td>
                 <td style="text-align: center">{$sumbole}{$foo['price']}</td>
                        
                {if $foo['status']==1}
                  <td class="alert alert-success text-center" style="text-align: center">Active</td>
                {elseif $foo['status']==2}
                  <td class="alert alert-danger text-center" style="text-align: center">Inactive</td>
                {/if}
                                          
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
                     <button class="btn btn-success btn-xs" type="submit" name="activate" value="Activate">Activate</button>
                   </form>
                 </td>

              {/if}

                   <td style="text-align: center">
                     <form method="POST">
                      <input type="hidden" name="id" value="{$foo['id']}"> 
                      <button class="btn btn-warning btn-xs" type="submit" name="delete" value="Delete" onclick="if (confirm(&quot;Are you sure?&quot;)) { document.post_5a529c86cb181240954732.submit(); } event.returnValue = false; return false;">Delete</button>
                     </form> 
                    </td>
                 <td style="text-align: center">
                   <form action="{$ADM}items/edit/{$foo['id']}/" method="POST">
                    <button class="btn btn-success btn-xs">Edit</button>
                   </form>
                 </td>
                    </tr>
           {/foreach}

                    </tbody>
                   </table>
                  </div>  
                 </div>         
              </div>
              
 {if $items}

  <div class="row" style="text-align: center"> 
  <ul class="pagination">{$paging} </ul></div>

 {else}

  <center><span class="alert alert-danger text-center">No items to show...</span></center>

 {/if}
 
                        </div>
                    </div>
                </div>     
                
{include file='../Layout/footer.tpl'}