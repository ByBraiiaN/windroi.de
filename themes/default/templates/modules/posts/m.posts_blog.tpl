{foreach from=$tsPostsBlog.data key=i item=p}<article class="col-md-13" style="padding:8px">
	
		<div class="box box-default">
			<div class="box-header with-border">
				
				<a title="{$p.post_title}" target="_self"  href="{$tsConfig.url}/posts/{$p.c_seo}/{$p.post_id}/{$p.post_title|seo}.html"><h2 class="box-title">{$p.post_title}</h2>
			</div>
			<div class="box-body">
				<img data-original="{$tsConfig.url}/inc/php/timthumb.php?src={$p.post_imgport}&h=320&w=420" class="img-responsive lazy" style="height:250px;width:100%;margin:0 auto" alt="{$p.post_title}"/>
			</div></a>
			<div class="box-footer">
				<p>{$p.post_body|nobbcode|truncate:310}</p>
				<small><a class="fa fa-folder" href="{$tsConfig.url}/posts/{$p.c_seo}/" title="{$p.c_nombre}">&nbsp;{$p.c_nombre}&nbsp;</a><a class="fa fa-user" title="{$p.user_name}" rel="nofollow" href="{$tsConfig.url}/perfil/{$p.user_name}">&nbsp;{$p.user_name}&nbsp;</a><i class="fa fa-clock-o">&nbsp;{$p.post_date|hace}</i></small>
			</div>
		</div>
		</article>
		{/foreach}
		{if $tsPostsBlog.data > 10}{$tsPostsBlog.pages}{/if}