
  <div class="box box-warning">

    <div class="box-header with-border "><h2 class="box-title">Buscar en la Comunidad</h2></div>

    <div class="box-body">

        <form action="{$tsConfig.url}/comunidades/buscar/">

            <input type="text" class="form-control floatL" name="q" /><input type="submit" value="Buscar" class="btn btn-primary btn-block ibg" />

            <input type="hidden" name="tipo" value="temas" />

			<input type="hidden" name="comid" value="{$tsCom.c_id}" />

        </form>

    </div>

</div>



<div class="box box-warning">

    <div class="box-header with-border "><h2 class="box-title">Staff de la comunidad</h2></div>

    <div class="box-body">

        {foreach from=$tsStaff item=a}

        <a href="{$tsConfig.url}/perfil/{$a.user_name}" uid="{$a.m_user}" class="floatL hovercard com_staff_avatar {if $a.m_permisos == 5}admin{/if}">

            <img src="{$tsConfig.url}/files/avatar/{$a.m_user}_120.jpg" width="55" height="55" />

            <span class="csa_status {if $a.is_on}online{/if}" title="{if $a.is_on}Online{else}Offline{/if}"></span>

        </a>    

        {/foreach}

    </div>

</div>



<div class="box box-warning">

    <div class="box-header with-border "><h2 class="box-title">Comentarios recientes</h2></div>

    <div class="box-body ">

    	{if $tsRespuestas}

        {foreach from=$tsRespuestas item=r}

        <div class="com_list_element" {if $r.t_estado == 1}style="opacity: 0.5;background: #000;" title="El tema ha sido eliminado"{/if}><a class="cle_autor" href="{$tsConfig.url}/perfil/{$r.user_name}">{$r.user_name}</a> en <a class="cle_title" href="{$tsConfig.url}/comunidades/{$tsCom.c_nombre_corto}/{$r.t_id}/{$r.t_titulo|seo}.html#coment_id_{$r.r_id}">{$r.t_titulo|limit:30}</a></div>

        {/foreach}

        {else}

        <div class="alert alert-info">No hay comentarios recientes</div>

        {/if}

    </div>

</div>



<div class="box box-warning">

    <div class="box-header with-border "><h2 class="box-title">&Uacute;ltimos miembros</h2></div>

    <div class="box-body">

        {foreach from=$tsMiembros item=a}

        <a href="{$tsConfig.url}/perfil/{$a.user_name}" class="floatL hovercard" uid="{$a.m_user}" style="margin-right:1px;margin-bottom:1px;"><img src="{$tsConfig.url}/files/avatar/{$a.m_user}_50.jpg" width="35" height="35" /></a>

        {/foreach}

    </div>

    <div class="box-header with-border "><div class="cbt_right"><a href="{$tsConfig.url}/comunidades/{$tsCom.c_nombre_corto}/miembros/">Ver m&aacute;s &raquo;</a></div></div>

</div>



<div class="box box-warning">

    <div class="box-header with-border ">

        <h2 class="box-title">Top temas</h2>

    <div class="box-tools pull-right cbt_list">
          
<select size="1" name="usgsfeed" id="usgsfeed" onchange="com.pop_list_change(this.value);">
    <option value="Historico" SELECTED>Historico</option>
<option value="Semana" >Semana</option>
<option value="Mes">Mes</option>
</select>
          

      </div>



    </div>

    <div class="box-body ">

        <div id="com_change_pop">

         <div id="ccp_historico" style="display: block;">

            	{if $tsTop.historico}

                {foreach from=$tsTop.historico item=t key=i}

                <div class="com_list_element" {if $t.t_estado == 1}style="opacity: 0.5;background: #000;" title="El tema ha sido eliminado"{/if}>

                    <span class="cle_item">{$i+1}</span>

                    <a href="{$tsConfig.url}/comunidades/{$tsCom.c_nombre_corto}/{$t.t_id}/{$t.t_titulo|seo}">{$t.t_titulo|limit:30}</a>

                    <span class="cle_number">{$t.t_votos_pos}</span>

                </div>

                {/foreach}

                {else}

                <div class="alert alert-info">Nada por aqu&iacute; para los historicos.</div>

                {/if}

            </div>

            <div id="ccp_mes" style="display: none;">

            	{if $tsTop.mes}

                {foreach from=$tsTop.mes item=t key=i}

                <div class="com_list_element" {if $t.t_estado == 1}style="opacity: 0.5;background: #000;" title="El tema ha sido eliminado"{/if}>

                    <span class="cle_item">{$i+1}</span>

                    <a href="{$tsConfig.url}/comunidades/{$tsCom.c_nombre_corto}/{$t.t_id}/{$t.t_titulo|seo}">{$t.t_titulo|limit:30}</a>

                    <span class="cle_number">{$t.t_votos_pos}</span>

                </div>

                {/foreach}

                {else}

                <div class="alert alert-info">Nada por aqu&iacute; para los del mes.</div>

                {/if}

            </div>                

               <div id="ccp_semana" style="display: none;">

            	{if $tsTop.semana}

                {foreach from=$tsTop.semana item=t key=i}

                <div class="com_list_element" {if $t.t_estado == 1}style="opacity: 0.5;background: #000;" title="El tema ha sido eliminado"{/if}>

                    <span class="cle_item">{$i+1}</span>

                    <a href="{$tsConfig.url}/comunidades/{$tsCom.c_nombre_corto}/{$t.t_id}/{$t.t_titulo|seo}">{$t.t_titulo|limit:30}</a>

                    <span class="cle_number">{$t.t_votos_pos}</span>

                </div>

                {/foreach}

                {else}

                <div class="alert alert-info">Nada por aqu&iacute; para los de semana.</div>

                {/if}

            </div>

        </div>

    </div>

</div>

    
  