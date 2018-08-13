{include file='sections/main_header.tpl'}
<script type="text/javascript" src="{$tsConfig.js}/admin.js"></script>
<section class="content">
<div class="row">
<div class="col-md-3">
    {include file='admin_mods/m.admin_sidemenu.tpl'}
    </div>

<div class="col-md-9">
<div class="panel box box-primary">
                      <div class="box-header with-border">
                        <h4 class="box-title">
                          <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
                          Panel de configuraciones
                          </a>
                        </h4>
                      </div>              
 <div id="collapseOne" class="panel-collapse collapse in">
                        <div class="box-body">
    {if $tsAction == ''}
    {include file='admin_mods/m.admin_welcome.tpl'}
    {elseif $tsAction == 'creditos'}
    {include file='admin_mods/m.admin_creditos.tpl'}
    {elseif $tsAction == 'configs'}
    {include file='admin_mods/m.admin_configs.tpl'}
    {elseif $tsAction == 'temas'}
    {include file='admin_mods/m.admin_temas.tpl'}
    {elseif $tsAction == 'news'}
    {include file='admin_mods/m.admin_noticias.tpl'}
    {elseif $tsAction == 'ads'}
    {include file='admin_mods/m.admin_publicidad.tpl'}
    {elseif $tsAction == 'medals'}
    {include file='admin_mods/m.admin_medallas.tpl'}
    {elseif $tsAction == 'stats'}
    {include file='admin_mods/m.admin_stats.tpl'}
    {elseif $tsAction == 'posts'}
    {include file='admin_mods/m.admin_posts.tpl'}
	{elseif $tsAction == 'comunidades'}
    {include file='admin_mods/m.admin_comunidades.tpl'}
    {elseif $tsAction == 'pconfigs'}
    {include file='admin_mods/m.admin_posts_configs.tpl'}
    {elseif $tsAction == 'cats'}
    {include file='admin_mods/m.admin_cats.tpl'}
    {elseif $tsAction == 'users'}
    {include file='admin_mods/m.admin_users.tpl'}
    {elseif $tsAction == 'sesiones'}
    {include file='admin_mods/m.admin_sesiones.tpl'}
    {elseif $tsAction == 'nicks'}
    {include file='admin_mods/m.admin_nicks.tpl'}
    {elseif $tsAction == 'blacklist'}
    {include file='admin_mods/m.admin_blacklist.tpl'}
    {elseif $tsAction == 'badwords'}
    {include file='admin_mods/m.admin_badwords.tpl'}
    {elseif $tsAction == 'rangos'}
    {include file='admin_mods/m.admin_rangos.tpl'}
    {/if}</div>
                      </div></div></div>
</section>

{include file='sections/main_footer.tpl'}