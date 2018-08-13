<div class="content-tabs cambiar-nick" style="display:none">
	<fieldset>
        <div class="alert-cuenta cuenta-8"></div>
        {if $tsUser->info.user_name_changes > 0}
        <p class="text-muted">
            Hola {$tsUser->nick}, le recordamos que dispone de {$tsUser->info.user_name_changes} cambios este año.
            Recuerde que si su cambio no es aprobado, no se le devolveré la disponibilidad de otro cambio.
        </p>
        <ul style="margin-left:-40px;">
            <li>
                <label for="new_nick">Nombre de usuario</label>
                <input type="text" value="{$tsUser->nick}" maxlength="15" name="new_nick" id="new_nick" class="text cuenta-save-8 form-control"/>
            </li></p>
            <li>
                <label for="password">Contraseña actual</label>
                <input type="password" maxlength="32" name="password" id="password" class="text cuenta-save-8 form-control"/>
            </li></p>
            <li>
                <label for="pemail">Recibir respuesta en</label>
                {$tsUser->info.user_email} (<a style="cursor:pointer;" onclick="input_fake('pemail')">Cambiar</a>)
                <input type="text" style="display: none" value="{$tsUser->info.user_email}" maxlength="35" name="pemail" id="pemail" class="text cuenta-save-8 input-hidden-pemail form-control">
            </li></p>
        </ul>
        <input type="button" value="Guardar" onclick="cuenta.save(8)" class="boton btn btn-block btn-success btn-flat"/>
    </fieldset>
	{else}
	<p class="text-muted">Hola {$tsUser->nick}, lamentamos informarle de su nula disponibilidad de cambios, contacte con la administración o espere un año.
	{/if}
</div>