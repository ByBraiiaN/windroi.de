				<div style="float: left; margin-left: 10px; width: 775px;" class="right">
                	<!--MAS VOTOS-->
                	<div class="boxy xtralarge">
                    	<div class="boxy-title">
                            <h3>Top temas con m&aacute;s votos</h3>
                            <span class="icon-noti voto"></span>
                        </div>
                        <div class="boxy-content">
                        	{if !$tsTops.votos}<div class="emptyData">Nada por aqui</div>
                            {else}
                        	<ol>
                            	{foreach from=$tsTops.votos item=t}
                            	<li class="categoriaPost clearfix" style="background-image:url({$tsConfig.url}/files/uploads/c_{$t.c_id}.jpg);background-size: 16px;"><a href="{$tsConfig.url}/comunidades/{$t.c_nombre_corto}/{$t.t_id}/{$t.t_titulo|seo}.html">{$t.t_titulo|truncate:45}</a> <span>{$t.total}</span></li>
                                {/foreach}
                            </ol>
                            {/if}
                        </div>
                    </div>
                    <!-- TEMAS -->
                    <div class="boxy xtralarge">
                    	<div class="boxy-title">
                            <h3>Top temas con m&aacute;s respuestas</h3>
                            <span class="icon-noti comentarios-n-b"></span>
                        </div>
                        <div class="boxy-content">
                        	{if !$tsTops.respuestas}<div class="emptyData">Nada por aqui</div>
                            {else}
                        	<ol>
                            	{foreach from=$tsTops.respuestas item=t}
                            	<li class="categoriaPost clearfix" style="background-image:url({$tsConfig.url}/files/uploads/c_{$t.c_id}.jpg);background-size: 16px;"><a href="{$tsConfig.url}/comunidades/{$t.c_nombre_corto}/{$t.t_id}/{$t.t_titulo|seo}.html">{$t.t_titulo|truncate:45}</a> <span>{$t.total}</span></li>
                                {/foreach}
                            </ol>
                            {/if}
                        </div>
                    </div>
                    <!--SEGUIDORES-->
                	<div class="boxy xtralarge">
                    	<div class="boxy-title">
                            <h3>Top temas con m&aacute;s seguidores</h3>
                            <span class="icon-noti follow-n"></span>
                        </div>
                        <div class="boxy-content">
                        	{if !$tsTops.seguidores}<div class="emptyData">Nada por aqui</div>
                            {else}
                        	<ol>
                            	{foreach from=$tsTops.seguidores item=t}
                            	<li class="categoriaPost clearfix" style="background-image:url({$tsConfig.url}/files/uploads/c_{$t.c_id}.jpg);background-size: 16px;"><a href="{$tsConfig.url}/comunidades/{$t.c_nombre_corto}/{$t.t_id}/{$t.t_titulo|seo}.html">{$t.t_titulo|truncate:45}</a> <span>{$t.total}</span></li>
                                {/foreach}
                            </ol>
                            {/if}
                        </div>
                    </div>
                </div>