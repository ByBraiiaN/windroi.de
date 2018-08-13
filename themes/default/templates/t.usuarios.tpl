{include file='sections/main_header.tpl'}
	
	<div class="col-md-8">
    <div class="box box-info">
                <div class="box-header with-border">
                    <h3 class="box-title">Usuarios</h3>
                </div>
    <div class="box-body">
                    
                    
	<div id="showResult" class="resultUser">
		{if $tsUsers}
        {foreach from=$tsUsers item=u}
        <ul>
        	<header>
                <h4>
               <img title="{$u.rango.title}" src="{$tsConfig.tema.t_url}/images/icons/ran/{$u.rango.image}"/>
                <a href="{$tsConfig.url}/perfil/{$u.user_name}" style="color:#{$u.rango.color}" >{$u.user_name}</a>
                </h4>
            </header>
                <div class="floatL avatarBox" style="padding:0">
                	<a href="{$tsConfig.url}/perfil/{$u.user_name}">
                	<img width="75" height="75" src="{$tsConfig.url}/files/avatar/{$u.user_id}_120.jpg" class="av"/></a>
                </div>
			{if $u.p_mensaje}
			<li><span>{$u.p_mensaje}</span></li>
			{/if}
			<li>Sexo: 
                <span>{if $u.user_sexo == 0}Mujer{else}Hombre{/if}</span> 
                - País: <span>{$tsPaises[$u.user_pais]}</span>
			</li>
			<li>
				Posts: <span>{$u.user_posts}</span> 
				- Puntos: <span>{$u.user_puntos}</span>
				- Comentarios: <span>{$u.user_comentarios}</span>
			</li>
			{if $u.user_id != $tsUser->uid}
			<li>
				<a href="#" onclick="{if !$tsUser->is_member}registro_load_form();{else}mensaje.nuevo('{$u.user_name}','','','');{/if}return false">Enviar Mensaje</a>
			</li>
			{/if}
			<li>Estado: {$u.status.t} <strong class="status {$u.status.css}">&nbsp;</strong></li>
        </ul>
		{/foreach}
		{else}
        	<p class="emptyData">No se encontraro usuarios con los filtros seleccionados.</p>
			{/if}
		
		<div class="paginador">
			{if $tsPages.prev != 0}
            <a class="boton floatL" href="{$tsConfig.url}/usuarios/?page={$tsPages.prev}{if $tsFiltro.online == 'true'}&online=true{/if}{if $tsFiltro.avatar == 'true'}&avatar=true{/if}{if $tsFiltro.sex}&sex={$tsFiltro.sex }{/if}{if $tsFiltro.pais}&pais={$tsFiltro.pais}{/if}{if $tsFiltro.rango}&rango={$tsFiltro.rango}{/if}">&laquo; Anterior</a>
            {/if}
			{if $tsPages.next != 0}
            <a class="boton floatR" href="{$tsConfig.url}/usuarios/?page={$tsPages.next}{if $tsFiltro.online == 'true'}&online=true{/if}{if $tsFiltro.avatar == 'true'}&avatar=true{/if}{if $tsFiltro.sex}&sex={$tsFiltro.sex }{/if}{if $tsFiltro.pais}&pais={$tsFiltro.pais}{/if}{if $tsFiltro.rango}&rango={$tsFiltro.rango}{/if}">Siguiente &raquo;</a>
            {/if}
		</div>
	</div>
</div></div></div>

<div class="col-md-4">
     <div class="box box-success">
       <div class="box-header with-border">
            <h3 class="box-title">Filtrar</h3>
            </div>
            <div class="box-body"> 
            
<div id="resultados" class="buscadorUser"> 
	<form action="" method="get">
   
		<ul> 
			<li{if $tsFiltro.online == 'true'} class="here"{/if}><label><input type="checkbox" name="online" value="true" {if $tsFiltro.online == 'true'}checked="true"{/if}/>En linea</label></li> 
			<li{if $tsFiltro.avatar == 'true'} class="here"{/if}><label><input type="checkbox" value="true" name="avatar" {if $tsFiltro.avatar == 'true'}checked="true"{/if}/>Con foto</label></li> 
			<li{if $tsFiltro.sex == 'm'} class="here"{/if}><label><input type="radio" name="sexo" value="m" {if $tsFiltro.sex == 'm'}checked="true"{/if}/>Hombre</label></li> 
			<li{if $tsFiltro.sex == 'f'} class="here"{/if}><label><input type="radio" name="sexo" value="f" {if $tsFiltro.sex == 'f'}checked="true"{/if}/> Mujer</label></li> 
			<li{if $tsFiltro.sex == ''} class="here"{/if}><label><input type="radio" name="sexo" value="" {if $tsFiltro.sex == ''}checked="true"{/if}/>Ambos</label></li>
			<li>
                <label class="select">
                    <select name="pais" id="pais"><option value="">Todos los Países...</option>
                        {foreach from=$tsPaises key=code item=pais}
                        <option value="{$code}" {if $tsFiltro.pais == $code}selected="true"{/if}>{$pais}</option>
                        {/foreach}
                    </select>
                </label>
                <label class="select">
                    <select name="rango" id="rango">
                        <option value="">Todos los Rangos...</option>
                        {foreach from=$tsRangos item=r}
                        <option value="{$r.rango_id}" {if $tsFiltro.rango == $r.rango_id}selected="true"{/if}>{$r.r_name}</option>
                        {/foreach}
                    </select>
                </label>
            </li>
			<input type="submit" class="boton floatR" value="Filtrar" />
		</ul>
		<p class="cantResult">Mostrando <strong>{$tsTotal}</strong> resultados de <strong>{$tsPages.total}</strong></p>
      
	</form>
	</div></div></div></div>
	
<aside class="asideUsuarios">
	{$tsConfig.ads_160}
</aside>
{include file='sections/main_footer.tpl'}