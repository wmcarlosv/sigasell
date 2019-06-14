    <hr>
    <div class="tab">
      <a href="{$ADM}users/index"><button {if isset($members)} class="tablinks active"{/if}><div class="fa fa-users"></div> Users</button></a>
      <a href="{$ADM}users/add"><button {if !isset($members)} class="tablinks active"{/if}><div class="fa fa-plus-circle"></div> Add User</button></a>
    </div>
    <br>
    <br><br>