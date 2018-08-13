<section class="top">
    <!--PUNTOS-->
    <div class="col-md-13">
     <div class="box box-warning">
       <div class="box-header with-border">
                  <h3 class="box-title">Top con más puntos</h3>
                  <div class="box-tools pull-right">
                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                  </div>
                </div>
                  <div class="box-body">
                    {if !$tsTops.puntos}
      <p class="emptyData">Nada por aqui</p>  {else}{/if}
        {foreach from=$tsTops.puntos item=p}
            <li class="categoriaPost">
                <img src="{$tsConfig.tema.t_url}/images/icons/cat/{$p.c_img}">
                <a href="{$tsConfig.url}/posts/{$p.c_seo}/{$p.post_id}/{$p.post_title|seo}.html">{$p.post_title|truncate:90}</a> 
                <span class="spanNum">{$p.post_puntos}</span>
            </li>
            {/foreach}
                </div>
    </div></div>
    
    <!--SEGUIDORES-->
     <div class="col-md-13">
     <div class="box box-warning">
       <div class="box-header with-border">
                  <h3 class="box-title">Top post más favoritos</h3>
                  <div class="box-tools pull-right">
                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                  </div>
                </div>
                  <div class="box-body">
                    {if !$tsTops.puntos}
      <p class="emptyData">Nada por aqui</p>  {else}{/if}
        {foreach from=$tsTops.favoritos item=p}
            <li class="categoriaPost">
                <img src="{$tsConfig.tema.t_url}/images/icons/cat/{$p.c_img}">
                <a href="{$tsConfig.url}/posts/{$p.c_seo}/{$p.post_id}/{$p.post_title|seo}.html">{$p.post_title|truncate:90}</a>
                <span class="spanNum">{$p.post_favoritos}</span>
            </li>
            {/foreach}
                </div>
    </div></div>
    
      <!--COMENTARIOS-->
       <div class="col-md-13">
     <div class="box box-warning">
       <div class="box-header with-border">
                  <h3 class="box-title">Top post más comentado</h3>
                  <div class="box-tools pull-right">
                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                  </div><!-- /.box-tools -->
                </div><!-- /.box-header -->
                  <div class="box-body">
                    {if !$tsTops.puntos}
      <p class="emptyData">Nada por aqui</p>  {else}{/if}
          {foreach from=$tsTops.comments item=p}
            <li class="categoriaPost">
                <img src="{$tsConfig.tema.t_url}/images/icons/cat/{$p.c_img}">
                <a href="{$tsConfig.url}/posts/{$p.c_seo}/{$p.post_id}/{$p.post_title|seo}.html">{$p.post_title|truncate:90}</a> 
                <span class="spanNum">{$p.post_comments}</span>
            </li>
            {/foreach}
                </div>
    </div></div>
    
       <!--SEGUIDORES-->
         <div class="col-md-13">
     <div class="box box-warning">
       <div class="box-header with-border">
                  <h3 class="box-title">Top post con más seguidores</h3>
                  <div class="box-tools pull-right">
                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                  </div>
                </div>
                  <div class="box-body">
                    {if !$tsTops.puntos}
      <p class="emptyData">Nada por aqui</p>  {else}{/if}
            {foreach from=$tsTops.seguidores item=p}
            <li class="categoriaPost">
                <img src="{$tsConfig.tema.t_url}/images/icons/cat/{$p.c_img}">
                <a href="{$tsConfig.url}/posts/{$p.c_seo}/{$p.post_id}/{$p.post_title|seo}.html">{$p.post_title|truncate:90}</a>
                <span class="spanNum">{$p.post_seguidores}</span>
            </li>
            {/foreach}
                </div>
    </div></div>
</section>