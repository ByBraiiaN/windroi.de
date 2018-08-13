<section class="postComunidades"> <div class="box box-info"> <div class="box-header with-border"> <h3 class="box-title">Últimos temas</h3> <div class="box-tools pull-right"> <span class="pull-right">             <select class="form-control" onchange="com.ir_a_categoria(this.value)">            	<option value="{if $tsAct}-1{/if}">{if $tsAct}Ver todas{else}Seleccionar categor&iacute;a{/if}</option>                {foreach from=$tsCats item=c}                <option value="{$c.c_seo}" {if $tsAct == $c.c_seo}selected="selected"{/if}>{$c.c_nombre}</option>                {/foreach}            </select></span> </div> </div>
    {if $tsLastTemas.data}
<div class="box-body"> <div class="table-responsive"> <table class="table no-margin"> <tbody>{foreach from=$tsLastTemas.data item=t} <tr {if $c.c_estado == 1 || $t.t_estado == 1}style="opacity: 0.5;background: #000;" title="La tema ha sido eliminado"{/if}> <td><i class="com_icon {$t.sub_cat.c_seo}"></i><a class="qtip" href="{$tsConfig.url}/comunidades/{$t.c_nombre_corto}/{$t.t_id}/{$t.t_titulo|seo}.html" target="_self" original-title="{$t.t_titulo|truncate:45}">{$t.t_titulo|truncate:45}</a> </td> <td><span><a href="{$tsConfig.url}/comunidades/{$t.c_nombre_corto}/" class="k c19">{$t.c_nombre}</a></span><small>Por: <a href="{$tsConfig.url}/perfil/{$t.user_name}/">{$t.user_name}</a></small></td> </tr>{/foreach}</tbody></table> </div> </div>  
    <div class="com_temas_footer">
    	{if $tsPages.next <= $tsPages.pages || $tsPages.prev > 0}
    	<div class="alert alert-info ">
        	{if $tsPages.prev > 0 && $tsPages.max == false}<a href="pagina.{$tsPages.prev}" class="floatL">&laquo; Anterior</a>{/if}
            {if $tsPages.next <= $tsPages.pages}<a href="pagina.{$tsPages.next}" class="floatR">Siguiente &raquo;</a>
            {elseif $tsPages.max == true}<a href="pagina.2">Siguiente &raquo;</a>{/if}
        </div>
        {/if}
    </div>
    {else}
    	<div class="alert alert-info">No se han creado temas {if $tsAct}para esta categor&iacute;a{else}a&uacute;n{/if}</div>
    {/if}
</div> </section>