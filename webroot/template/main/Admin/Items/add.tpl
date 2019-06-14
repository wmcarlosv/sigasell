 {include file='../Layout/header.tpl'}

 <title>Add New Item - {$name}</title>
   <div class="layout-content">
        <div class="layout-content-body">
            <div class="title-bar">
                <h1 class="title-bar-title">
                    <span class="d-ib"><div class="fa fa-plus"></div> Add New Item</span>
                </h1>
                
 {include file='../Items/menu.tpl'}
 
            </div>


            <div class="col-sm-12">
                <div class="demo-form-wrapper">
                    
                    <form id="changeDataVO" class="form form-horizontal" data-toggle="validator" method="GET" action="{$ADM}items/form">
                      <div class="form-group">
                        <label for="paymentWay" class="col-sm-3 control-label">
                            Choose Category
                        </label>
                <div class="col-sm-6">
                   <div class="input-with-icon"><div class="icon icon-sitemap input-icon"></div> 
                     <select id="form-control-6" name="type" class="form-control">
                     {if !$categories}<option>(None)</option>{/if}
                     {foreach from=$categories item=foo}
                      <option value="{$foo['id']}">{$foo['name']}</option>
                     {/foreach}
                     </select>
                  </div>
                 </div>
               </div>

                        <div class="form-group">
                            <div class="col-sm-6 col-sm-offset-3">

                                <h5 style="color: red"></h5>
                                <h5 style="color: #00a000"></h5>

                                <br>
                                <button class="btn btn-primary btn-sm-6 btn-block" type="submit"><i class="fa fa-upload"></i> Upload</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    
 {include file='../Layout/footer.tpl'}