<section class="postRelacionados">
    <ul>
        {if $tsRelated}
        {foreach from=$tsRelated item=p}
        <li class="categoriaPost" style="margin-left:-45px;font-size:1em">
        	<img title="{$p.c_seo}" style="width:100%" src="{$tsConfig.url}/inc/php/timthumb.php?src={$p.post_imgport}&h=200&w=290" alt="{$p.post_title}" title="{$p.post_title}"/>
        	<a class="{if $p.post_private}categoria privado{/if}" title="{$p.post_title}" href="{$tsConfig.url}/posts/{$p.c_seo}/{$p.post_id}/{$p.post_title|seo}.html" rel="dc:relation">{$p.post_title|truncate:70}</a>
        	<hr>
        </li>
        {/foreach}
        {else}
        <li>No se encontraron posts relacionados.</li>
        {/if}
    </ul>
</section>