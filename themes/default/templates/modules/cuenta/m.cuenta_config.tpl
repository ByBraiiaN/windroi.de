<div class="content-tabs privacidad" style="display:none">
	<fieldset>
    	<header><h4 class="text-light-blue">¿Quién puede...</h4></header>
        <div class="alert-cuenta cuenta-7"></div>
        <ul style="margin-left:-40px;">
            <li>
                <label>ver tu muro?</label>
                <select name="muro" class="cuenta-save-7 form-control">
                    {foreach from=$tsPrivacidad item=p key=i}
                    <option value="{$i}"{if $tsPerfil.p_configs.m == $i} selected="true"{/if}>{$p}</option>
                    {/foreach}
                </select>
            </li></p>
            {$tsPerfil.p_configs.muro}
            <li>
                <label>firmar tu muro?</label>
                <select name="muro_firm" class="cuenta-save-7 form-control">
                    {foreach from=$tsPrivacidad item=p key=i}
                    {if $i != 6}
                    <option value="{$i}"{if $tsPerfil.p_configs.mf == $i}selected{/if}>{$p}</option>
                    {/if}
                    {/foreach}
                </select>
            </li></p>
            <li>
                <label>ver últimas visitas?</label>
                <select name="last_hits" class="cuenta-save-7 form-control">
                    {foreach from=$tsPrivacidad item=p key=i}
                    {if $i != 1 && $i != 2}
                    <option value="{$i}"{if $tsPerfil.p_configs.hits == $i}selected{/if}>{$p}</option>
                    {/if}
                    {/foreach}
                </select>
            </li></p>
            {if !$tsUser->is_admod}
            {if $tsPerfil.p_configs.rmp != 8}
            <li>
                <label>enviarte MPs?</label>
                <select name="rec_mps" class="cuenta-save-7 form-control">
                    {foreach from=$tsPrivacidad item=p key=i}
                    {if $i != 6}
                    <option value="{$i}"{if $tsPerfil.p_configs.rmp == $i}selected{/if}>{$p}</option>
                    {/if}
                    {/foreach}
                </select>
            </li></p>
            {else}
            <div class="mensajes error text-muted">Algunas opciones de su privacidad han sido deshabilitadas, contacte con la administración.</div>
            {/if}
            {/if}
        </ul></p>
	{if !$tsUser->is_admod}
	<a onclick="$('#primi').slideUp(); $('#passi').slideDown(); $('#informa').slideDown(); $('#btninforma').slideDown();" id="primi">Desactivar Cuenta</a>
	<p  class="text-muted" style="display:none;" id="informa"> 
    	Si desactiva su cuenta, todo el contenido relacionado a usted dejará de ser 
        visible durante un tiempo. 
		Pasado ese tiempo, la administración borrará todo su contenido y no podrá recuperarlo.
    </p>
	<a onclick="desactivate()" style="display:none;" id="btninforma"><input type="button" value="Lo sé, pero quiero desactivarla" style="position:right;" class="boton btn btn-block btn-danger btn-flat"></a>
	{/if}
	<div class="buttons">
		<input type="button" value="Guardar" onclick="cuenta.save(7)" class="boton btn btn-block btn-success btn-flat">
	</div>
    </fieldset>
</div>