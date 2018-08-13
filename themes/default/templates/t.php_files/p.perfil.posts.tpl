1:
    <header>
    	<h3>Últimos Posts creados por {$tsUsername}</h3>
    	<span class="box_rss"><a title="" href="/rss/posts-usuario/" class="systemicons sRss"></a></span>
    </header>
    {if $tsGeneral.posts}
    <ul>
    {foreach from=$tsGeneral.posts item=p}
        <li>
            <img src="{$tsConfig.tema.t_url}/images/icons/cat/{$p.c_img}" />
            <a target="_self" href="{$tsConfig.url}/posts/{$p.c_seo}/{$p.post_id}/{$p.post_title|seo}.html">{$p.post_title|truncate:45}</a>
            <span>{$p.post_puntos} Puntos</span>
        </li>
    {/foreach}
    {if $tsGeneral.total >= 18}
        <a class="boton" href="{$tsConfig.url}/buscador/?autor={$tsGeneral.username}">Ver más &raquo;</a>
    {/if}
    </ul>
    {else}
    <p class="emptyData">No hay posts</p>
    {/if}