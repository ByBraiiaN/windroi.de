{if $tsAdmin.m_permisos > 0}
<form action="javascript:com.member_admin_submit()" method="post" id="com_member_admin">
	<div class="cma_option">
    	<h2>{$tsAdmin.user_name}</h2>
    </div>
	<div class="cma_option" onclick="$('#rango').attr('checked', 'checked');">
    	<h2><input type="radio" name="type" id="rango" checked="checked" value="1" /> Cambiar rango</h2>
        <br />
        Rango actual: <strong>{if $tsAdmin.m_permisos == 2}Comentador{elseif $tsAdmin.m_permisos == 3}Posteador{elseif $tsAdmin.m_permisos == 4}Moderador{elseif $tsAdmin.m_permisos == 5}Administrador{else}Visitante{/if}</strong>
        <br /><br />
        <label>Rango nuevo:</label>
        <select name="rango">
            <option value="1" {if $tsAdmin.m_permisos == 1}selected="selected"{/if}>Visitante</option>
            <option value="2" {if $tsAdmin.m_permisos == 2}selected="selected"{/if}>Comentador</option>
            <option value="3" {if $tsAdmin.m_permisos == 3}selected="selected"{/if}>Posteador</option>
            <option value="4" {if $tsAdmin.m_permisos == 4}selected="selected"{/if}>Moderador</option>
            <option value="5" {if $tsAdmin.m_permisos == 5}selected="selected"{/if}>Administrador</option>
        </select>
    </div>
    <div class="cma_option" onclick="$('#suspender').attr('checked', 'checked');">
    	<h2><input type="radio" name="type" id="suspender" value="2" /> Suspender</h2>
        <br />       
        <label>Causa: </label><input type="text" name="causa" class="input_text" style="width: 200px;" />
        <br /><br />
        <input type="radio" name="tiempo" id="permanente" value="0" checked="checked" /><label for="permanente">Permanente</label>
        <br />
        <input type="radio" name="tiempo" id="dias" value="1" /><label for="type">D&iacute;as: </label><input type="text" name="dias" class="input_text" style="width: 50px;" onclick="$('#dias').attr('checked', 'checked');" />
        <input type="hidden" name="userid" value="{$tsAdmin.m_user}" />
    </div>
</form>
{/if}