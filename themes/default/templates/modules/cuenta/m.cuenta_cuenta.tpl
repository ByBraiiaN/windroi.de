                       
<div class="content-tabs cuenta">
    <div class="alert-cuenta cuenta-1"></div>
    <fieldset>
        <ul style="margin-left: -31px;">
            <li>
                <label for="email">E-Mail:</label>
                {$tsUser->info.user_email} (<a onclick="input_fake('email')">Cambiar</a>)
                <input type="email" style="display: none" value="{$tsUser->info.user_email}" maxlength="35" name="email" id="email" class="text cuenta-save-1 input-hidden-email form-control">
            </li><br />
            <li>
                <label for="pais">País:</label>
                <select onchange="cuenta.chgpais()" class="cuenta-save-1 form-control" name="pais" id="pais">
                <option value="">País</option>
                {foreach from=$tsPaises key=code item=pais}
                <option value="{$code}" {if $code == $tsPerfil.user_pais}selected="selected"{/if}>{$pais}</option>
                {/foreach}
                </select>
            </li><br />
            <li>
                <label for="estado">Estado/Provincia:</label>
                <select name="estado" id="estado" class="cuenta-save-1 form-control">
                {foreach from=$tsEstados key=code item=estado}
                <option value="{$code+1}" {if $code+1 == $tsPerfil.user_estado}selected="selected"{/if}>{$estado}</option>
                {/foreach}
                </select>
            </li><br />
            <div class="row">
             <div class="col-xs-6">
                <input type="radio" value="m" name="sexo" {if $tsPerfil.user_sexo == '1'}checked="checked"{/if}/><label>&nbsp;Masculino</label></div>
                 <div class="col-xs-6">
                <input type="radio" value="f" name="sexo" {if $tsPerfil.user_sexo == '0'}checked="checked"{/if}/><label>&nbsp;Femenino</label></div></div><br />
            
            <div class="row">
                    <div class="col-xs-3">
                    <label>Dia:</label>
                       <select class="cuenta-save-1 form-control" name="dia">
                {section name=dias start=1 loop=32}
                <option value="{$smarty.section.dias.index}" {if $tsPerfil.user_dia ==  $smarty.section.dias.index}selected="selected"{/if}>{$smarty.section.dias.index}</option>
                {/section}                            
                </select>
                    </div>
                    <div class="col-xs-4">
                    <label>Mes:</label>
                       <select class="cuenta-save-1 form-control" name="mes">
                {foreach from=$tsMeces key=mid item=mes}
                <option value="{$mid}" {if $tsPerfil.user_mes == $mid}selected="selected"{/if}>{$mes}</option>
                {/foreach}
                </select>
                    </div>
                    <div class="col-xs-5">
                    <label>A&nacute;o:</label>
                      <select class="cuenta-save-1 form-control" name="ano">
                {section name=year start=$tsEndY loop=$tsEndY step=-1 max=$tsMax}
                <option value="{$smarty.section.year.index}" {if $tsPerfil.user_ano ==  $smarty.section.year.index}selected="selected"{/if}>{$smarty.section.year.index}</option>
                {/section}
                </select>
                    </div>
                  </div>
            <br />
            <li>
                {if $tsConfig.c_allow_firma}
                <label for="firma">Firma:<small>(Acepta BBCode) Max. 300 car.</small></label>
                <textarea name="firma" id="firma" class="cuenta-save-1 form-control">{$tsPerfil.user_firma}</textarea>
                {/if}
           </li><br />
        </ul>
        <input type="button" value="Guardar" onclick="cuenta.save(1)" class="boton btn btn-block btn-success btn-flat">
        <input type="button" value="Siguiente" onclick="cuenta.save(1, true)" class="boton btn btn-block btn-warning btn-flat">
    </fieldset>
</div>
                        
