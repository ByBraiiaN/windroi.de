<div class="box box-success">
            <div class="box-header with-border">
              <h3 class="box-title">Directorio de comunidades</h3>
              <!-- /.box-tools -->
            </div>
            <!-- /.box-header -->
            <div class="box-body">
Buscando en: {if $tsDir.c_seo}

      <a href="{$tsConfig.url}/comunidades/dir/{$tsDir.global_url}/">{$tsDir.global_pais} &raquo;</a>

        {$tsDir.c_nombre} {elseif $tsDir.sub.sid > 0}
        <a href="{$tsConfig.url}/comunidades/dir/{$tsDir.global_url}/">{$tsDir.global_pais} &raquo;</a> <a href="{$tsConfig.url}/comunidades/dir/{$tsDir.global_url}/{$tsDir.sub.c_seo}">{$tsDir.sub.c_nombre} &raquo;</a>  {$tsDir.sub.s_nombre} {else} {$tsDir.global_pais} {/if}
            </div>
            <!-- /.box-body -->
          </div>


<div class="box box-info">
            <div class="box-header with-border">
              <h3 class="box-title">{if $tsDir.c_seo}Elige una sub-categoria{elseif $tsDir.sub.sid > 0}Mostrando todas las comunidades referentes{else}Selecciona un categoria{/if}</h3>
              <!-- /.box-tools -->
            </div>
            <!-- /.box-header -->
            <div class="box-body">
	{if $tsDir.c_seo}

    	{foreach from=$tsDir.data item=d}

        <div class="cdr_item" style="height:26px;">

            <i class="com_icon {$tsDir.c_seo}"></i>

            <a class="nombre" href="{$tsConfig.url}/comunidades/dir/{$tsDir.global_url}/{$d.c_seo}/{$d.s_seo}">{$d.s_nombre}</a>

            <span>{$d.total}</span>

        </div>

        {/foreach}

    {elseif $tsDir.sub.sid > 0}

    	<div id="com_members_result">

            {foreach from=$tsDir.data item=m}
      <div class="pull-left"> <a class="pull-left" href="{$tsConfig.url}/comunidades/{$m.c_nombre_corto}/"><img class="img-circle" src="{$tsConfig.url}/files/uploads/c_{$m.c_id}.jpg" alt="Imagen de la comunidad"></a><div class="pull-right" style="margin-left:5px;"> <a class="" href="{$tsConfig.url}/comunidades/{$m.c_nombre_corto}/"><h3 title="Nombre">{$m.c_nombre}</h3></a> <a class="" href="{$tsConfig.url}/comunidades/{$m.c_nombre_corto}/"><h5 title="Nombre corto">@{$m.c_nombre_corto}</h5></a> <p class="">{$m.c_descripcion|limit:150}</p> <p>Miembros <strong>{$m.c_miembros}</strong> - Temas <strong>{$m.c_temas}</strong></p></div></div>


            {/foreach}

            {if $tsDir.pages.pages > 1}

            <div style="margin-top: 10px;" class="">

            	{if $tsDir.pages.prev}<a class="floatL" href="{$tsConfig.url}/comunidades/dir/{$tsDir.global_url}/{$tsDir.sub.c_seo}/{$tsDir.sub.s_seo}/{$tsDir.pages.prev}">&laquo; Anterior</a>{/if}

                {if $tsDir.pages.pages > 1 && $tsDir.pages.pages > $tsDir.pages.current}<a class="floatR" href="{$tsConfig.url}/comunidades/dir/{$tsDir.global_url}/{$tsDir.sub.c_seo}/{$tsDir.sub.s_seo}/{$tsDir.pages.next}">Siguiente &raquo;</a>{/if}

            </div>

            {/if}

        </div>

    {else}

        {foreach from=$tsDir.data item=d}

        <div class="cdr_item">

            <i class="com_icon {$d.c_seo}"></i>

            <a class="nombre" href="{$tsConfig.url}/comunidades/dir/{$tsDir.global_url}/{$d.c_seo}">{$d.c_nombre}</a>

            <span>{$d.total}</span>

            <div class="cdr_subs">

                {foreach from=$d.sub_cat item=s key=i}

                {if $i > 0}, {/if}<a href="{$tsConfig.url}/comunidades/dir/{$tsDir.global_url}/{$d.c_seo}/{$s.s_seo}" title="{$s.total} Comunidad{if $s.total > 1}es{/if}">{$s.s_nombre}</a>

                {/foreach}

            </div>

        </div>

        {/foreach}

    {/if}


 </div>
            <!-- /.box-body -->
          </div>



