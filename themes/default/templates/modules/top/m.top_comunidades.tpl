				<div style="float: left; margin-left: 10px; width: 775px;" class="right">
                	<!--MIEMBROS-->
                	<div class="boxy xtralarge">
                    	<div class="boxy-title">
                            <h3>Top comunidades con m&aacute; miembros</h3>
                            <span class="icon-noti follow-n"></span>
                        </div>
                        <div class="boxy-content">
                        	{if !$tsTops.miembros}<div class="emptyData">Nada por aqui</div>
                            {else}
                        	<ol>
                            	{foreach from=$tsTops.miembros item=c}
                            	<li class="categoriaPost clearfix" style="background-image:url({$tsConfig.url}/files/uploads/c_{$c.c_id}.jpg);background-size: 16px;"><a href="{$tsConfig.url}/comunidades/{$c.c_nombre_corto}/">{$c.c_nombre|truncate:45}</a> <span>{$c.total}</span></li>
                                {/foreach}
                            </ol>
                            {/if}
                        </div>
                    </div>
                    <!-- TEMAS -->
                    <div class="boxy xtralarge">
                    	<div class="boxy-title">
                            <h3>Top comunidades con m&aacute; temas</h3>
                            <span class="icon-noti post-n"></span>
                        </div>
                        <div class="boxy-content">
                        	{if !$tsTops.temas}<div class="emptyData">Nada por aqui</div>
                            {else}
                        	<ol>
                            	{foreach from=$tsTops.temas item=c}
                            	<li class="categoriaPost clearfix" style="background-image:url({$tsConfig.url}/files/uploads/c_{$c.c_id}.jpg);background-size: 16px;"><a href="{$tsConfig.url}/comunidades/{$c.c_nombre_corto}/">{$c.c_nombre|truncate:45}</a> <span>{$c.total}</span></li>
                                {/foreach}
                            </ol>
                            {/if}
                        </div>
                    </div>
                    <!--SEGUIDORES-->
                	<div class="boxy xtralarge">
                    	<div class="boxy-title">
                            <h3>Top comunidades con m&aacute; seguidores</h3>
                            <span class="icon-noti follow-n"></span>
                        </div>
                        <div class="boxy-content">
                        	{if !$tsTops.seguidores}<div class="emptyData">Nada por aqui</div>
                            {else}
                        	<ol>
                            	{foreach from=$tsTops.seguidores item=c}
                            	<li class="categoriaPost clearfix" style="background-image:url({$tsConfig.url}/files/uploads/c_{$c.c_id}.jpg);background-size: 16px;"><a href="{$tsConfig.url}/comunidades/{$c.c_nombre_corto}/">{$c.c_nombre|truncate:45}</a> <span>{$c.total}</span></li>
                                {/foreach}
                            </ol>
                            {/if}
                        </div>
                    </div>
                </div>