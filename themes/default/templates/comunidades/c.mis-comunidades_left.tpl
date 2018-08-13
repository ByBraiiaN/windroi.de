<div class="box box-info">
            <div class="box-header with-border">
              <h3 class="box-title">Mis Comunidades {if $tsMisComus.orden}por {$tsMisComus.orden}{/if} ({if $tsMisComus.pages.van > $tsMisComus.total}{$tsMisComus.total}{else}{$tsMisComus.pages.van}{/if}/{$tsMisComus.total})</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body" style="">
{if $tsMisComus.total != '0'}
    {foreach from=$tsMisComus.data item=m}

	
	<ul> <header> <h4> <a href="{$tsConfig.url}/comunidades/{$m.c_nombre_corto}/" style="color:#ff6633">{$m.c_nombre} {if $m.m_permisos == 5}<strong style="color:red">(Tuya)</strong>{/if}</a></a> </h4> </header> <div class="avatarBox"> <img width="75" height="75" src="{$tsConfig.url}/files/uploads/c_{$m.c_id}.jpg" class="av"> </div> 
             <li>Categor&iacute;a: <strong>{$m.categoria}</strong></li>

            <li title="{$m.c_descripcion}">{$m.c_descripcion|limit:85}</li>

            <li>Miembros <strong>{$m.c_miembros}</strong> - Temas <strong>{$m.c_temas}</strong></li>

            <li>Mi rango: <strong>{if $m.m_permisos == 5}Administrador{elseif $m.m_permisos == 4}Moderador{elseif $m.m_permisos == 3}Posteador{elseif $m.m_permisos == 2}Comentador{elseif $m.m_permisos == 1}Visitante{/if}</strong></li> </ul>

    {/foreach}
{if $tsMisComus.pages.pages > 1}

<ul class="pagination pagination-sm no-margin pull-right">

	{if $tsMisComus.pages.prev}<li><a class="cp_prev" href="{$tsConfig.url}/comunidades/mis-comunidades/{$tsMisComus.orden}.{$tsMisComus.pages.prev}/"></a></li>{/if}

	{section name=pages start=1 loop=$tsMisComus.pages.pages+1 max=$tsMisComus.pages.pages}

    <li><a {if $tsMisComus.pages.current == $smarty.section.pages.index}class="here"{/if} href="{$tsConfig.url}/comunidades/mis-comunidades/{$tsMisComus.orden}.{$smarty.section.pages.index}/">{$smarty.section.pages.index}</a></li>

    {/section}

    {if $tsMisComus.pages.pages > 1 && $tsMisComus.pages.pages > $tsMisComus.pages.current}<li><a class="cp_next" href="{$tsConfig.url}/comunidades/mis-comunidades/{$tsMisComus.orden}.{$tsMisComus.pages.next}/"></a></li>{/if}

</ul>

{/if}
{else}
<div class="alert alert-info">No tienes comunidades</div>
{/if}

            </div>
            <!-- /.box-body -->
          </div>









