   <section class="sidebar">
          <div class="user-panel">
            <div class="pull-left image">
              <img src="{$tsConfig.url}/files/avatar/{$tsUser->uid}_120.jpg" class="img-circle" alt="{$tsUser->nick}" title="{$tsUser->nick}" />
            </div>
            <div class="pull-left info">
                <p>Hola {$tsUser->nick}</p>
             {if $tsUser->nick == 'Visitante'}<a href="#"><i class="fa fa-circle text-muted"></i> Offline</a>{else}<a href="#"><i class="fa fa-circle text-success"></i> Online</a>{/if}
            </div>
          </div>
          <form action="{$tsConfig.url}/buscador/" method="get" class="sidebar-form" id="search_box">
            <div class="input-group">
              <input type="text" name="q" class="form-control" placeholder="Buscar..." autocomplete="off"/>
              <input type="hidden" name="e" value="web" />
              <span class="input-group-btn">
                <button  type='submit' name='search' id='search-btn' class="btn btn-flat"><a href="javascript:$('form[name=search]').submit()"><i class="fa fa-search"></i></a></button>
              </span>
            </div>
          </form>
          <ul class="sidebar-menu">
            <li class="header">MENU DE NAVEGACI&#211;N</li>
			
			<li class="treeview">
              <a href="{$tsConfig.url}/">
                <i class="fa fa-home"></i>
                <span>Blog</span>
              </a>
            </li> 
			
            <li class="treeview">
              <a href="{if $tsUser->is_member}#{else}{$tsConfig.url}/posts/{/if}">
                <i class="fa fa-file"></i>
                <span>Posts +</span>
				{if $tsUser->is_member}<i class="fa fa-angle-left pull-right"></i>{/if}
              </a>{if $tsUser->is_member}
              <ul class="treeview-menu">
                <li><a href="{$tsConfig.url}/posts/"><i class="fa fa-circle-o"></i> Inicio</a></li>
				<li><a href="{$tsConfig.url}/agregar/"><i class="fa fa-circle-o"></i> Agregar Post</a></li>
              </ul>{/if}
            </li>

			<li class="treeview">
              <a href="#">
                <i class="fa fa-comments"></i>
                <span>Comunidades +</span>
				<i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                <li><a href="{$tsConfig.url}/comunidades/"><i class="fa fa-circle-o"></i> Inicio</a></li>
				<li><a href="{$tsConfig.url}/comunidades/buscar/"><i class="fa fa-circle-o"></i> Buscador</a></li>
				<li><a href="{$tsConfig.url}/comunidades/dir/"><i class="fa fa-circle-o"></i> Directorio</a></li>
                {if $tsUser->is_member}
                                <li><a href="{$tsConfig.url}/comunidades/crear/"><i class="fa fa-circle-o"></i> Crear</a></li>
                <li><a href="{$tsConfig.url}/comunidades/borradores/"><i class="fa fa-circle-o"></i> Borradores</a></li>
                <li><a href="{$tsConfig.url}/comunidades/mis-comunidades/"><i class="fa fa-circle-o"></i> Mis Comunidades</a></li>
				<li><a href="{$tsConfig.url}/comunidades/favoritos/"><i class="fa fa-circle-o"></i> Favoritos</a></li>{/if}
              </ul>
            </li>

              {if $tsConfig.c_allow_portal && $tsUser->is_member == true}
            <li>
              <a href="{$tsConfig.url}/mi/">
                <i class="fa fa-users"></i> <span>MI!</span>
              </a>
            </li>{/if}
          {if $tsUser->is_admod || $tsUser->permisos.moacp}
            <li>
              <a href="{$tsConfig.url}/moderacion/">
                <i class="fa fa-gavel"></i> <span>Moderaci&#243;n</span>
                <small class="label pull-right bg-red">MOD</small>
              </a>
            </li>{/if}
              {if $tsAvisos}
            <li>
              <a href="{$tsConfig.url}/mensajes/avisos/">
               <i class="fa fa-warning"></i><span>Avisos</span>
                <small class="label pull-right bg-yellow">{$tsAvisos}</small>
              </a>
            </li>{/if}
            {if $tsUser->is_member}
                    {if $tsUser->is_admod == 1}
            <li class="treeview">
              <a href="#">
                <i class="fa fa-folder"></i> <span>Panel Admin</span>  {if $tsUser->is_admod && $tsConfig.c_see_mod && $tsConfig.novemods.total}<span class="label label-primary pull-right">{$tsConfig.novemods.total}</span>{/if}
              </a>
              <ul class="treeview-menu">
                <li><a href="{$tsConfig.url}/mod-history/"><i class="fa fa-circle-o"></i> Historial</a></li>
                <li><a href="{$tsConfig.url}/admin/"><i class="fa fa-circle-o"></i> Administraci&oacute;n</a></li>{if $tsUser->is_admod && $tsConfig.c_see_mod && $tsConfig.novemods.total}<li><a id="stickymsg" onmouseover="$('#brandday').css('opacity',0.5);" onmouseout="$('#brandday').css('opacity',1);" onclick="location.href = '{$tsConfig.url}/moderacion/revposts'"><i class="fa fa-circle-o"></i>Hay {$tsConfig.novemods.total} contenido{if $tsConfig.novemods.total != 1}s{/if} esperando <p style="margin-left:20px;">revisi&oacute;n</p></a></li>{/if}
              </ul>
            </li> {/if}
            {/if}
            <li class="header">OPCIONES</li>
            {if $tsUser->is_member}
			<li><a title="Mis Favoritos" href="{$tsConfig.url}/favoritos.php"><i class="fa fa-circle-o text-yellow"></i> <span>Favoritos</span><small class="label pull-right bg-yellow"><i class="fa fa-star"></i></small></a></li>
            <li><a title="Mis Borradores" href="{$tsConfig.url}/borradores.php"><i class="fa fa-circle-o text-red"></i><span>Borradores</span><small class="label pull-right bg-red"><i class="fa fa-book"></i></small></a></li>
			{else}
            <li><a href="{$tsConfig.url}/login/"><i class="fa fa-circle-o text-yellow"></i> <span>Ingresar</span></a></li>
            <li><a href="{$tsConfig.url}/registro/"><i class="fa fa-circle-o text-red"></i> <span>Registrate!</span></a></li>{/if}
			<li><a title="Protocolo" href="{$tsConfig.url}/pages/protocolo/"><i class="fa fa-circle-o text-green"></i> <span>Protocolo</span><small class="label pull-right bg-green"><i class="fa fa-university"></i></small></a></li>
          </ul>
        </section>