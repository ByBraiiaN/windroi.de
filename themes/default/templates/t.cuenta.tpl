{include file='sections/main_header.tpl'}
				<script type="text/javascript" src="{$tsConfig.js}/cuenta.js?310520172140"></script>
                {literal}
				<script type="text/javascript">
                $(document).ready(function(){
                    //document.domain = global_data.domain;
                	// {/literal}
                    avatar.uid = '{$tsUser->uid}';
                    avatar.current = '{$tsConfig.url}/files/avatar/{if $tsPerfil.p_avatar}{$tsPerfil.user_id}{else}avatar{/if}.jpg';
                	// {literal}                
                    if (typeof location.href.split('#')[1] != 'undefined') {
                        $('ul.menu-tab > li > a:contains('+location.href.split('#')[1]+')').click();
                    }
                
                });
                </script>
                {/literal}
                <section class="content">
                <div class="row">
                <div class="col-md-3">
              <div class="box box-primary">
                   <div class="box-header with-border">
                  <h3 class="box-title text-light-blue">Men&uacute; Principal</h3>
                </div>
                 <div class="box-body no-padding">
                        <ul class="nav nav-pills nav-stacked" style="cursor:pointer;">
                            <li><a onclick="cuenta.chgtab(this)">Cuenta</a></li>
                            <li><a onclick="cuenta.chgtab(this)">Perfil</a></li>    
                            <li><a onclick="cuenta.chgtab(this)">Bloqueados</a></li>
                            <li><a onclick="cuenta.chgtab(this)">Cambiar Clave</a></li>
							<li><a onclick="cuenta.chgtab(this)">Cambiar Nick</a></li>
                            <li><a onclick="cuenta.chgtab(this)">Privacidad</a></li>
                        </ul></div>
                        </div></div>
                        <div class="col-md-6">
                        <div class="panel box box-primary">
                      <div class="box-header with-border">
                        <h4 class="box-title">
                          <a>
                            Opciones
                          </a>
                        </h4>
                      </div>
                      <div id="collapseOne" class="panel-collapse collapse in">
                        <div class="box-body">
                        <a name="alert-cuenta"></a>
                        <form class="horizontal" method="post" action="" name="editarcuenta">
                        	{include file='modules/cuenta/m.cuenta_cuenta.tpl'}
                            {include file='modules/cuenta/m.cuenta_perfil.tpl'}
                            {include file='modules/cuenta/m.cuenta_block.tpl'}
                            {include file='modules/cuenta/m.cuenta_clave.tpl'}
							{include file='modules/cuenta/m.cuenta_nick.tpl'}
                            {include file='modules/cuenta/m.cuenta_config.tpl'}
                        </form></div></div></div>
                </div>
                    <div class="col-md-3">
                    <aside>
	                    {include file='modules/cuenta/m.cuenta_sidebar.tpl'}
                    </aside></div></div></section>
                
                
{include file='sections/main_footer.tpl'}