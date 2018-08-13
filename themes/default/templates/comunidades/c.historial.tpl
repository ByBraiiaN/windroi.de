<div class="box box-warning"><div class="box-header with-border "><h2 class="box-title">Historial de moderaci&oacute;n</h2></div>
<div class="box-body">
    <table cellpadding="0" cellspacing="0" border="0" align="center" class="table table-responsive">
        <thead>
            <tr>
                <th align="left">Comunidad - Tema</th>
                <th align="center">Acci&oacute;n</th>
                <th align="center">Moderador</th>
                <th align="left">Causa</th>
            </tr>
        </thead>
        <tbody>
			{foreach from=$tsHistorial item=h}
            <tr>
            	<td align="left">
                    {if $h.t_titulo}
                        {if $h.h_type != 2}
                        	<a href="{$tsConfig.url}/comunidades/{$h.c_nombre_corto}/{$h.t_id}/{$h.t_titulo|seo}.html">{$h.t_titulo}</a>
                        {else}
                        	{$h.t_titulo}
                        {/if}<br />En 
                    {/if}
                    <a href="{$tsConfig.url}/comunidades/{$h.c_nombre_corto}/">{$h.c_nombre}</a>
                </td>
                <td align="center">{if $h.h_type == 1}Tema Editado{elseif $h.h_type == 2}<font color="red">Tema Eliminado</font>{elseif $h.h_type == 3}<font color="green">Tema Reactivado</font>{elseif $h.h_type == 4}<font color="#0066CC">Cambio de avatar</font>{elseif $h.h_type == 5}<font color="#0066CC">Cambio de fondo</font>{elseif $h.h_type == 6}Comunidad Editada{/if}</td>
                <td align="center"><a href="{$tsConfig.url}/perfil/{$h.user_name}/" class="hovercard" uid="{$h.user_id}">{$h.user_name}</a></td>
                <td align="left">{if $h.h_razon != ''}{$h.h_razon}{else}-{/if}</td>
            </tr>
            {/foreach}
		</tbody>
    </table>    
</div></div>