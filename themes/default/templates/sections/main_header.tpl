<!DOCTYPE html>
<html lang="es" xml:lang="es">
    <head>
    <meta charset="utf-8">
    <meta content='es' name='language'/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <meta name="description" content="{if $tsPost.post_id}{$tsPost.post_desc|truncate:155}{else}{$tsConfig.descripcion}{/if}">
    <meta property="og:image" content="{if $tsPost.post_id}{$tsPost.post_imgport}{else}https://lh3.googleusercontent.com/-j6pbdKRUS.png{/if}">
    <meta property="og:title" content="{if $tsPost.post_id}{$tsPost.post_title}{else}{$tsTitle}{/if}">
    <meta property="og:description" content="{if $tsPost.post_id}{$tsPost.post_desc|truncate:155|replace:"\r\n":""}{else}{$tsConfig.descripcion}{/if}">
    <meta property="og:locale" content="es_ES" />
    <meta name="twitter:site" content="@fgfgfgf"/>
    <meta property="article:publisher" content="https://www.facebook.com/wiindroide/"/>
    <title>{$tsTitle}</title>
    <meta name="keywords" content="{foreach from=$tsPost.post_tags key=i item=tag}{$tag}{if $i < $tsPost.n_tags}{/if},{/foreach}abc, asd, qwe, dfg">
    <meta content='7 days' name='Revisit-After'/>
    <meta content='all' name='robots'/>
    <link rel="stylesheet" type="text/css" href="{$tsConfig.css}/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="{$tsConfig.css}/adminLTE.css">
    <link rel="stylesheet" type="text/css" href="{$tsConfig.css}/_all-skins.css">
    <!-- AGREGAMOS UN ESTILO EXTRA SI EXISTE -->
    <link rel="stylesheet" type="text/css" href="{$tsConfig.css}/font-awesome.css">
    <link rel="shortcut icon" href="{$tsConfig.images}/favicon.ico" type="image/x-icon" /> 
    <script src="{$tsConfig.js}/jquery-3.0.0.js"></script> 
    <script src="{$tsConfig.js}/bootstrap.min.js"></script>
    <script src="{$tsConfig.js}/jquery-migrate-3.0.0.js"></script>
    <script src="{$tsConfig.js}/jquery.min.js"></script>
    <script src="{$tsConfig.js}/app.js?010620171706"></script>
    <script src="{$tsConfig.js}/jquery.plugins.js"></script>
	<script src="{$tsConfig.js}/funciones.js"></script>
	<script src="{$tsConfig.js}/jquery.lazyload.min.js"></script>
    <script src="{$tsConfig.js}/acciones.js"></script>

    {if $tsUser->is_admod || $tsUser->permisos.moacp || $tsUser->permisos.most || $tsUser->permisos.moayca || $tsUser->permisos.mosu || $tsUser->permisos.modu || $tsUser->permisos.moep || $tsUser->permisos.moop || $tsUser->permisos.moedcopo || $tsUser->permisos.moaydcp || $tsUser->permisos.moecp}
    <script src="{$tsConfig.js}/moderacion.js"></script>
    {/if}
    {if $tsConfig.c_allow_live}
    <script src="{$tsConfig.js}/live.js"></script>
    {/if}
<script type="text/javascript"> 
    {literal}
    var global_data={
    {/literal}
        user_key:'{$tsUser->uid}',
        postid:'{$tsPost.post_id}',
        img:'{$tsConfig.tema.t_url}/',
        url:'{$tsConfig.url}',
        domain:'{$tsConfig.domain}',
        s_title: '{$tsConfig.titulo}',
        s_slogan: '{$tsConfig.slogan}'
     {literal}
    };
    {/literal} {literal}
    $(document).ready(function(){
     {/literal}
    {if $tsPage == '' || $tsPage == 'blog' }
{literal}
$("img.LL").lazyload({
effect : "fadeIn"
});
{/literal}
{/if}
        {if $tsNots > 0} 
        notifica.popup({$tsNots});
        {/if}
        {if $tsMPs > 0 &&  $tsAction != 'leer'}
        mensaje.popup({$tsMPs});
        {/if}
     {literal}
    });
     {/literal}
</script>
{literal}
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-97407728-1', 'auto');
  ga('send', 'pageview');

</script>
{/literal}
    </head>
    <body class="skin-blue sidebar-mini fixed">
    {if $tsUser->is_admod == 1}{$tsConfig.install}{/if}
    <div id="swf"></div>
    <div id="js" style="display:none"></div>
    <div id="mask"></div>
    <div id="mydialog"></div>
    <div class="UIBeeper" id="BeeperBox"></div>
      <div class="wrapper">
	 <header class="main-header">
        <a href="{$tsConfig.url}" class="logo">
          <span class="logo-mini"><b>WD</b></span>
          <span class="logo-lg"><b>WIN</b>DROIDE</span>
        </a>
       {include file="sections/nav.tpl"} 
      </header>
      <nav class="main-sidebar">
        {include file="sections/nav-menu.tpl"}     
      </nav>
       <div class="content-wrapper">