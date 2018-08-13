<div class="box-ct-crap">
<h3>&Uacute;ltimos Comentarios<b style="float:right;margin-right:15px;">{foreach from=$tsCComCrap key=i item=p}{$p.total}{/foreach}</b></h3>
</div>
		<ul>
			{foreach from=$tsComCrap key=i item=c}
			 <li><span class="vot-pc {if $c.c_votos<0}vot-nc{/if}">{$c.c_votos}</span><a href="/perfil/{$c.user_name}">
			 <img class="hovercard" uid="{$c.post_user}" src="/files/avatar/{$c.user_id}_50.jpg"></a>
			 <span><a href="/perfil/{$c.user_name}"><strong style="color:#{$c.r_color};">@{$c.user_name}</strong></a> coment&oacute; {$c.c_date|hace}</span>
			 <a class="pcrap" style="color:#005CA5; font-size: 11px;font-weight:600;" alt="{$c.post_title}" title="{$c.post_title}" target="_self"  href="{$tsConfig.url}/posts/{$c.c_seo}/{$c.post_id}/{$c.post_title|seo}.html#comentarios-abajo">{$c.post_title|truncate:35}</a>
			 </li>
			 {/foreach} 
		</ul>