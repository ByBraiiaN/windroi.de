<div class="col-md-4">
<div class="box box-success">
<div class="box-header with-border">
	<h3 class="box-title">Menu</h3>
    <ul>
        <li{if $tsAction == 'seguidores'} class="selected"{/if}><a href="{$tsConfig.url}/monitor/seguidores">Seguidores</a></li>
        <li{if $tsAction == 'siguiendo'} class="selected"{/if}><a href="{$tsConfig.url}/monitor/siguiendo">Siguiendo</a></li>
        <li{if $tsAction == 'posts'} class="selected"{/if}><a href="{$tsConfig.url}/monitor/posts">Podsts</a></li>
    </ul>
</div>
</div>
</div>