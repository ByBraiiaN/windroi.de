<div class="box box-warning"><div class="box-header with-border "><h2 class="box-title">Mis temas favoritos ({$tsFavoritos.total})</h2></div>
<div class="box-body">
    <table cellpadding="0" cellspacing="0" border="0" align="center" class="table table-responsive">
        <thead>
            <tr>
                <th align="left">T&iacute;tulo</th>
                <th align="center">Comunidad</th>
                <th align="center">Creado</th>
                <th align="center">Guardado</th>
                <th align="center">Respuestas</th>
            </tr>
        </thead>
        <tbody>
			{foreach from=$tsFavoritos.data item=f}
            <tr class="com_category {$f.sub_cat.c_seo}" id="fav_tema_id_{$f.fav_id}">
            	<td align="left">
                	<i class="com_icon {$f.sub_cat.c_seo}" style="vertical-align:top"></i>
                    <a href="{$tsConfig.url}/comunidades/{$f.c_nombre_corto}/{$f.t_id}/{$f.t_titulo|seo}.html">{$f.t_titulo}</a>
                </td>
                <td align="left">
                    <a href="{$tsConfig.url}/comunidades/{$f.c_nombre_corto}/">{$f.c_nombre}</a>
                </td>
                <td align="center">{$f.t_fecha|hace}</td>
                <td align="center">{$f.f_date|hace}</td>
                <td align="center">{$f.t_respuestas}<a href="javascript:com.del_favorito({$f.fav_id});" title="Eliminar favorito" class="floatR"><i class="com_icon icon_del" style="vertical-align:top"></i></a></td>
            </tr>
            {/foreach}
		</tbody>
    </table>    
</div></div>