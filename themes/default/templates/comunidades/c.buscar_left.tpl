<form action="" method="GET" class="" id="search_form"><div class="box box-warning">                <div class="box-header with-border">              <h3 class="box-title">Buscador</h3>            </div>    <div class="box-body">	<input type="text" name="q" class="form-control floatL" value="{$q}" style="margin-right: 5px;width: 550px;" /><input type="submit" value="Buscar" class="btn btn-primary ibg" /></div></div>

    <br /><br />
{if $tsQuery.comus.data || $tsQuery.temas.data}
<div id="search_result"><h2>Resultados de la busqueda</h2>
	{if $tsQuery.comus.data}	<div class="box box-warning">
	<div class="box-header with-border "><h2 class="box-title">Comunidades ({$tsQuery.comus.total})</h2></div>
    <div class="box box-body">
        {foreach from=$tsQuery.comus.data item=c}
        <div class="result_item ">
        	<div class="ri_image floatL"><img src="{$tsConfig.url}/files/uploads/c_{$c.c_id}.jpg" width="32" height="32" /></div>
            <div class="ri_info floatL">
        		<a class="ri_title" href="{$tsConfig.url}/comunidades/{$c.c_nombre_corto}/">{$c.c_nombre}</a><br />
            	{$c.categoria} - {$c.subcategoria} - {$c.c_temas} Temas
            </div>
            <div class="ri_right floatR">
            	<strong>{$c.c_miembros}</strong>
                Miembros
            </div>
        </div>
        {/foreach}{if !$tipo && $tsQuery.comus.total > 10}<div class="alert alert-info" style="padding: 10px;"><a href="{$tsConfig.url}/comunidades/buscar/?tipo=comus&q={$q}">Ver m&aacute;s resultados</a></div>{/if}
    </div>
    
    <br /><br /></div>
	{/if}
    {if $tipo == 'comus' && !$tsQuery.comus.data}<div class="alert alert-warning">No se han encontrado resultados</div>{/if}
    {if $tsQuery.temas.data} <div class="box box-warning">
    <div class="box-header with-border "><h2 class="box-title">Temas ({$tsQuery.temas.total})</h2></div>
    <div class="box-body ">
        {foreach from=$tsQuery.temas.data item=t}
        <div class="result_item ">
            <div class="ri_info floatL">
                <i class="com_icon {$t.sub_cat.c_seo}" style="vertical-align: top;"></i><a class="ri_title" href="{$tsConfig.url}/comunidades/{$t.c_nombre_corto}/{$t.t_id}/{$t.t_titulo|seo}.html">{$t.t_titulo}</a><br />
                {$t.t_fecha|hace} - En <a href="{$tsConfig.url}/comunidades/{$t.c_nombre_corto}/">{$t.c_nombre}</a> - Por  <a href="{$tsConfig.url}/perfil/{$t.user_name}/">{$t.user_name}</a> - {$t.t_votos_pos} Votos
            </div>
            <div class="ri_right floatR">
                <strong>{$t.t_respuestas}</strong>
                Respuestas
            </div>
        </div>
        {/foreach}{if !$tipo && $tsQuery.temas.total > 10}<div class="alert alert-info" style="padding: 10px;"><a href="{$tsConfig.url}/comunidades/buscar/?tipo=temas&q={$q}">Ver m&aacute;s resultados</a></div>{/if}
    </div>
    </div>
    {/if}
    {if $tipo == 'temas' && !$tsQuery.temas.data}<div class="alert alert-warning">No se han encontrado resultados</div>{/if}
</div>
{if $tsQuery.pages.pages > 1}
<div class="pagination pagination-sm no-margin pull-right">
    {if $tsQuery.pages.prev}<a class="cp_prev" href="{$tsConfig.url}/comunidades/buscar/?q={$q}&cat={$cat}&ord={$ord}&tipo={$tipo}&page={$tsQuery.pages.prev}"></a>{/if}
    {if $tsQuery.pages.current <= 9}
    {section name=pages start=1 loop=$tsQuery.pages.pages+1 max=9}
    <a {if $tsQuery.pages.current == $smarty.section.pages.index}class="here"{/if} href="{$tsConfig.url}/comunidades/buscar/?q={$q}&cat={$cat}&ord={$ord}&tipo={$tipo}&page={$smarty.section.pages.index}">{$smarty.section.pages.index}</a>
    {/section}
    {else}
    <a href="{$tsConfig.url}/comunidades/buscar/?q={$q}&cat={$cat}&ord={$ord}&tipo={$tipo}&page={$tsQuery.pages.current-4}">{$tsQuery.pages.current-4}</a>
    <a href="{$tsConfig.url}/comunidades/buscar/?q={$q}&cat={$cat}&ord={$ord}&tipo={$tipo}&page={$tsQuery.pages.current-3}">{$tsQuery.pages.current-3}</a>
    <a href="{$tsConfig.url}/comunidades/buscar/?q={$q}&cat={$cat}&ord={$ord}&tipo={$tipo}&page={$tsQuery.pages.current-2}">{$tsQuery.pages.current-2}</a>
    <a href="{$tsConfig.url}/comunidades/buscar/?q={$q}&cat={$cat}&ord={$ord}&tipo={$tipo}&page={$tsQuery.pages.current-1}">{$tsQuery.pages.current-1}</a>
    <a class="here" href="{$tsConfig.url}/comunidades/buscar/?q={$q}&cat={$cat}&ord={$ord}&tipo={$tipo}&page={$tsQuery.pages.current}">{$tsQuery.pages.current}</a>
    {if $tsQuery.pages.pages >= $tsQuery.pages.current+1}
    <a href="{$tsConfig.url}/comunidades/buscar/?q={$q}&cat={$cat}&ord={$ord}&tipo={$tipo}&page={$tsQuery.pages.current+1}">{$tsQuery.pages.current+1}</a>
    {/if}
    {if $tsQuery.pages.pages >= $tsQuery.pages.current+2}
    <a href="{$tsConfig.url}/comunidades/buscar/?q={$q}&cat={$cat}&ord={$ord}&tipo={$tipo}&page={$tsQuery.pages.current+2}">{$tsQuery.pages.current+2}</a>
    {/if}
    {if $tsQuery.pages.pages >= $tsQuery.pages.current+3}
    <a href="{$tsConfig.url}/comunidades/buscar/?q={$q}&cat={$cat}&ord={$ord}&tipo={$tipo}&page={$tsQuery.pages.current+3}">{$tsQuery.pages.current+3}</a>
    {/if}
    {if $tsQuery.pages.pages >= $tsQuery.pages.current+4}
    <a href="{$tsConfig.url}/comunidades/buscar/?q={$q}&cat={$cat}&ord={$ord}&tipo={$tipo}&page={$tsQuery.pages.current+4}</a>
    {/if}
    {/if}
    {if $tsQuery.pages.pages > 1 && $tsQuery.pages.pages > $tsQuery.pages.current}<a class="cp_next" href="{$tsConfig.url}/comunidades/buscar/?q={$q}&cat={$cat}&ord={$ord}&tipo={$tipo}&page={$tsQuery.pages.next}"></a>{/if}
</div>
{/if}
{else}
{if $q}
<div class="alert alert-warning">No se han encontrado resultados para "{$q}"</div>
{else}
<div class="alert alert-info">Empieza por escribir una palabra clave</div>
{/if}
{/if}