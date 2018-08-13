<div class="col-md-4">
<div class="box box-primary">
 <div class="box-header with-border">
                  <h3 class="box-title">Tops posts</h3>
                  <div class="box-tools pull-right">
                    <div class="miniMenu">
            <a href="javascript:TopsTabs('topsPostBox','Semana')" id="Semana"{if $tsTopPosts.semana} class="here"{/if}>Semana</a> 
            <a href="javascript:TopsTabs('topsPostBox','Mes')" id="Mes">Mes</a>
            <a href="javascript:TopsTabs('topsPostBox','Historico')" id="Historico"{if !$tsTopPosts.semana} class="here"{/if}>Histórico</a>
        </div>
                  </div>
                </div>
<section id="topsPostBox" class="topsPostBox">
    <div class="box_cuerpo" style="margin-top: -19px;">
         <div class="box-body">
          <ul class="products-list product-list-in-box"style="margin-left: -100px;">
        <ol id="filterBySemana" class="topSemana filterBy" style="display:{if $tsTopPosts.semana}block{else}none{/if};">
            {foreach from=$tsTopPosts.semana key=i item=p}
            
            
              <li class="item" style="margin:19px 1px 0px 1px;">
                   <div class="product-info">
                           <a class="k c{$p.post_category} product-title">{$p.c_seo}</a><span title="Puntos" class="label label-success qtip pull-right">{$p.post_puntos}</span>
                        <span class="product-description">
                    <a class="text-muted" href="{$tsConfig.url}/posts/{$p.c_seo}/{$p.post_id}/{$p.post_title|seo}.html">{$p.post_title|truncate:90}</a>
                        </span>
                      </div>
                    
                </li>
            {/foreach}
        </ol>
        <ol id="filterByMes" class="topMes filterBy" style="display:none;">
            {foreach from=$tsTopPosts.mes key=i item=p}
                  <li class="item" style="margin:19px 1px 0px 1px;">
                   <div class="product-info">
                        <a class="k c{$p.post_category} product-title">{$p.c_seo}</a><span title="Puntos" class="label label-success qtip pull-right">{$p.post_puntos}</span>
                        <span class="product-description">
                    <a class="text-muted" href="{$tsConfig.url}/posts/{$p.c_seo}/{$p.post_id}/{$p.post_title|seo}.html">{$p.post_title|truncate:90}</a>
                        </span>
                      </div>
                    
                </li>
            {/foreach}
        </ol>
        <ol id="filterByHistorico" class="topHistorico filterBy" style="display:{if !$tsTopPosts.semana}block{else}none{/if};">
            {foreach from=$tsTopPosts.historico key=i item=p}
                  <li class="item" style="margin:19px 1px 0px 1px;"> 
                   <div class="product-info">
                           <a class="k c{$p.post_category} product-title">{$p.c_seo}</a><span title="Puntos" class="label label-success qtip pull-right">{$p.post_puntos}</span>
                        <span class="product-description">
                    <a class="text-muted" href="{$tsConfig.url}/posts/{$p.c_seo}/{$p.post_id}/{$p.post_title|seo}.html">{$p.post_title|truncate:90}</a>
                        </span>
                      </div>
                    
                </li>
            {/foreach}
        </ol></ul></div>
         <div class="box-footer text-center">
                  <a class="uppercase" href="{$tsConfig.url}/top/">Ver M&aacute;s</a>
                </div>
    </div>
</section></div></div>