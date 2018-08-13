{if $tsDato.c_estado == 1}<div class="alert alert-danger">La comunidad est&aacute; suspendida, para eliminarla permanentemente ve a la administraci&oacute;n</div>{/if}
<div class="box box-warning">
     <div class="box-header with-border">
              <h3 class="box-title">{if $tsAction == 'editar'}Edtar{else}Nueva{/if} comunidad</h3>
            </div>   
<div class="box-body">
    <div class="add_com">

    <div class="item_form ">
        <label>Nombre</label>
        <input type="text" name="nombre" placeholder="Nombre" class="required form-control" onKeyPress="hideError(this);" maxlength="40" tabindex="1" value="{$tsDato.c_nombre}" />

    </div>
	
    <div class="item_form ">
        <label>Nombre corto</label>
        <input type="text" name="ncorto" placeholder="Nombre corto" class="required form-control" tabindex="2" maxlength="12" value="{$tsDato.c_nombre_corto}" {if $tsDato.c_nombre_corto}disabled="disabled"{/if} />

        <small class="mg-lt">{if $tsDato.c_nombre_corto}El nombre corto es &uacute;nico y no se puede modificar{else}S&oacute;lo se permiten letras en min&uacute;scula, n&uacute;meros y guiones medios (-)<br />El nombre corto no se podr&aacute; modificar en el fut&uacute;ro.{/if}</small>

    </div>
<hr>
    <div class="item_form ">

        <label>Categor&iacute;a</label>

        <select name="categoria" id="ShowCats" class="required form-control" onChange="com.subcat()" tabindex="3">

            <option value="0">Selecciona una categor&iacute;a</option>

            {foreach from=$tsCats item=c}

            <option value="{$c.cid}" {if $tsDato.c_categoria == $c.cid}selected="selected"{/if}>{$c.c_nombre}</option>

            {/foreach}

        </select>

    </div>

    <div class="item_form ">

        <label>Sub-categor&iacute;a</label>

        <select name="subcategoria" id="ShowSubcats" class="required form-control" tabindex="4" {if $tsAction == 'crear'}disabled="disabled"{/if}>

            <option value="0">Seleccina una subcategor&iacute;a</option>

            {foreach from=$tsSubcats item=s}

            <option value="{$s.sid}" {if $tsDato.c_sub_categoria == $s.sid}selected="selected"{/if}>{$s.s_nombre}</option>

            {/foreach}

        </select>

    </div>

    <div class="item_form ">

        <label>Pa&iacute;s</label>

        <select name="pais" class="required form-control" onChange="hideError($(this))" tabindex="5">

            <option value="0">Selecciona un pa&iacute;s</option>

            {foreach from=$tsPaises key=code item=pais}

            <option value="{$code}" {if $tsDato.c_pais == $code}selected="selected"{/if}>{$pais}</option>

            {/foreach}

        </select>

    </div>
<hr>
    <div class="item_form ">
        <label>Descripci&oacute;n</label>
        <textarea class="required form-control" placeholder="Descripci&oacute;n" style="resize: none;" name="descripcion" tabindex="6" datatype="text" maxlength="200" dataname="Descripcion">{$tsDato.c_descripcion}</textarea>

    </div>

    <div class="item_form ">

        <div class="floatL">		

            <label>Acceso</label>

            <div class="option ">

                <input name="acceso" type="radio" class="radio" value="1" checked="" tabindex="7" {if $tsDato.c_acceso == 1}checked="checked"{/if}>

                <p class="floatL"><strong>Todos</strong> Todas las personas que visitan {$tsConfig.titulo} podr&aacute;n acceder a tu comunidad. (Recomendado)</p>

            </div>

            <div class="option mg-lt ">

                <input name="acceso" type="radio" value="2" {if $tsDato.c_acceso == 2}checked="checked"{/if}>

                <p class="floatL"><strong>S&oacute;lo usuarios registrados</strong> El acceso a tu comunidad estar&aacute; restringida &uacute;nicamente para los usuarios que se han registrado en {$tsconfig.titulo}</p>           

            </div>			

        </div>

    </div>
<hr>
    <div class="item_form ">

        <div class="floatL">					

            <label>Permisos</label>									

            <div class="option ">

                <input name="permisos" type="radio" value="3" checked="" tabindex="8" {if $tsDato.c_permisos == 3}checked="checked"{/if}>

                <p class="floatL"><strong>Posteador</strong> Los usuarios al ingresar en tu comunidad podr&aacute;n comentar y crear temas.</p>	

            </div>

            <div class="option mg-lt ">

                <input name="permisos" type="radio" value="2" {if $tsDato.c_permisos == 2}checked="checked"{/if}>

                <p class="floatL"><strong>Comentador</strong> Los usuarios al participar en tu  comunidad s&oacute;lo podr&aacute;n comentar pero no estar&aacute;n habilitados para crear nuevos temas.</p>	

            </div>

            <div class="option mg-lt ">

                <input name="permisos" type="radio" value="1" {if $tsDato.c_permisos == 1}checked="checked"{/if}>

                <p class="floatL"><strong>Visitante</strong> Los usuarios al participar en tu comunidad no podr&aacute;n comentar ni tampoco crear temas.</p>

            </div>

        </div>

        <div class="item_form_nota option mg-lt ">

            <strong>Nota:</strong> La opci&oacute;n seleccionada le asignar&aacute; autom&aacute;ticamente el mismo rango a todos los usuarios que ingresan a tu comunidad, sin embargo, podr&aacute;s posteriormente modificarlo para cada uno de los participantes.

        </div>

    </div>

    {if $tsAction == 'editar' && $tsDato.c_autor != $tsUser->uid}

    <div class="item_form ">

        <label>Raz&oacute;n</label>

        <input type="text" class="required form-control" name="causa" tabindex="9" />

        <small class="mg-lt">Si has modificado el contenido de esta comunidad ingresa la raz&oacute;n por la cual lo modificaste.</small>

    </div>

    {/if}

    <div class="item_form ">

        <input type="button" class="btn btn-primary" value="{if $tsAction == 'crear'}Crear comunidad{else}Guardar cambios{/if}" onClick="com.crear_comunidad()" />

    </div></div>
</div>
</div>