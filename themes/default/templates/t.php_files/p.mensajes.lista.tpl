    {if $tsMensajes.data}
    {foreach from=$tsMensajes.data item=mp}
      <div class="slimScrollDiv">
                    <ul class="menu" style="margin-left: -61px;">
    
	<li{if $mp.mp_read_to == 0 || $mp.mp_read_mon_to == 0} class="unread"{/if} style="width: 287px;">
      <div class="pull-left">
    <a href="{$tsConfig.url}/perfil/{$mp.user_name}"> <img  style="margin: 0px 6px 0px 3px;width: 50px;"class="img-circle" src="{$tsConfig.url}/files/avatar/{$mp.mp_from}_120.jpg" alt="{$mp.user_name}"/></a></div>
          <h4>
                            <a class="qtip" title="{$mp.mp_subject}" href="{$tsConfig.url}/mensajes/leer/{$mp.mp_id}" style="text-transform: capitalize;font-size: 14px;">{$mp.mp_subject|truncate:15}</a>
                            <small style="font-size:11px;float: right;margin-right: 6px;color: #777;margin-top: 6px;"><i class="fa fa-clock-o"></i> {$mp.mp_date|fecha}</small>
                          </h4>
     <a style="font-size: 12px;color:#777;" href="{$tsConfig.url}/mensajes/leer/{$mp.mp_id}" title="{$mp.mp_preview}">
   
               <span><i style="margin-right: 5px;" class="fa fa-envelope text-muted"></i>{$mp.mp_preview}</span>
           
        </a>
    </li></ul></div>
    {/foreach}
    {else}
    <div class="emptyData">No tienes mensajes</div>
    {/if}
    
    
    
    
