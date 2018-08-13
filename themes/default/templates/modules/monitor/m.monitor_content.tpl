<br/><div class="col-md-8">
	<div class="box box-info">
		<div class="box-header with-border">
		<h3 class="box-title">&Uacute;ltimas {$tsData.total} notificaciones</h3>			  
		<div class="box-body">
        {if $tsData.data}
			{foreach from=$tsData.data item=noti}
            <li{if $noti.unread > 0} class="unread"{/if}>
			<div class="avatar-box" style="z-index: 99;">
            <a href="{$tsConfig.url}/perfil/{$noti.user}">
            <img height="32" width="32" src="{$tsConfig.url}/files/avatar/{$noti.avatar}"/>
            </a>
			</div>
			<div class="notification-info">
			<span>{if $noti.total == 1}<a href="{$tsConfig.url}/perfil/{$noti.user}">{$noti.user}</a>{/if} 
			<span title="{$noti.date|fecha}" class="time">{$noti.date|fecha}</span></span>
			<span class="action">
			<span class="monac_icons ma_{$noti.style}"></span>{$noti.text}
			<a href="{$noti.link}">{$noti.ltext}</a>
			</span>
			</div>
			</li>
		{/foreach}
		{else}
		<div class="emptyData">No tienes notificaciones</div>
		{/if}
		</div>
		</div>
	</div>
</div>
