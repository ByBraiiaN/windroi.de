{include file='sections/main_header.tpl'}
                <script type="text/javascript" src="{$tsConfig.tema.t_url}/js/perfil.js"></script>
                <section class="content">
                <div class="row">
               <div class="col-md-8">
		{include file='modules/perfil/m.perfil_headinfo.tpl'}</div>
                <div class="col-md-4">
              <div class="box box-success">
                <div class="box-header with-border">
                  <h3 class="box-title">Publicidad</h3>
                  <div class="box-tools pull-right">
                    <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                  </div><!-- /.box-tools -->
                </div><!-- /.box-header -->
                <div class="box-body">
                  Nada por aqu&#237;
                </div><!-- /.box-body -->
              </div><!-- /.box -->
            </div>
                 <div class="col-md-8">
                  <div class="box box-success">
                  <div class="box-header with-border">
                  <div class="pull-left"> <span>
			{if $tsType == 'news' || $tsType == 'story'}
		<a class="mpb" href="#" onclick="perfil.load_tab('news', this); return false">{if $tsType == 'story'}Publicaci&#243;n{else}Noticias{/if}</a> | 
			{/if}
	 | 	<a class="mpb" href="#" onclick="perfil.load_tab('wall', this); return false">Muro</a> | 
			<a class="mpb" href="#" onclick="perfil.load_tab('actividad', this); return false" id="actividad">Actividad</a> | 
			<a class="mpb" href="#" onclick="perfil.load_tab('info', this); return false" id="informacion">Informaci&oacute;n</a> | 
			<a class="mpb" href="#" onclick="perfil.load_tab('posts', this); return false">Posts</a> | 
			<a class="mpb" href="#" onclick="perfil.load_tab('seguidores', this); return false" id="seguidores">Seguidores</a> | 
			<a class="mpb" href="#" onclick="perfil.load_tab('siguiendo', this); return false" id="siguiendo">Siguiendo</a> | 
			<a class="mpb" href="#" onclick="perfil.load_tab('medallas', this); return false">Medallas</a> | 
            
			
		

	</span></div>
                  <div class="box-tools pull-right">
                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                  </div><!-- /.box-tools -->
                </div><!-- /.box-header -->
                 <div class="box-body">
                 {if $tsPrivacidad.mf.v == true}
    	{include file='modules/perfil/m.perfil_muro_form.tpl'}
    {else}
    	<p class="emptyData">{$tsPrivacidad.mf.m}</p>
    {/if}  </div><!-- /.box-body --> </div></div>
    <div class="col-md-4">
              <div class="box box-success">
                <div class="box-header with-border">
                  <h3 class="box-title">Redes Sociales</h3>
                  <div class="box-tools pull-right">
                    <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                  </div><!-- /.box-tools -->
                </div><!-- /.box-header -->
                <div class="box-body">
                 {if $tsInfo.p_socials.f}
			
				<a  class="qtip" target="_blank" href="http://www.facebook.com/{$tsInfo.p_socials.f}" title="Facebook"><span class="circle facebook"><i class="fa fa-facebook"></i></span></a> 

			{/if}
			{if $tsInfo.p_socials.t}
			
				<a class="qtip" target="_blank" href="http://www.twitter.com/{$tsInfo.p_socials.t}" title="Twitter"><span class="circle twitter"><i class="fa fa-twitter"></i></span></a> 
            
			{/if}
            
            
            	{if $tsUser->is_admod == 1}
			
				<a  class="qtip" title="Editar cuenta"href="#" onclick="location.href = '{$tsConfig.url}/admin/users?act=show&amp;uid={$tsInfo.uid}'"><span class="circle edit-c"><i class="fa fa-pencil"></i></span></a>  

			{/if}
            
            
            {if $tsUser->uid != $tsInfo.uid}
				{if $tsUser->is_member}
				<a class="qtip" href="#" title="Envia un mensaje" onclick="mensaje.nuevo('{$tsInfo.nick}','','',''); return false"><span class="circle envelope"><i class="fa fa-envelope-o"></i></span></a>  
				{/if}
		
			{/if}
                </div><!-- /.box-body -->
              </div><!-- /.box -->
            </div>
    
    
                        <div id="info" pid="{$tsInfo.uid}"></div>
                        <div class="col-md-8">
                        <section id="perfil_content" class="perfilContent">
                            {if $tsPrivacidad.m.v == false}
                            <div id="perfil_wall" status="activo" class="widget">
                                <div class="emptyData">{$tsPrivacidad.m.m}</div>
                                <script type="text/javascript">
                                    perfil.load_tab('info', $('#informacion'));
                                </script>
                            </div>
                            
                            {elseif $tsType == 'story'}
                            {include file='modules/perfil/m.perfil_story.tpl'}
                            {elseif $tsType == 'news'}
                            {include file='modules/perfil/m.perfil_noticias.tpl'}
                            {else}
                            {include file='modules/perfil/m.perfil_muro.tpl'}
                            {/if}
                            <div class="loading2" id="perfil_load">
                        		<img src="{$tsConfig.images}/fb-loading.gif" />
                        	</div>
                        </section></div>
                        <div class="col-md-4">
                    {include file='modules/perfil/m.perfil_sidebar.tpl'} </div></div></section>              
{include file='sections/main_footer.tpl'}