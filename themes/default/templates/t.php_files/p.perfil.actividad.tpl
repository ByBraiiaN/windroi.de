1:
{if $tsDo == ''}
	<header>
		<h3>Última actividad de {$tsUsername}</h3>
		<select onchange="actividad.cargar({$tsUserID},'filtrar', this.value)" id="last-activity-filter">
			<option value="0">Todas</option>
			<option value="1">Post nuevo</option>
			<option value="2">Post favorito</option>
			<option value="3">Post votado</option>
			<option value="4">Post recomendado</option>
			<option value="5">Comentario nuevo</option>
			<option value="6">Comentario votado</option>
			<option value="7">Siguiendo un post</option>
			<option value="8">Siguiendo un suario</option>
			<option value="9">Publicaciónes en muro</option>
			<option value="10">Le gusta</option>
		</select>
	</header>
	{if $tsActividad.total > 0}
	<div id="last-activity-container" class="last-activity">
		{foreach from=$tsActividad.data item=ad key=id}
		{if $ad.data}
		<div id="last-activity-date-{$id}" class="date-sep" active="true">
			<h3>{$ad.title}</h3>
			{foreach from=$ad.data item=ac}
			<ul>
                {if $ac.style != ''}
                <span class="monac_icons ma_{$ac.style}"></span>
                {/if}
                <span>{$ac.text}</span> 
                <a href="{$ac.link}">{$ac.ltext}</a>
                {if $tsUserID == $tsUser->uid}
                <span class="remove">
                    <a onclick="actividad.borrar({$ac.id}, this); return false;">x</a>
                </span>
                {/if}
                <span class="time">{$ac.date|hace}</span>
			</ul>
			{/foreach}
		</div>
		{/if}
		{/foreach}
		{if $tsActividad.total > 0 && $tsActividad.total >= 25}
		<h3 id="last-activity-view-more">
			<a onclick="actividad.cargar({$tsUserID},'more', 0); return false;" href="">Ver más actividad</a>
		</h3>
		{/if}
	</div>
	{else}
	<p class="emptyData">Este usuario no tiene actividad.</p>
	{/if}

{else}
{foreach from=$tsActividad.data item=ad key=id}
{if $ad.data}
<section id="more-{$id}" nid="last-activity-date-{$id}" class="date-sep perfilActividad" active="false">
	<h3 style="display:none">{$ad.title}</h3>
	{foreach from=$ad.data item=ac}
		<ul>
            {if $ac.style != ''}
            <span class="monac_icons ma_{$ac.style}"></span>
            {/if}
            <span>{$ac.text}</span> 
            <a href="{$ac.link}">{$ac.ltext}</a>
            {if $tsUserID == $tsUser->uid}
            <span class="remove">
            	<a onclick="actividad.borrar({$ac.id}, this); return false;">x</a>
            </span>
            {/if}
			<span class="time">{$ac.date|hace}</span>
		</ul>
	{/foreach}
</div>
{/if}
{/foreach}
{if $tsActividad.total > 0 && $tsActividad.total >= 25}
<h3 id="last-activity-view-more">
	<a onclick="actividad.cargar({$tsUserID},'more', 0); return false;" href="">Ver más actividad</a>
</h3>
{/if}
<div id="total_acts" val="{$tsActividad.total}"></div>
<div id="jsdump">
            <script type="text/javascript">
            // {literal}
            $(function(){
                /*
                    EL SIGUIENTE CODIGO SIRBE PARA NO MOSTRAR LOS SEPARADORES DE FECHA POR SI YA ESTAN,
                    ESTO FUE HECHO ASI PARA EVITAR MAS CONSULTAS AL SERVIDOR... 
                */
                var ac_dates = new Array('today', 'yesterday', 'month', 'old');
                for(var i = 0; i < ac_dates.length; i++){
                    var obj_name = 'last-activity-date-' + ac_dates[i];
                    var obj = $('#' + obj_name);
                    // MORE
                    var m_name = 'more-' + ac_dates[i];
                    var mobj = $('#' + m_name);
                    // ACTIVO
                    var active = obj.attr('active');
                    // VALIDAMOS
                    if(typeof active == 'undefined'){
                        //
                        var new_id = $(mobj).attr('nid');
                        $(mobj).attr('id',new_id);
                        $(mobj).find('h3').show();
                        $(mobj).removeAttr('nid').attr('active','true');
                        
                    } else {
                        $(mobj).find('h3').remove();
                        var html = $(mobj).html();
                        $(obj).append(html)
                        $(mobj).remove();
                    }
                }
                // ME AUTO ELIMINO
                $('#jsdump').remove();
            });
            // {/literal}
            </script>
            </div>
</div>
{/if}