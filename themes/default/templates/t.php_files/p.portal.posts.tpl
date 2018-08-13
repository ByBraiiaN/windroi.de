    <ul>
        {if $tsPosts}
        {foreach from=$tsPosts item=p}
        <li class="interesPost">
        <img title="{$p.c_nombre}" src="{$tsConfig.tema.t_url}/images/icons/cat/{$p.c_img}" />
        <a class="title {if $p.post_private}categoria privado{/if}" title="{$p.post_title}" target="_self" href="{$tsConfig.url}/posts/{$p.c_seo}/{$p.post_id}/{$p.post_title|seo}.html">{$p.post_title|truncate:90}</a>
        <span>{$p.post_date|hace} &raquo; 
            <a href="{$tsConfig.url}/perfil/{$p.user_name}">{$p.user_name}</a> 
            - Puntos {$p.post_puntos}
            - Comentarios {$p.post_comments}
            <a href="{$tsConfig.url}/posts/{$p.c_seo}/">{$p.c_nombre}</a>
        </span>
        </li>
        {/foreach}
        {else}
        <li class="emptyData">
            No hay posts aquí,
            {if $tsType == 'posts'} 
            <a onclick="$('#config_posts').slideDown();">configura</a> tus categorías preferidas.
            {elseif $tsType == 'favs'} puedes agregar un post a tus favoritos para visitarlo más tarde.
            {elseif $tsType == 'shared'} los usuarios que sigues podrán recomentarte posts.
            {/if}
        </li>
        {/if}
    </ul>
<div class="paginador">
    {if $tsPages.prev != 0}
    
    	<a class="boton floatL" onclick="portal.posts_page('{$tsType}', {$tsPages.prev}, true); return false">Anterior</a>
    {/if}
    {if $tsPages.next != 0}
    	<a class="boton floatR" onclick="portal.posts_page('{$tsType}', {$tsPages.next}, true); return false">Siguiente</a>
    {/if}
</div>
