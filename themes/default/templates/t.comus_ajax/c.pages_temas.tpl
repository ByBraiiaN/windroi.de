<br/>
{if $tsTemas.sticky || $tsTemas.data}
<section class="postComunidades">
	<div class="box box-info">
		<div class="box-header with-border">
			<h3 class="box-title">Últimos temas en la comunidad</h3>
		</div>
    
		<div class="box-body">
			<div class="table-responsive">
				<table class="table no-margin">
					<tbody>
					    						{if $tsTemas.pages.current == 1}
{foreach from=$tsTemas.sticky item=t} <tr>
							<td>
							
								<a class="qtip" href="{$tsConfig.url}/comunidades/{$tsCom.c_nombre_corto}/{$t.t_id}/{$t.t_titulo|seo}.html" target="_self" original-title="{$t.t_titulo|truncate:45}">{$t.t_titulo}</a>
							</td>
							<td>
								<small>Por: <a href="{$tsConfig.url}/perfil/{$t.user_name}/">{$t.user_name} | {$t.t_fecha|hace}</a>
								</small>
							</td>
						</tr>{/foreach}
{/if}
{foreach from=$tsTemas.data item=t} <tr {if $t.t_estado == 1}style="opacity: 0.5;background: #000;" title="El tema ha sido eliminado"{/if}>
							<td >
								
								<a class="qtip" href="{$tsConfig.url}/comunidades/{$tsCom.c_nombre_corto}/{$t.t_id}/{$t.t_titulo|seo}.html" target="_self" original-title="{$t.t_titulo|truncate:45}">{$t.t_titulo}</a>
							</td>
							<td>
								<small>Por: <a href="{$tsConfig.url}/perfil/{$t.user_name}/">{$t.user_name} | {$t.t_fecha|hace}</a>
								</small>
							</td>
						</tr>{/foreach}						


						
						
						</tbody>
				</table>
			</div>
			
			
		</div>  
		<div class="com_temas_footer">
{if $tsTemas.pages.pages > 1}
<ul class="pagination pagination-sm no-margin pull-right">
                <li>{if $tsTemas.pages.prev}<a class="cp_prev" href="javascript:com.pages_temas({$tsTemas.pages.prev});"></a>{/if}</li>
				{if $tsTemas.pages.current <= 9}
    {section name=pages start=1 loop=$tsTemas.pages.pages+1 max=9}
                <li><a {if $tsTemas.pages.current == $smarty.section.pages.index}class="here"{/if} href="javascript:com.pages_temas({$smarty.section.pages.index});">{$smarty.section.pages.index}</a></li>
				    {/section}
    {else}
    <li><a href="javascript:com.pages_temas({$tsTemas.pages.current-4});">{$tsTemas.pages.current-4}</a></li>
    <li><a href="javascript:com.pages_temas({$tsTemas.pages.current-3});">{$tsTemas.pages.current-3}</a></li>
    <li><a href="javascript:com.pages_temas({$tsTemas.pages.current-2});">{$tsTemas.pages.current-2}</a></li>
    <li><a href="javascript:com.pages_temas({$tsTemas.pages.current-1});">{$tsTemas.pages.current-1}</a></li>
    <li><a class="here" href="javascript:com.pages_temas({$tsTemas.pages.current});">{$tsTemas.pages.current}</a></li>
    {if $tsTemas.pages.pages >= $tsTemas.pages.current+1}
    <li><a href="javascript:com.pages_temas({$tsTemas.pages.current+1});">{$tsTemas.pages.current+1}</a></li>
    {/if}
    {if $tsTemas.pages.pages >= $tsTemas.pages.current+2}
    <li><a href="javascript:com.pages_temas({$tsTemas.pages.current+2});">{$tsTemas.pages.current+2}</a></li>
    {/if}
    {if $tsTemas.pages.pages >= $tsTemas.pages.current+3}
    <li><a href="javascript:com.pages_temas({$tsTemas.pages.current+3});">{$tsTemas.pages.current+3}</a></li>
    {/if}
    {if $tsTemas.pages.pages >= $tsTemas.pages.current+4}
    <li><a href="javascript:com.pages_temas({$tsTemas.pages.current+1});">{$tsTemas.pages.current+4}</a></li>
    {/if}
    {/if}
    {if $tsTemas.pages.pages > 1 && $tsTemas.pages.pages > $tsTemas.pages.current}<li><a class="cp_next" href="javascript:com.pages_temas({$tsTemas.pages.next});"></a></li>{/if}
              </ul>
{/if}


					</div>

				</div>
			</section>
{else}

<div class="alert alert-info">No se han creado temas en esta comunidad</div>
{/if}