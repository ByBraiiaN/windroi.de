<section id="portal_posts" class="showHide lastPosts" status="" style="display:none">
    <header>
        <h2>Últimos posts de tu interés</h2>
            <div class="box_rss">
                <a onclick="$('#config_posts').slideDown();" title="Configurar" class="qtip">
                	<img src="{$tsConfig.tema.t_url}/images/icons/gear.png" />
                </a>
            </div>
    </header>
        <div id="config_posts" style="display:none">
            <p class="emptyData">Elige las categorías que quieras filtrar en los últimos posts.</p>
            <ul id="config_inputs">
                {foreach from=$tsCategories item=c}
                <li>
                    <label>
                    <input type="checkbox" value="{$c.cid}" {if $c.check == 1}checked="true"{/if} />
                        <span style="background-image:url({$tsConfig.tema.t_url}/images/icons/cat/{$c.c_img})">{$c.c_nombre}</span>
                    </label>
                </li>
                {/foreach}
            </ul>
            <a onclick="portal.save_configs();" class="boton">Guardar cambios</a>
    	</div>
    <div id="portal_posts_content"></div>
</section>