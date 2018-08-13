<div class="row">
<div class="col-md-8">
<a name="comentarios"></a>

<div class="panel box box-primary">
                      <div class="box-header with-border">
                        <h4 class="box-title">
                          Responder Mensaje 
                        </h4>
                      </div>
                      
                      <div id="collapseOne" class="panel-collapse collapse in" aria-expanded="true">
                        <div class="box-body">
                        <p class="text-muted">Contenido del mensaje :</p>
                        <ul class="mpHistory" id="historial">
                        <li><p class="text-muted">{$tsMensajes.msg.mp_subject}</p></li>
                        
                        </ul>
                        
                        <p class="text-light-blue">	<span class="info"><span> Entre </span><a href="{$tsConfig.url}/perfil/{$tsUser->nick}"> Tú </a><span> y </span><a href="{$tsConfig.url}/perfil/{$tsMensajes.ext.user}">{$tsMensajes.ext.user}</a></span></p>
                        <ul class="mpHistory" id="historial">
	{if $tsMensajes.res}{foreach from=$tsMensajes.res item=mp}
	<li>
        <a href="{$tsConfig.url}/perfil/{$mp.user_name}">
        
        <div class="contMensajeAutor">
            <div class="autorMensaje">
                <a href="{$tsConfig.url}/perfil/{$mp.user_name}" class="autor-name">{$mp.user_name}</a> 
                {if $tsUser->is_admod}
                <a href="{$tsConfig.url}/moderacion/buscador/1/1/{$mp.mr_ip}">
                    <span class="mp-date">{$mp.mr_ip}</span>
                </a>
                {/if} 
                <div class="pull-right">
                <span class="text-muted">{$mp.mr_date|fecha}</span></div>
            </div>
            <p>{$mp.mr_body}</p>
        </div>
	</li>
	{/foreach}
    {else}
	<li class="emptyData">No se pudieron cargar los mensajes.</li>
	{/if}
</ul>
<hr/>


{if $tsUser->is_admod || ($tsMensajes.msg.mp_del_to == 0 && $tsMensajes.msg.mp_del_from == 0 && $tsMensajes.ext.can_read == 1)}
<textarea id="respuesta" onfocus="onfocus_input(this)" onblur="onblur_input(this)" title="Escribe una respuesta..." class="form-control">Escribe una respuesta...</textarea>
<input type="hidden" id="mp_id" value="{$tsMensajes.msg.mp_id}" /><br />
<a class="boton btn btn-info btn-flat" onclick="mensaje.responder(); return false;">Responder</a>
{else}
    <p class="text-red">Un participante abandonó la conversación o no tienes permiso para responder</p>
{/if}
                        </div>
                      </div>
                    </div>


</div>
<div class="col-md-4"><div class="panel box box-primary">
                      <div class="box-header with-border">
                        <h4 class="box-title">
                          
                            Menú
                          
                        </h4>
                      </div>
                      <div id="collapseOne" class="panel-collapse collapse in" aria-expanded="true">
                        <div class="box-body">
                     <nav>
	<ul class="actions-list">
		<li><a href="#" onclick="mensaje.marcar('{$tsMensajes.msg.mp_id}:{$tsMensajes.msg.mp_type}', 1, 2, this); return false;"> No leido</a></li>
		<li><a href="#" onclick="mensaje.eliminar('{$tsMensajes.msg.mp_id}:{$tsMensajes.msg.mp_type}',2); return false;"> Eliminar</a></li>
		<li><a href="#" onclick="denuncia.nueva('mensaje',{$tsMensajes.msg.mp_id}, '', ''); return false;"> No deseado</a></li>
		<li><a href="#" onclick="denuncia.nueva('usuario',{if $tsMensajes.msg.mp_from != $tsUser->uid}{$tsMensajes.msg.mp_from}{else}{$tsMensajes.msg.mp_to}{/if}, '', '{if $tsMensajes.msg.mp_from != $tsUser->uid}{$tsMensajes.msg.user_name}{else}{$tsUser->getUsername($tsMensajes.msg.mp_to)}{/if}'); return false"> Denunciar usuario</a></li>
		<li><a href="javascript:bloquear({$tsMensajes.ext.uid}, {if $tsMensajes.ext.block}false{else}true{/if}, 'mensajes')" id="bloquear_cambiar">{if $tsMensajes.ext.block}Desbloquear{else}Bloquear{/if} a {$tsMensajes.ext.user}</a></li>
		<li><a href="{$tsConfig.url}/mensajes/"> Volver a mensajes</a></li>
	</ul>
</nav>
                        </div>
                      </div>
                    </div></div>

</div>



