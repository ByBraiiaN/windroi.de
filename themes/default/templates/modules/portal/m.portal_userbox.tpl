<section id="user_box" class="userInfoBox">
	<header>
        <a href="{$tsConfig.url}/perfil/{$tsUser->nick}" style="text-decoration:none">
        	<h3 style="color:#{$tsUser->info.rango.r_color}">{$tsUser->nick}</h3>
        </a>
    </header>
    <div class="avatarBox">
        <a class="nickUser" href="{$tsConfig.url}/perfil/{$tsUser->nick}">
            <img title="Ver tu perfil" class="avatar" src="{$tsConfig.url}/files/avatar/{$tsUser->uid}_120.jpg"/>
        </a>
    </div>
    <ul class="tools">
        <li><a href="{$tsConfig.url}/monitor/" class="systemicons monitor">Notificaciones (<b>{$tsNots}</b>)</a></li>
        <li><a href="{$tsConfig.url}/mensajes/" class="systemicons mps">Mensajes nuevos (<b>{$tsMPs}</b>)</a></li>
        <li><a href="{$tsConfig.url}/agregar/" style="background:url({$tsConfig.tema.t_url}/images/icons/posts.png) no-repeat left center;">Agregar post</a></li>
        <li><a href="{$tsConfig.url}/cuenta/" class="systemicons micuenta">Editar mi cuenta</a></li>
        <li><a href="{$tsConfig.url}/login-salir.php" class="salir">Cerrar sesión</a></li>
    </ul>
</section>
