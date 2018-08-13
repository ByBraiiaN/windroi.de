1:
<div id="perfil_comunidades" status="activo">
    <div class="widget w-comunidades clearfix">
    	<div class="title-w clearfix">
            <h3>Comunidades en las que participa {$tsUsername}</h3>
        </div>
        {if $tsComunidades.data}
        <ul class="listado">
            {foreach from=$tsComunidades.data item=c}
            <li class="clearfix">
        	<div class="listado-content clearfix">
        		<div class="listado-avatar">
        			<a href="{$tsConfig.url}/comunidades/{$c.c_nombre_corto}/"><img src="{$tsConfig.url}/files/uploads/c_{$c.c_id}.jpg" width="32" height="32"/></a>
        		</div>
        		<div class="txt" style="font-size:11px;">
        			<a href="{$tsConfig.url}/comunidades/{$c.c_nombre_corto}/" style="color:#006595;font-weight:bold;font-size:12px;">{$c.c_nombre}</a><br />
                <span style="color: #999;">{$c.categoria}</span> {$c.c_descripcion|truncate:60}
        		</div>
        	</div>
        </li>
            {/foreach}
        </ul>
        {else}
        <div class="emptyData">{$tsUsername} no participa en ninguna comunidad</div>
        {/if}
    </div>
</div>