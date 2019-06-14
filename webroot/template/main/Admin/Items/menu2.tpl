    <hr>
    <div class="tab">
      <a href="{$ADM}items/edit/{$r_id}/"><button {if isset($r_name)} class="tablinks active"{/if}><div class="fa fa-chevron-circle-right"></div> Generale</button></a>
      <a href="{$ADM}items/files/{$r_id}/"><button {if !isset($r_name)} class="tablinks active"{/if}><div class="fa fa-file-text"></div> Files</button></a>
    </div>
    <br>
    <br><br>