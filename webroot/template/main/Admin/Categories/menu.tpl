    <hr>
    <div class="tab">
      <a href="{$ADM}categories/index"><button {if isset($adm_cats)} class="tablinks active"{/if}><div class="fa fa-sitemap"></div> Categories</button></a>
      <a href="{$ADM}categories/add"><button {if !isset($adm_cats)} class="tablinks active"{/if}><div class="fa fa-plus-circle"></div> Add Category</button></a>
    </div>
    <br>
    <br><br>