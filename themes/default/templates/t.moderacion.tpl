{include file='sections/main_header.tpl'}
<script type="text/javascript" src="{$tsConfig.tema.t_url}/js/moderacion.js"></script>
<section class="content">
<div class="row">
    <div class="col-md-3">
	{include file='admin_mods/m.mod_sidemenu.tpl'}</div>
<div class="col-md-9">
<section>
    {* Q WEBA PERO NO HAY DE OTRA xD*}
    {if $tsAction == ''}
    {include file='admin_mods/m.mod_welcome.tpl'}
    {elseif $tsAction == 'posts'}
    {include file='admin_mods/m.mod_report_posts.tpl'}
	{elseif $tsAction == 'comunidades'}
    {include file='admin_mods/m.mod_report_comunidades.tpl'}
    {elseif $tsAction == 'temas'}
    {include file='admin_mods/m.mod_report_temas.tpl'}
    {elseif $tsAction == 'tempelera'}
    {include file='admin_mods/m.mod_papelera_temas.tpl'}
    {elseif $tsAction == 'mps'}
    {include file='admin_mods/m.mod_report_mps.tpl'}
    {elseif $tsAction == 'users'}
    {include file='admin_mods/m.mod_report_users.tpl'}
    {elseif $tsAction == 'banusers'}
    {if $tsUser->is_admod || $tsUser->permisos.movub}{include file='admin_mods/m.mod_ban_users.tpl'}{/if}
    {elseif $tsAction == 'pospelera'}
    {if $tsUser->is_admod || $tsUser->permisos.morp}{include file='admin_mods/m.mod_papelera_posts.tpl'}{/if}
    {elseif $tsAction == 'buscador'}
    {if $tsUser->is_admod || $tsUser->permisos.moub}{include file='admin_mods/m.mod_buscador.tpl'}{/if}
    {elseif $tsAction == 'comentarios'}
    {if $tsUser->is_admod || $tsUser->permisos.mocc}{include file='admin_mods/m.mod_revision_comentarios.tpl'}{/if}
    {elseif $tsAction == 'revposts'}
    {if $tsUser->is_admod || $tsUser->permisos.mocp}{include file='admin_mods/m.mod_revision_posts.tpl'}{/if}
    {/if}</section></div></div></section>
    {include file='sections/main_footer.tpl'}
