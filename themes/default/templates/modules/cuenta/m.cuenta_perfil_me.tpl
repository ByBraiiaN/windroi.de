<fieldset>
	<div class="alert-cuenta cuenta-2"></div>
    <ul style="margin-left: -40px;">
        <li>
            <label for="nombrez">Nombre completo</label>
            <input type="text" value="{$tsPerfil.p_nombre}" maxlength="60" name="nombrez" id="nombrez" class="text cuenta-save-2 form-control">
        </li></p>
        <li>
            <label for="sitio">Mensaje Personal</label>
            <textarea value="" maxlength="60" name="mensaje" id="mensaje" class="cuenta-save-2 form-control">{$tsPerfil.p_mensaje}</textarea>
        </li></p>
        <li>
            <label for="sitio">Sitio Web</label>
            <input type="text" value="{$tsPerfil.p_sitio}" maxlength="60" name="sitio" id="sitio" class="text cuenta-save-2 form-control">
        </li></p>
        	<label for="ft">Redes sociales</label>
        <div class="input-group margin">
        
                    <div class="input-group-btn">
                      <button type="button" class="btn btn-facebook"><i class="fa fa-facebook"></i></button>
                    </div><!-- /btn-group -->
                     <input placeholder="Facebook"  type="text" value="{$tsPerfil.p_socials.f}" maxlength="64" name="facebook" id="ft2" class="text cuenta-save-2 form-control" ></div>
                     
                     <div class="input-group margin">
                    <div class="input-group-btn">
                      <button type="button" class="btn btn-twitter"><i class="fa fa-twitter"></i></button>
                    </div><!-- /btn-group -->
                         <input placeholder="Twiiter" type="text" value="{$tsPerfil.p_socials.t}" maxlength="64" name="twitter" id="ft2" class="text cuenta-save-2 form-control">
                  </div>
        </p>
        <li>
            <label>Me gustaría</label>
        	<li>
                {foreach from=$tsPData.gustos key=val item=text}
                <input type="checkbox" name="g_{$val}" class="cuenta-save-2" value="1" {if $tsPerfil.p_gustos.$val == 1}checked="checked"{/if}><span>{$text}</span>
                {/foreach}
            </li>
        </li></p>
        <li>
            <label for="estado">Estado Civil</label>
            <select class="cuenta-save-2 form-control" name="estado" id="estado">
                {foreach from=$tsPData.estado key=val item=text}
                <option value="{$val}" {if $tsPerfil.p_estado == $val}selected="selected"{/if}>{$text}</option>
                {/foreach}
            </select>
        </li></p>
        <li>
        <label for="hijos">Hijos</label>
        <select   class="cuenta-save-2 form-control" name="hijos" id="hijos">
            {foreach from=$tsPData.hijos key=val item=text}
            <option value="{$val}" {if $tsPerfil.p_hijos == $val}selected="selected"{/if}>{$text}</option>
            {/foreach}
        </select>
        </li>
        <li></p>
        <label for="vivo">Vivo con</label>
        <select class="cuenta-save-2 form-control" name="vivo" id="vivo">
            {foreach from=$tsPData.vivo key=val item=text}
            <option value="{$val}" {if $tsPerfil.p_vivo == $val}selected="selected"{/if}>{$text}</option>
            {/foreach}
        </select>
        </li></p>
    </ul>
	<input type="button" value="Guardar y seguir" onclick="cuenta.save(2, true)" class="boton btn btn-block btn-success btn-flat">
</fieldset>