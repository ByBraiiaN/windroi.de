{include file='sections/main_header.tpl'}
{foreach from=$tsConfig.news key=i item=n}
		<div class="callout callout-warning lead" id="new_{$i+1}">
		{$n.not_body}
		</div>
        {/foreach}	
				<script type="text/javascript" src="{$tsConfig.tema.t_url}/js/perfil.js"></script>
                <script type="text/javascript" src="{$tsConfig.js}/portal.js"></script>
                <section class="content">
<div class="row">
              <div class="col-md-8">
                  <div class="box box-success">
                  <div class="box-header with-border">
                  <h3 class="box-title">Publicar nuevo estado</h3>
                  <div class="box-tools pull-right">
                <span style="cursor:pointer;"> 

                  </div>
                </div>
                 <div class="box-body">              
    	{include file='modules/perfil/m.perfil_muro_form.tpl'}
     </div></div></div>
      <div class="col-md-4">
              <div class="box box-success">
                <div class="box-header with-border">
                  <h3 class="box-title">Publicidad</h3>               
                </div>
                <div class="box-body">
                  {include file="modules/global/m.global_ads_300.tpl"}
                  {foreach from=$tsConfig.news key=i item=n}
        <li id="new_{$i+1}">{$n.not_body}</li>
        {/foreach}
        
                </div>
              </div>
            </div>

<div class="col-md-12">
    <div id="portal_content">
		{include file='modules/portal/m.portal_noticias.tpl'}
	</div></div></div>
</section>
{include file='sections/main_footer.tpl'}