{include file='sections/main_header.tpl'}
<div id="blog">
   <h1><div class="callout callout-info lead">Blog {$tsConfig.titulo} | {$tsConfig.slogan}</div></h1>
   <div style="margin-top:10px">{include file="modules/global/m.global_ads_728.tpl"} </div>
     {include file='modules/posts/m.posts_blog.tpl'}
  </div>
  <!-- <div class="">
     {include file='modules/posts/m.com_blog.tpl'}
   </div>-->
   
{include file='sections/main_footer.tpl'}