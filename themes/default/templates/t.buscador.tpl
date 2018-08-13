{include file='sections/main_header.tpl'}
        {literal}
<script type="text/javascript">
        var buscador = {
            // {/literal}
        	tipo: '{if !$tsEngine}web{$tsEngine}{/if}',
            // {literal}
        	select: function(tipo){
        		if(this.tipo==tipo)
        			return;
        		//Cambio de action form
        		//$('form[name="buscador"]').attr('action', '?e='+tipo+'');
                $('input[name="e"]').val(tipo);
        
        		//Solo hago los cambios visuales si no envia consulta
        		if(!this.buscadorLite){
        			//Cambio here en <a />
        			$('a#select_' + this.tipo).removeClass('here');
        			$('a#select_' + tipo).addClass('here');
        
        			//Cambio de logo
        			$('img#buscador-logo-'+this.tipo).css('display', 'none');
        			$('img#buscador-logo-'+tipo).css('display', 'inline');
        		}
        		//Muestro/oculto los input google
        		if(tipo=='google'){ 
                    //Ahora es google {/literal}
        			$('form[name="buscador"]').append('<input type="hidden" name="cx" value="{$tsConfig.ads_search}" /><input type="hidden" name="cof" value="FORID:10" /><input type="hidden" name="ie" value="ISO-8859-1" />');
                    // {literal}
        		}else if(this.tipo=='google'){ //El anterior fue google
        			$('input[name="cx"]').remove();
        			$('input[name="cof"]').remove();
        			$('input[name="ie"]').remove();
        		}
        		this.tipo = tipo;
        	}
        }
</script>
{/literal}
<section class="content">
<div class="row">
{if $tsQuery || $tsAutor}
<div class="col-md-8">

<div class="panel box box-primary">
                      <div class="box-header with-border">
                        <h4 class="box-title" style="font-size: 14px;">
                          <a>
                           <nav>
            <a href="javascript:buscador.select('google')" id="select_google"{if $tsEngine == 'google'} class="here"{/if}>Google</a>
            <a  href="javascript:buscador.select('web')" id="select_web"{if !$tsEngine || $tsEngine == 'web'} class="here text-green"{/if}>{$tsConfig.titulo}</a>
            <a href="javascript:buscador.select('tags')" id="select_tags">Tags</a>
        </nav>
                          </a>
                        </h4>
                      </div>
                      <div id="collapseOne" class="panel-collapse collapse in">
                        <div class="box-body">
                      <section class="buscador">
    <form action="" method="GET" name="buscador">
        <img{if $tsEngine != 'google'} style="display: none;"{/if} alt="google-search-engine" src="http://www.google.com/images/poweredby_transparent/poweredby_FFFFFF.gif" id="buscador-logo-google"/>

      <div class="input-group input-group-sm">
        <input type="text" value="{$tsQuery}" class="form-control" name="q"/>
         <span class="input-group-btn">
        <input type="submit" title="Buscar" value="Buscar" class="boton btn btn-info btn-flat"/> </span>
        <input type="hidden" name="e" value="{$tsEngine}" />
        {if $tsEngine == 'google'}
        <input type="hidden" name="cx" value="{$tsConfig.ads_search}" />
        <input type="hidden" name="cof" value="FORID:10" /><input type="hidden" name="ie" value="ISO-8859-1" />
        {/if} </div>
              
        <div class="form-group">
                     
                      <select name="cat" class="form-control">
                        <option value="-1">Todas</option>
                          {foreach from=$tsConfig.categorias item=c}
             <option value="{$c.cid}">{$c.c_nombre}</option>
            {/foreach}
                      </select>
                    </div>
        
        <div class="input-group">
                    <div class="input-group-btn">
                      <button type="button" class="btn btn-danger">Usuario</button>
                    </div>
                    <input  class="form-control" type="text" name="autor" value="{$tsAutor}"/>
                  </div>

    </form>
</section>
                        </div>
                      </div>
                    </div>
</div>
<div class="col-md-4"><div class="panel box box-primary">
                      <div class="box-header with-border">
                        <h4 class="box-title">
                          <a>
                         Publicidad
                          </a>
                        </h4>
                      </div>
                      <div id="collapseOne" class="panel-collapse collapse in">
                        <div class="box-body">
                         Publicidad n.n
                        </div>
                      </div>
                    </div></div>
    {if $tsEngine == 'google'}
    <div id="cse-search-results"></div>
    <div class="col-md-12">
  <div class="box box-info">
    <script>
  (function() {literal}{{/literal}
    var cx = '012427337489063897731:onehvg_uws4';
    var gcse = document.createElement('script');
    gcse.type = 'text/javascript';
    gcse.async = true;
    gcse.src = 'https://cse.google.com/cse.js?cx=' + cx;
    var s = document.getElementsByTagName('script')[0];
    s.parentNode.insertBefore(gcse, s);
  {literal}}{/literal})();
</script>
<gcse:search></gcse:search>
</div></div>
  
    {else}
      <div class="col-md-12">
  <div class="box box-info">
                <div class="box-header with-border">
                  <h3 style="font-size: 14px;" class="box-title text-muted"><p>Mostrando <strong>{$tsResults.total}</strong> de <strong>{$tsResults.pages.total}</strong> resultados totales</p></h3>
                  <div class="box-tools pull-right">
                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                  </div>
                </div>
                <div class="box-body">
                  <div class="table-responsive">
                    <table class="table no-margin">
                      <thead>
                        <tr>
                          <th>Post</th>
                          <th>Categoria</th>
                          <th>Información</th>
                        </tr>
                      </thead>
                      <tbody>
                      
                          {foreach from=$tsResults.data item=r}
                        <tr id="div_{$r.post_id}">
                          <td><a class="qtip" title="{$r.post_title}" href="{$tsConfig.url}/posts/{$r.c_seo}/{$r.post_id}/{$r.post_title|seo}.html">{$r.post_title|truncate:40}</a></td>
                          <td><span class="label label-success">{$r.c_seo}</span></td>
                          <td style="width: 41%;">    
                      <div class="sparkbar" data-color="#00a65a" data-height="20">   
                      
                      <li class="dataPostBuscador"><img alt="Creado hace" src="{$tsConfig.tema.t_url}/images/icons/clock.png"/> {$r.post_date|hace:true}</strong></li>
        
        <li class="dataPostBuscador"><img alt="0 puntos" src="{$tsConfig.tema.t_url}/images/icons/puntos.png"/> Puntos {$r.post_puntos}</li>
        
        <li class="dataPostBuscador"><img alt="0 puntos" src="{$tsConfig.tema.t_url}/images/icons/favoritos.gif"/> {$r.post_favoritos} Favoritos</li>
        
        <li class="dataPostBuscador"><img alt="0 puntos" src="{$tsConfig.tema.t_url}/images/icons/comentarios.gif"/> {$r.post_comments} Comentarios</li></div></td>
                        </tr>  {/foreach}
                      </tbody>
                    </table>
                  </div>
                </div>
                <div class="box-footer clearfix">
                  
                </div>
              </div>
    
    
<section id="resultados" class="resultBuscador">

  
	{if $tsResults.pages.prev != 0}
		<a class="boton" href="{$tsConfig.url}/buscador/?page={$tsResults.pages.prev}{if $tsQuery}&q={$tsQuery}{/if}{if $tsEngine}&e={$tsEngine}{/if}{if $tsCategory}&cat={$tsCategory}{/if}{if $tsAutor}&autor={$tsAutor}{/if}">&laquo; Anterior</a>
	{/if}
	{if $tsResults.pages.next != 0}
		<a class="boton" href="{$tsConfig.url}/buscador/?page={$tsResults.pages.next}{if $tsQuery}&q={$tsQuery}{/if}{if $tsEngine}&e={$tsEngine}{/if}{if $tsCategory}&cat={$tsCategory}{/if}{if $tsAutor}&autor={$tsAutor}{/if}">Siguiente &raquo;</a>
	{/if}
</section></div>
    {/if}
    {else}
    <div class="col-md-8">

<div class="panel box box-primary">
                      <div class="box-header with-border">
                        <h4 class="box-title" style="font-size: 14px;">
                          <a>
                          <nav>
            <a href="javascript:buscador.select('google')" id="select_google">Google</a>
            <a href="javascript:buscador.select('web')" id="select_web" class="here text-green">{$tsConfig.titulo}</a>
            <a href="javascript:buscador.select('tags')" id="select_tags">Tags</a>
        </nav>
                          </a>
                        </h4>
                      </div>
<section class="buscador" style="border: 0px;">
    <form action="" method="GET" name="buscador">
        <img style="height: 16px; display: none;" alt="google-search-engine" src="http://www.google.com/images/poweredby_transparent/poweredby_FFFFFF.gif" id="buscador-logo-google"/>
        
      
        
       <div class="input-group input-group-sm">
        <input type="text" value="{$tsQuery}" class="form-control" name="q"/>
         <span class="input-group-btn">
        <input type="submit" title="Buscar" value="Buscar" class="boton btn btn-info btn-flat"/> </span>
        <input type="hidden" name="e" value="web" /></div>
        
        
        <div class="form-group">
                     
                      <select name="cat" class="form-control">
                        <option value="-1">Todas</option>
                         {foreach from=$tsConfig.categorias item=c}
            <option value="{$c.cid}">{$c.c_nombre}</option>
            {/foreach}
                      </select>
                    </div>
                    
                      <div class="input-group">
                    <div class="input-group-btn">
                      <button type="button" class="btn btn-danger">Usuario</button>
                    </div>
                    <input  class="form-control" type="text" name="autor" value="{$tsAutor}"/>
                  </div><br />
        
    </form>
</section></div></div>
<div class="col-md-4"><div class="panel box box-primary">
                      <div class="box-header with-border">
                        <h4 class="box-title">
                          <a>
                            Anuncio
                          </a>
                        </h4>
                      </div>
                      <div id="collapseOne" class="panel-collapse collapse in">
                        <div class="box-body">
                         Publicidad n.n
                        </div>
                      </div>
                    </div></div>
{/if}</div></section>
{include file='sections/main_footer.tpl'}