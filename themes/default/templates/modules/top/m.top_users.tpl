<section class="top">
    <!--PUNTOS-->
    <div class="col-md-4">
     <div class="box box-success">
       <div class="box-header with-border">
                  <h3 class="box-title">Top usuario con más puntos</h3>
                  <div class="box-tools pull-right">
                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                  </div>
                </div>
                  <div class="box-body">
                    {if !$tsTops.puntos}
      <p class="emptyData">Nada por aqui</p>  {else}{/if}
        {foreach from=$tsTops.puntos item=u}
            <li class="categoriaUsuario clearfix">
                <img src="{$tsConfig.url}/files/avatar/{$u.user_id}_50.jpg"/>
                <a href="{$tsConfig.url}/perfil/{$u.user_name}">{$u.user_name}</a> <span>{$u.total}</span>
            </li>
        {/foreach}
        </div>
    </div></div>

    <!--SEGUIDORES-->    
    <div class="col-md-4">
     <div class="box box-success">
       <div class="box-header with-border">
                  <h3 class="box-title">Top usuario con m&aacute;s seguidores</h3>
                  <div class="box-tools pull-right">
                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                  </div>
                </div>
                  <div class="box-body">
                    {if !$tsTops.puntos}
      <p class="emptyData">Nada por aqui</p>  {else}{/if}
           {foreach from=$tsTops.seguidores item=u}
            <li class="categoriaUsuario clearfix">
                <img src="{$tsConfig.url}/files/avatar/{$u.user_id}_50.jpg"/>
                <a href="{$tsConfig.url}/perfil/{$u.user_name}">{$u.user_name}</a> <span>{$u.total}</span>
            </li>
        {/foreach}
                </div>
    </div></div>

    <!--MEDALLAS-->
        <div class="col-md-4">
     <div class="box box-success">
       <div class="box-header with-border">
                  <h3 class="box-title">Top usuario con m&aacute;s medallas</h3>
                  <div class="box-tools pull-right">
                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                  </div>
                </div>
                  <div class="box-body">
                    {if !$tsTops.puntos}
      <p class="emptyData">Nada por aqui</p>  {else}{/if}
             {foreach from=$tsTops.medallas item=u}
            <li class="categoriaUsuario clearfix">
                <img src="{$tsConfig.url}/files/avatar/{$u.user_id}_50.jpg"/>
                <a href="{$tsConfig.url}/perfil/{$u.user_name}">{$u.user_name}</a> <span>{$u.total}</span>
            </li>
        {/foreach}
                </div>
    </div></div>       
</section>