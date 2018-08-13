<div class="box box-warning">
                <div class="box-header with-border">
                  <h3 class="box-title">	
		<a class="nomUser" style="color:#{$tsAutor.rango.r_color}" href="{$tsConfig.url}/perfil/{$tsAutor.user_name}">
			{$tsAutor.user_name}
		</a></h3>
                  <div class="box-tools pull-right">
                    <img src="{$tsConfig.tema.t_url}/images/space.gif" class="status {$tsAutor.status.css} imgUser" title="{$tsAutor.status.t}"/>
                      
		{if $tsAutor.user_id != $tsUser->uid}
		<a href="#" onclick="{if !$tsUser->is_member}registro_v5_toup();{else}mensaje.nuevo('{$tsAutor.user_name}','','','');{/if}return false">
			<i class="fa fa-envelope"></i>
		</a>
        </li>
		{/if}
		
		<img class="imgUser" src="{$tsConfig.tema.t_url}/images/icons/{if $tsAutor.user_sexo == 0}female{else}male{/if}.png" title="{if $tsAutor.user_sexo == 0}Mujer{else}Hombre{/if}" />
		<img class="imgUser" src="{$tsConfig.tema.t_url}/images/flags/{$tsAutor.pais.icon}.png" style="padding:2px" title="{$tsAutor.pais.name}" />
                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                  </div>
                </div>
                <div class="box-body">
                <div class="col-md-12">
                   <p style="text-align: center;" class="text-muted">{$tsAutor.rango.r_name}
                   
                   <img style="margin-left: 9px;" class="imgUser" src="{$tsConfig.tema.t_url}/images/icons/ran/{$tsAutor.rango.r_image}" title="{$tsAutor.rango.r_name}" />
                   </p> 
                  <a href="{$tsConfig.url}/perfil/{$tsAutor.user_name}">
                  <div class="row">
                  <div class="col-md-12">
                  <div class="troll">
			<img  title="Ver perfil de {$tsAutor.user_name}" alt="Ver perfil de {$tsAutor.user_name}" src="{$tsConfig.url}/files/avatar/{$tsAutor.user_id}_120.jpg"/></div></div></div>
		</a>
<ul class="userPost">
    
       
		<li> 
    </ul>
    
    <div class="box-body">
                  <div class="row">
                    <div class="col-xs-12">
                    <button class="btn btn-block btn-success btn-flat">{$tsAutor.user_comentarios} Comentarios</button>
                    </div>
                  </div>
                </div>
                
                 <div class="box-body">
                  <div class="row">
                    <div class="col-xs-12">
                    <button class="btn btn-block btn-primary btn-flat">{$tsAutor.user_seguidores} Seguidores</button>
                    </div>
                  </div>
                </div>
            
                
                  <div class="box-body">
                  <div class="row">
                    <div class="col-xs-12">
                    <button class="btn btn-block btn-danger btn-flat">{$tsAutor.user_puntos} Puntos</button>
                    </div>
                  </div>
                </div>
                
                  <div class="box-body">
                  <div class="row">
                    <div class="col-xs-12">
                    <button class="btn btn-block btn-warning btn-flat">{$tsAutor.user_posts} Posts</button>
                    </div>
                  </div>
                </div>
            
                  </div>
                  
                 <div class="col-md-12">
                  <section class="postAutor">
    
    
    {if !$tsUser->is_member}
	<a class="btn_g follow_user_post btn btn-block btn-success btn-flat" href="#" style="display: none;" onclick="registro_v5_toup(); return false">
		<span class="icons follow">Seguir Usuario</span>
	</a>
	{else if $tsAutor.user_id != $tsUser->uid}
	<a class="btn_g unfollow_user_post btn btn-block btn-danger btn-flat" onclick="notifica.unfollow('user', {$tsAutor.user_id}, notifica.userInPostHandle, $(this).children('span'))" {if !$tsAutor.follow}style="display: none;"{/if}>
		<span class="icons unfollow">Dejar de seguir</span>
	</a>
	<a class="btn_g follow_user_post btn btn-block btn-success btn-flat" onclick="notifica.follow('user', {$tsAutor.user_id}, notifica.userInPostHandle, $(this).children('span'))" {if $tsAutor.follow > 0}style="display:none;" {/if}>
		<span class="icons follow">Seguir Usuario</span>
	</a>
    {/if}
    <div class="categoriaList estadisticasList" {if $tsPost.m_total == 0} style="display:none;"{/if}>
        <h6>Medallas</h6>
        {if $tsPost.medallas}
        <ul>
            {foreach from=$tsPost.medallas item=m}
            <img src="{$tsConfig.tema.t_url}/images/icons/med/{$m.m_image}_16.png" title="{$m.m_title} - {$m.m_description}"/>
            {/foreach}
        </ul>
        {else}
        <p class="emptyData">No tiene medallas</p>
        {/if}
    </div>
    <div class="categoriaList estadisticasList">
        {if $tsPost.visitas}
        <h6>Últimos visitantes</h6> 
        <ul>
            {foreach from=$tsPost.visitas item=v}
            <a href="{$tsConfig.url}/perfil/{$v.user_name}" uid="{$v.user_id}"><img src="{$tsConfig.url}/files/avatar/{$v.user_id}_50.jpg" title="{$v.date|hace:true}" width="32" height="32"/></a> 
            {/foreach}
        </ul>
    </div>
    {/if}
    <hr/>
    
</section>
</div>
</div> 
</div>