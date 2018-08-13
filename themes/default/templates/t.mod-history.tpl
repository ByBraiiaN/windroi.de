{include file='sections/main_header.tpl'}

<div class="panel box box-primary">
                      <div class="box-header with-border">
                        <h4 class="box-title">
                          <a>
                            Historial
                          </a>
                        </h4>
                      </div>
                      <div id="collapseOne" class="panel-collapse collapse in">
                        <div class="box-body">
                            
    <input type="button" onclick="location.href = '{$tsConfig.url}/mod-history/'" value="Posts" {if !$tsAction || $tsAction == 'posts'}class="boton"{else}class="boton"{/if}/> 
        {if !$tsAction || $tsAction == 'posts'}
         <ul class="colTitulos">
             <li class="colTitulo">Post</li>
             <li class="colUsuario">Usuario</li>
             <li class="colEstado">Acci&#243;n</li>
             <li class="colUsuario">Moderador</li>
             <li class="colEstado">Causa</li>
         </ul>
        {foreach from=$tsHistory item=h}
            <ul>
                <li class="colTitulo">{$h.post_title} de </li>
                <li class="colUsuario"><a href="{$tsConfig.url}/perfil/{$h.user_name}">{$h.user_name}</a></li>
                <li class="colEstado">
                    {if $h.action == 1}
                    <span class="color_green">Editado</span>
                    {elseif $h.action == 2}
                    <span class="color_red">Eliminado</span>
                    {else}
                    <span style="color:purple;">Revisi&#243;n</span>
                    {/if}
                </li>
                <li class="colUsuario">
                    <a href="{$tsConfig.url}/perfil/{$h.mod_name}">{$h.mod_name}</a>
                </li>
                <li class="colEstado">{if $h.reason == 'undefined'}Indefinida{else}{$h.reason}{/if}</li>
            </ul>
        {/foreach}
        {foreach from=$tsHistory item=h}
        <ul>
            <li class="colTitulo">{$h.f_title}</li>
            <li class="colUsuario"><a href="{$tsConfig.url}/perfil/{$h.user_name}">{$h.user_name}</a></li>
            <li class="colUsuario">
                {if $h.action == 1}
                <span class="color_green">Editada</span>
                {else}
                <span class="color_red">Eliminada</span>
                {/if}
        	</li>
            <li class="colUsuario">
            	<a href="{$tsConfig.url}/perfil/{$h.mod_name}">{$h.mod_name}</a>
            </li>
            <li class="colEstado">{if $h.reason == 'undefined'}Indefinida{else}{$h.reason}{/if}</li>
        </ul>
        {/foreach}
        {/if}
</div></div></div>
{include file='sections/main_footer.tpl'}