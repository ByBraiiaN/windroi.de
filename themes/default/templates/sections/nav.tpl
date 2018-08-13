<nav class="navbar navbar-static-top opciones_usuario">
        <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
        <span class="sr-only">Barra navegación</span>
        </a>
        <ul class="nav navbar-nav pull-right">
        {if $tsUser->is_member}
            <li class="bmonitor monitor">
                <a href="{$tsConfig.url}/monitor/" onclick="notifica.last(); return false" title="Monitor de usuario" name="Monitor">
                    <i class="fa fa-bell-o"></i>
                </a>
                <div class="notificaciones-list menos" id="mon_list">
					<div class="notimen">
                        <strong style="cursor:pointer" onclick="location.href='{$tsConfig.url}/monitor/'">Mis Notificaciones</strong>
                    </div>
					<ul></ul>
                    <div id="fuck">
                        <strong style="cursor:pointer" onclick="location.href='{$tsConfig.url}/monitor/'">Ver m&aacute;s notificaciones</strong>
                    </div>
                </div>
            </li>
            <li class="bmensajes mensajes" style="position:relative">
                <a href="{$tsConfig.url}/mensajes/" onclick="mensaje.last(); return false" title="Mensajes Personales" name="Mensajes">
                    <i class="fa fa-envelope"></i>
                </a>
                <div class="notificaciones-list mas" id="mp_list">
					<div class="notimen">
                        <strong style="cursor:pointer" onclick="location.href='{$tsConfig.url}/mensajes/'">Mensajes</strong>
                    </div>
                    <ul id="boxMail"></ul>
                    <div class="notimen" id="fuck">
                        <strong style="cursor:pointer" onclick="location.href='{$tsConfig.url}/mensajes/'">Ver m&aacute;s mensajes</strong>
                    </div>
                </div>
            </li>
            {if $tsAvisos}
            <li style="position:relative;">
                <a href="{$tsConfig.url}/mensajes/avisos/">
                    <i class="fa fa-warning"></i>
                    <span class="label label-danger">{$tsAvisos}</span>
                </a>
            </li>
            {/if}
            <li class="bcuenta rotacion">
                <a title="Mi cuenta" href="{$tsConfig.url}/cuenta/">
                <i class="fa fa-gear "></i>
                </a>
            </li>
            <li class="usernameMenu">
                <a title="Mi Perfil" href="{$tsConfig.url}/perfil/{$tsUser->info.user_name}" class="username"><i style="  margin-right: 6px;" class="fa fa-user"></i>{$tsUser->nick}</a>
            </li>                        
			<li><a href="{$tsConfig.url}/login-salir.php"><i class="fa fa-sign-out"></i></a></li>
            {else}
            <li class="dropdown messages-menu">
            <a href="{$tsConfig.url}/login/" style="font-size: 15px">Ingresar</a>
            </li>
            {/if}
        </ul>
        </nav>