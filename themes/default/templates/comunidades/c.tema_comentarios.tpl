<div class="box box-info">
	<div class="box-header with-border"><h3 class="box-title"><span id="cbt_val">{$tsTema.t_respuestas|number_format:0:',':'.'}</span> comentarios</h3></div>
    {if !$tsTema.t_respuestas && $tsTema.t_cerrado == 0}<div class="alert alert-info">No hay comentarios. ¡S&eacute; el primero!</div>{/if}
    {if $tsTema.t_cerrado == 1 && $tsUser->uid != $tsTema.t_autor && !$tsUser->is_admod && $tsCom.mi_rango < 4}<div class="alert alert-warning">El tema est&aacute; cerrado y no se permiten comentarios</div>
	{elseif $tsTema.t_cerrado == 1 && $tsUser->uid == $tsTema.t_autor}<div class="alert alert-warning">El tema est&aacute; cerrado y no se permiten comentarios tu puedes hacerlo porque eres el autor.</div>
	{elseif $tsTema.t_cerrado == 1 && $tsUser->is_admod && !$tsUser->$tsTema.t_autor}<div class="alert alert-warning">El tema est&aacute; cerrado y no se permiten comentarios tu puedes hacerlo porque eres moderador o administrador general</div>
	{elseif $tsTema.t_cerrado == 1 && $tsCom.mi_rango > 3 && !$tsUser->$tsTema.t_autor && !$tsUser->is_admod}<div class="alert alert-warning">El tema est&aacute; cerrado y no se permiten comentarios tu puedes hacerlo porque eres moderador o administrador de la Comunidad</div>	
	{/if}   
    <div id="result_answers">{include file='t.comus_ajax/c.pages_respuestas.tpl'}</div> 
    
    {if $tsUser->is_member && $tsCom.es_miembro && $tsTema.t_cerrado == 0 && $tsCom.mi_rango >= 2 || $tsCom.mi_rango >= 4 || $tsUser->is_admod || $tsUser->uid == $tsTema.t_autor}
    <div class="ctc_form">
    	<div class="alert alert-danger" style="display:none;"></div>
    	<div id="procesando"></div>
    	<div class="ctcf_avatar"><a href="{$tsConfig.url}/perfil/{$tsUser->nick}"><img src="{$tsConfig.url}/files/avatar/{$tsUser->uid}_50.jpg" width="48" height="48" /></a></div>
        <div class="ctcf_add_coment floatL">
        	<textarea id="markit_resp" class="form-control" style="width: 535px;border-radius: 0 0 4px 4px;border-top: 0;resize: vertical;"></textarea>
            <input type="button" class="btn btn-primary floatL" id="btn_newcom" value="Comentar" onclick="com.add_respuesta({$tsTema.t_id});" />
            <div id="markit_emoticon" class="floatL" style="display:none;margin-left: 5px;margin-top: 8px;">{include file='modules/global/m.global_emoticons.tpl'}</div>
        </div>
    </div>
    {elseif $tsTema.t_cerrado == 0 && !$tsCom.es_miembro || $tsTema.t_cerrado == 0 && !$tsUser->is_member}
    <div class="alert alert-infow">Tienes que ser miembro para responder en este tema</div>
    {elseif $tsTema.t_cerrado == 0 && $tsCom.mi_rango <= 2}
    <div class="alert alert-warning">Tu rango no te permite realizar comentarios en esta comunidad</div>
    {/if}
</div>