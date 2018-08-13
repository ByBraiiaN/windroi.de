<aside>
<div class="box box-success">
	<div class="box-header with-border">
		<h3 class="box-title">Comunidades</h3>
		<div class="box-tools pull-right">
		<span style="cursor:pointer;" title="Tiene {$tsGeneral.comus_total} Comunidades" class=" badge bg-green qtip">{$tsGeneral.comus_total}</span>
		<button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
		</div></div>	
		<div class="box-body" style="display: block;">
		{if $tsGeneral.comus}
        {foreach from=$tsGeneral.comus item=c}
		<a href="{$tsConfig.url}/comunidades/{$c.c_nombre_corto}/" class="qtip" title="{$c.c_nombre}">
		<img src="{$tsConfig.url}/files/uploads/c_{$c.c_id}.jpg" width="50" height="50"/></a>
        <a href="{$tsConfig.url}/comunidades/{$c.c_nombre_corto}/" style="color:#006595;font-weight:bold;font-size:15px;">{$c.c_nombre}</a>
        <p style="display: block;font-size: 11px;color: #999;">{$c.c_miembros} Miembros</p>
        {/foreach}
        {else}
        <p class="emptyData">No participa en ninguna comunidad</p>
        {/if}
		{if $tsGeneral.m_total >= 5}
        <a href="#comunidades" onclick="perfil.load_tab('comunidades', $('#comunidades'));" class="boton">Ver más &raquo;</a>
        {/if}       	
	</div>
</div>

 {if $tsInfo.can_hits}
	<div class="box box-success">
                <div class="box-header with-border">
                  <h3 class="box-title">Últimas visitas</h3>
                  
                  <div class="box-tools pull-right">
                   <span style="cursor:pointer;" title=" {$tsInfo.visitas_total} visitas" class="badge bg-green qtip">{$tsInfo.visitas_total}</span>
                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                  </div>
                </div>>
                <div class="box-body" style="display: block;">
                	{if $tsInfo.visitas}
                    	{foreach from=$tsInfo.visitas item=v}
                
                 	<a href="{$tsConfig.url}/perfil/{$v.user_name}" class="qtip" title="{$s.user_name}">
            	<img src="{$tsConfig.url}/files/avatar/{$v.user_id}_50.jpg" class="vctip" title="{$v.date|hace:true}" width="32" height="32"/></a>
                	{/foreach}
                    {else}
		<div class="emptyData">No tiene visitas</div>
		{/if}
                </div>
              </div>	{/if}
              
              
              <div class="box box-success">
                <div class="box-header with-border">
                  <h3 class="box-title">Medallas</h3>
                  <div class="box-tools pull-right">
                  <span style="cursor:pointer;" title="Tiene {$tsGeneral.m_total} Medallas" class="badge bg-green qtip">{$tsGeneral.m_total}</span>
                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                  </div>
                </div>
                 <div class="box-body" style="display: block;">	
                {if $tsGeneral.m_total}
                {foreach from=$tsGeneral.medallas item=m}
               
                  <img src="{$tsConfig.tema.t_url}/images/icons/med/{$m.m_image}_32.png" class="qtip" title="{$m.m_title} - {$m.m_description}"/>
                  {/foreach}
                  {else}
		<p class="emptyData">No tiene medallas</p>
	
               {/if}
               	{if $tsGeneral.m_total >= 21}
        <a href="#medallas" onclick="perfil.load_tab('medallas', $('#medallas'));" class="see-more">Ver más &raquo;</a>{/if}
        
                  </div>
              </div>
              
           
         <div class="box box-success">
                <div class="box-header with-border">
                  <h3 class="box-title">Seguidores</h3>
                  <div class="box-tools pull-right">
                  <span style="cursor:pointer;" title="Tiene {$tsInfo.stats.user_seguidores} Seguidores" class=" badge bg-green qtip">{$tsInfo.stats.user_seguidores}</span>
                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                  </div>
                </div>
                 <div class="box-body" style="display: block;">	
              	{if $tsGeneral.segs.data}
              	{foreach from=$tsGeneral.segs.data item=s}
               <a href="{$tsConfig.url}/perfil/{$s.user_name}" class="qtip" title="{$s.user_name}">
                <img src="{$tsConfig.url}/files/avatar/{$s.user_id}_50.jpg"/></a>
                  {/foreach}
               {else}
		<p class="emptyData">No tiene seguidores</p>
		{/if}
               	{if $tsGeneral.m_total >= 21}
        <a href="#seguidores" onclick="perfil.load_tab('seguidores', $('#seguidores'));" class="boton">Ver más &raquo;</a>
        {/if}       	
                  </div>
              </div>
              
                  <div class="box box-success">
                <div class="box-header with-border">
                  <h3 class="box-title">Siguiendo</h3>
                  <div class="box-tools pull-right">
                  <span style="cursor:pointer;" title="Tengo {$tsGeneral.sigd.total} Amigos" class="badge bg-green qtip">{$tsGeneral.sigd.total}</span>
                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                  </div><!-- /.box-tools -->
                </div><!-- /.box-header -->
                 <div class="box-body" style="display: block;">	
              	{if $tsGeneral.sigd.data}
              			{foreach from=$tsGeneral.sigd.data item=s}
        <a href="{$tsConfig.url}/perfil/{$s.user_name}" class="qtip" title="{$s.user_name}">
                <img src="{$tsConfig.url}/files/avatar/{$s.user_id}_50.jpg"/></a>
                  {/foreach}
              {else}
		<p class="emptyData">No sigue usuarios</p>
		{/if}
               	{if $tsGeneral.m_total >= 21}
       <a href="#siguiendo" onclick="perfil.load_tab('siguiendo', $('#siguiendo'));" class="boton">Ver más &raquo;</a>
        {/if}
        	
                  </div>
                <!-- /.box-body -->
              </div>
     
</aside>