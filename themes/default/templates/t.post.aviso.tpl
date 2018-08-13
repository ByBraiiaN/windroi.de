{include file='sections/main_header.tpl'}<br>
<section class="post-{$tsAviso.0} panel box box-primary">
    <div class="box-header with-border">
	<h3 class="box-title">{$tsAviso.1}</h3>
	</div>
    	<p>Pero no pierdas las esperanzas, no todo está perdido, la solución está en...</p>
    <h4>Post Relacionados</h4>
    <ul>
        {if $tsRelated}
        {foreach from=$tsRelated item=p}
        <li class="categoriaPost {$p.c_seo}">
        	<a class="{if $p.post_private}categoria privado{/if}"title="{$p.post_title}" href="{$tsConfig.url}/posts/{$p.c_seo}/{$p.post_id}/{$p.post_title|seo}.html" rel="dc:relation">{$p.post_title}</a>
        </li>
        {/foreach}
        {else}
        <li>No se encontraron posts relacionados.</li>
        {/if}
    </ul>
</section>            
{include file='sections/main_footer.tpl'}