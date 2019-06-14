 {include file='../Layout/header.tpl'}
   
    <title>Pages - Admin</title>
    <div class="layout-content">
        <div class="layout-content-body">
            <div class="title-bar">

          <h1 class="title-bar-title">
            <span class="d-ib"><div class="fa fa-files-o"></div> Pages </span>
          </h1>
                
 {include file='../Pages/menu.tpl'}

     {if $updated}<div class="alert alert-success">Page Updated Successfully</div>{/if}
     {if $deactivated}<div class='alert alert-success'>Page Deactivated Successfully</div>{/if}
     {if $activated}<div class='alert alert-success'>Page Activated Successfully</div>{/if}
     {if $deleted}<div class="alert alert-success">Page Deleted Successfully</div>{/if}
     {if $added}<div class="alert alert-success">Page Added Successfully</div>{/if}
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
                <th><div class="fa fa-pencil"></div> Title</th>
                <th style="text-align: center"><div class="fa fa-link"></div> View</th>
                <th style="text-align: center"><div class="fa fa-unsorted"></div> Status</th>
                <th style="text-align: center"><div class="fa fa-calendar"></div> Created</th>
                <th style="text-align: center"><div class="fa fa-mail-reply-all"></div> Actions</th>
               </tr>
               </thead>
               <tbody>
               <tr>
            {foreach from=$pages item=foo}

                 <td style="font-size: 14px;"><b>#{$foo['id']}</b></td>
                 <td style="font-size: 14px;">{$foo['title']}</td>
                 <td style="text-align: center"><a href="{$HOST}page/{$foo['id']}/" target="_blank"><button class="btn btn-info btn-xs"><i class="fa fa-eye" style="font-size: 15px;"></i></button></a></td>
                        
                {if $foo['status']=='1'}
                  <td class="alert alert-success text-center" style="text-align: center">Active</td>
                {elseif $foo['status']=='2'}
                  <td class="alert alert-danger text-center" style="text-align: center">Inactive</td>
                {/if}
                
                 <td style="text-align: center;font-size: 14px;">{$foo['created']}</td>

                {if $foo['status']==1}

                  <td style="text-align: center">
                    <form method="POST">
                      <input type="hidden" name="id" value="{$foo['id']}"> 
                      <button class="btn btn-danger btn-xs" type="submit" name="deactivate" value="Deactivate" {if $foo['protect']=='1'}disabled="disabled"{/if} onclick="if (confirm(&quot;Are you sure?&quot;)) { document.post_5a529c86cb181240954732.submit(); } event.returnValue = false; return false;">Deactivate</button>
                    </form>
                   </td>
                        
               {elseif $foo['status']==2}

                  <td style="text-align: center">
                   <form method="POST">
                     <input type="hidden" name="id" value="{$foo['id']}"> 
                     <button class="btn btn-success btn-xs" type="submit" name="activate" value="activate">Activate</button>
                   </form>
                 </td>

              {/if}

                   <td style="text-align: center">
                     <form method="POST">
                      <input type="hidden" name="id" value="{$foo['id']}"> 
                      <button class="btn btn-warning btn-xs" type="submit" name="delete" value="Delete" {if $foo['protect']=='1'}disabled="disabled"{/if} onclick="if (confirm(&quot;Are you sure?&quot;)) { document.post_5a529c86cb181240954732.submit(); } event.returnValue = false; return false;">Delete</button>
                     </form> 
                    </td>
                 <td style="text-align: center">
                   <form action="{$ADM}pages/edit/{$foo['id']}/" method="POST">
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
              
 {if $pages}

  <div class="row" style="text-align: center"> 
  <ul class="pagination">{$paging} </ul></div>

 {else}

  <center><span class="alert alert-danger text-center">No Pages to show...</span></center>

 {/if}
 
                        </div>
                    </div>
                </div>     
                
{include file='../Layout/footer.tpl'}