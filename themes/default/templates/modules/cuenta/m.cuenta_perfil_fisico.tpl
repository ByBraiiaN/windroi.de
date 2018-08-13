<a class="botonCuenta" onclick="cuenta.chgsec(this)">Como soy</a>
<fieldset style="display: none">
	<div class="alert-cuenta cuenta-3"></div>
    <ul style="margin-left:-40px;">
        <li>
            <label for="altura">Mi altura</label>
            <input placeholder="&nbsp;cent&iacute;metros" type="text" value="{if $tsPerfil.p_altura}{$tsPerfil.p_altura}{/if}" maxlength="3" name="altura" id="altura" class="text cuenta-save-3 form-control" >					
        </li></p>
        <li>
            <label for="peso">Mi peso</label>
            <input placeholder="&nbsp;kilogramos" type="text" value="{if $tsPerfil.p_peso > 0}{$tsPerfil.p_peso}{/if}" maxlength="3" name="peso" id="peso" class="text cuenta-save-3 form-control">					
        </li></p>
        <li>
            <label for="pelo_color">Color de pelo</label>
            <select class="cuenta-save-3 form-control" name="pelo_color" id="pelo_color">
                {foreach from=$tsPData.pelo key=val item=text}
                <option value="{$val}" {if $tsPerfil.p_pelo == $val}selected="selected"{/if}>{$text}</option>
                {/foreach}
            </select>
        </li></p>
        <li>
            <label for="ojos_color">Color de ojos</label>
            <select class="cuenta-save-3 form-control" name="ojos_color" id="ojos_color">
                {foreach from=$tsPData.ojos key=val item=text}
                <option value="{$val}" {if $tsPerfil.p_ojos == $val}selected="selected"{/if}>{$text}</option>
                {/foreach}
            </select>
        </li></p>
        <li>
            <label for="fisico">Complexi&oacute;n</label>
            <select class="cuenta-save-3 form-control" name="fisico" id="fisico">
                {foreach from=$tsPData.fisico key=val item=text}
                <option value="{$val}" {if $tsPerfil.p_fisico == $val}selected="selected"{/if}>{$text}</option>
                {/foreach}
            </select>
        </li></p>
        <li>
            <label for="dieta">Mi dieta es</label>
            <select class="cuenta-save-3 form-control" name="dieta" id="dieta">
                {foreach from=$tsPData.dieta key=val item=text}
                <option value="{$val}" {if $tsPerfil.p_dieta == $val}selected="selected"{/if}>{$text}</option>
                {/foreach}
            </select>
        </li></p>
        <li>
            <label for="fumo">Fumo</label>
            <select class="cuenta-save-3 form-control" name="fumo" id="fumo">
                {foreach from=$tsPData.fumo_tomo key=val item=text}
                <option value="{$val}" {if $tsPerfil.p_fumo == $val}selected="selected"{/if}>{$text}</option>
                {/foreach}
            </select>
        </li></p>
        <li>
            <label for="tomo_alcohol">Tomo alcohol</label>
            <select class="cuenta-save-3 form-control" name="tomo_alcohol" id="tomo_alcohol">
                {foreach from=$tsPData.fumo_tomo key=val item=text}
                <option value="{$val}" {if $tsPerfil.p_tomo == $val}selected="selected"{/if}>{$text}</option>
                {/foreach}
            </select>
        </li></p>
    </ul>
	<input type="button" value="Guardar y seguir" onclick="cuenta.save(3, true)" class="boton btn btn-block btn-success btn-flat">
</fieldset>