    {if $tsData}
	{foreach from=$tsData item=noti}
    <div class="slimScrollDiv">
                    <ul class="menu" style="margin-left: -61px;">
    
   	<li{if $noti.unread > 0}  class="unread"{/if} style="width: 300px;  padding: 6px;">
    
        <span class="monac_icons ma_{$noti.style}"></span>{if $noti.total == 1}
        <a class="qtip" href="{$tsConfig.url}/perfil/{$noti.user}" title="{$noti.user}">{$noti.user}</a>
        {/if} 
    <span class="text-muted">{$noti.text}</span>
        <a title="{$noti.ltit}" class="qtip" href="{$noti.link}">{$noti.ltext}</a>
    </li>
    
    
    </ul>
    {/foreach}
    
    {else}
    <li style="padding:10px;"><b>No hay notificaciones</b></li>
    {/if}
    