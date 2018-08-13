<a class="botonCuenta" onclick="cuenta.chgsec(this)">Formación y trabajo</a>
<fieldset style="display: none">
	<div class="alert-cuenta cuenta-4"></div>
    <ul style="margin-left:-40px;">
        <li>
            <label for="estudios">Estudios</label>
            <select class="cuenta-save-4 form-control" name="estudios" id="estudios">
                {foreach from=$tsPData.estudios key=val item=text}
                <option value="{$val}" {if $tsPerfil.p_estudios == $val}selected="selected"{/if}>{$text}</option>
                {/foreach}
            </select>
        </li></p>
        <li>
            <label>Idiomas</label>
            {foreach from=$tsPData.idiomas key=iid item=idioma}
            <li>
            <span class="idiomaCuenta text-muted">{$idioma}</span>
            <select class="cuenta-save-4 form-control" name="idioma_{$iid}">
                {foreach from=$tsPData.inivel key=val item=text}
                <option value="{$val}" {if $tsPerfil.p_idiomas.$iid == $val}selected="selected"{/if}>{$text}</option>
                {/foreach}
            </select>
            </li></p>
            {/foreach}
        </li></p>
        <li>
            <label for="profesion">Profesión</label>
            <input class="text cuenta-save-4 form-control" maxlength="32" name="profesion" id="profesion" value="{$tsPerfil.p_profesion}"/>
        </li></p>
        <li>
            <label for="empresa">Empresa</label>
            <input class="text cuenta-save-4 form-control" maxlength="32" name="empresa" id="empresa" value="{$tsPerfil.p_empresa}"/>
        </li></p>
        <li>
            <label for="sector">Sector</label>
            <select class="cuenta-save-4 form-control" name="sector" id="sector">
                {foreach from=$tsPData.sector key=val item=text}
                <option value="{$val}" {if $tsPerfil.p_sector == $val}selected="selected"{/if}>{$text}</option>
                {/foreach}
            </select>
        </li></p>
        <li>
            <label for="ingresos">Nivel de ingresos</label>
            <select class="cuenta-save-4 form-control" name="ingresos" id="ingresos">
                {foreach from=$tsPData.ingresos key=val item=text}
                <option value="{$val}" {if $tsPerfil.p_ingresos == $val}selected="selected"{/if}>{$text}</option>
                {/foreach}
            </select>
        </li></p>
        <li>
            <label for="intereses_profesionales">Intereses Profesionales</label>
            <textarea class="cuenta-save-4 form-control" name="intereses_profesionales" id="intereses_profesionales">{$tsPerfil.p_int_prof}</textarea>
        </li></p>
        <li>    
            <label for="habilidades_profesionales">Habilidades Profesionales</label>
            <textarea class="cuenta-save-4 form-control" name="habilidades_profesionales" id="habilidades_profesionales">{$tsPerfil.p_hab_prof}</textarea>
        </li></p>
    </ul>
    <input type="button" value="Guardar y seguir" onclick="cuenta.save(4, true)" class="boton btn btn-block btn-success btn-flat">
</fieldset>