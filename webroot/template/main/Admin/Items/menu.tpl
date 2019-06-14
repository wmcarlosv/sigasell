    <hr>
    <div class="tab">
      <a href="{$ADM}items/index"><button {if isset($items)} class="tablinks active"{/if}><div class="fa fa-cubes"></div> Admin Items</button></a>
      <a href="{$ADM}items/add"><button {if !isset($items) && !isset($comments) && !isset($reviews)} class="tablinks active"{/if}><div class="fa fa-plus-circle"></div> Add Item</button></a>
      <a href="{$ADM}items/comments"><button {if isset($comments)} class="tablinks active"{/if}><div class="fa fa-comment"></div> Comments</button></a>
      <a href="{$ADM}items/reviews"><button {if isset($reviews)} class="tablinks active"{/if}><div class="fa fa-star"></div> Reviews</button></a>
    </div>
    <br>
    <br><br>