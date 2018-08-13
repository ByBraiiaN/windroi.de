  <div class="col-md-4">
              <div class="box box-primary">
              <div class="box-header with-border">
                  <h3 class="box-title">Tops Usuarios</h3>
                  <div class="box-tools pull-right">
                   <div class="miniMenu">
            <a href="javascript:TopsTabs('topsUserBox','SemanaUser')" id="SemanaUser">Semana</a>
            <a href="javascript:TopsTabs('topsUserBox','MesUser')" id="MesUser"{if $tsTopUsers.mes} class="here"{/if}>Mes</a>
            <a href="javascript:TopsTabs('topsUserBox','HistoricoUser')" id="HistoricoUser" {if !$tsTopUsers.mes}class="here"{/if}>Hist&oacute;ricos</a>
        </div>
                  </div>
                </div>

<section id="topsUserBox" class="topsUser">
    <div class="box_cuerpo" style="margin-top: -19px;">
        
        <div class="box-body">
                  <ul class="products-list product-list-in-box"style="margin-left: -40px;">
        <ol id="filterBySemanaUser" style="display:none;">
            {foreach from=$tsTopUsers.semana key=i item=u}
                <li class="item" style="  margin: 19px 1px 0px 1px;">
                     <div class="product-img">
                   <img alt="User Image" src="{$tsConfig.url}/files/avatar/{$u.user_id}_50.jpg"></div>
                    <div class="product-info">
                        <a href="{$tsConfig.url}/perfil/{$u.user_name}" uid="{$u.user_id}" class="product-title">{$u.user_name}<span class="label label-info pull-right">{$u.total}</span></a>
                        <span class="product-description">
                           Windroide
                        </span>
                      </div>
                </li>
            {/foreach}
        </ol></p>
        <ol id="filterByMesUser" style="display:{if $tsTopUsers.mes}block{else}none{/if};">
            {foreach from=$tsTopUsers.mes key=i item=u}
                <li class="item" style="  margin: 19px 1px 0px 1px;">
                     <div class="product-img">
                   <img alt="User Image" src="{$tsConfig.url}/files/avatar/{$u.user_id}_50.jpg"></div>
                     <div class="product-info">
                        <a class="product-title"  href="{$tsConfig.url}/perfil/{$u.user_name}" uid="{$u.user_id}">{$u.user_name} <span class="label label-danger pull-right">{$u.total}</span></a>
                        <span class="product-description">
                          Windroide
                        </span>
                      </div>
                </li>
            {/foreach}
        </ol></p>
        <ol id="filterByHistoricoUser" style="display:{if !$tsTopUsers.mes}block{else}none{/if};">
            {foreach from=$tsTopUsers.historico key=i item=u}
                <li class="item" style="  margin: 19px 1px 0px 1px;">
                    <div class="product-img">
                   <img alt="User Image" src="{$tsConfig.url}/files/avatar/{$u.user_id}_50.jpg"></div>
                    <div class="product-info">
                        <a class="product-title" href="{$tsConfig.url}/perfil/{$u.user_name}" uid="{$u.user_id}">{$u.user_name} <span class="label label-warning pull-right">{$u.total}</span></a>
                        <span class="product-description">
                          Windroide
                        </span>
                      </div>
                </li>
            {/foreach}
        </ol></p></ul></div>
          <div class="box-footer text-center">
                  <a class="uppercase" href="{$tsConfig.url}/top/usuarios/">Ver M&aacute;s</a>
                </div>
    </div>
</section></div></div>