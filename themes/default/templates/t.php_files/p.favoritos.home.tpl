{include file='sections/main_header.tpl'}
<script type="text/javascript" src="{$tsConfig.js}/favoritos.js"></script>
<script type="text/javascript">
	var favoritos_data = [{$tsFavoritos}];
</script>
<section class="content">
<div class="row">
<div class="col-md-12">
<div class="panel box box-primary">
                      <div class="box-header with-border">
                        <h4 class="box-title text-muted">
                          <span>
                                {if !$tsFavoritos}
    <p class="emptyData">No agregaste ningún post a favoritos todavía</p>{else}Mis Favoritos{/if}
    
                          </span>
                          
                        </h4>
                        
                        <div class="pull-right">
                        
                        <div class="input-group margin" style="width: 28%;float: right;margin-top: -23px;">
           <input style="wit" class="form-control" type="text" autocomplete="off" onblur="favoritos.search_blur()" onfocus="favoritos.search_focus()" onkeyup="favoritos.search(this.value, event)" value="" id="favoritos-search">
                    <span class="input-group-btn">
                      <button  class="btn btn-info btn-flat" type="button">Go!</button>
                    </span>
                 
                  </div>
                   
  </div>

                      </div>    <!--div class="categoriaList">
        <ul>
            <li id="cat_-1">
                <a href="" onclick="favoritos.active(this); favoritos.categoria = 'todas'; favoritos.query(); return false;">
                <strong>Categorías</strong>
                </a>
            </li>
        </ul></div--->
                      <div id="collapseOne" class="panel-collapse collapse in">
                        <div class="box-body">

    {if !$tsFavoritos}
    <p class="emptyData">No agregaste ningún post a favoritos todavía</p>
    {else}
     <div class="table-responsive">
      <div id="resultados">
                    <table class="table no-margin">
                      <thead>
                        <tr>
                          <th>Categoria</th>
                          <th>Titulo</th>
                          <th>Status</th>
                          <th>Fecha</th>
                           <th>Puntos</th>
                            <th>Comentarios</th>
                             <th>Borrar</th>
                        </tr>
                      </thead>
                      <tbody>
                       <tr>
                <th></th>
                <th style="text-align:left;width:350px;overflow:hidden;"><a href="" onclick="favoritos.active2(this); favoritos.orden = 'titulo'; favoritos.query(); return false;">Título</a></th>
                <th><a href="" onclick="favoritos.active2(this); favoritos.orden = 'fecha_creado'; favoritos.query(); return false;">Creado</a></th>
                <th><a href="" onclick="favoritos.active2(this); favoritos.orden = 'fecha_guardado'; favoritos.query(); return false;" class="here">Guardado</a></th>
                <th><a href="" onclick="favoritos.active2(this); favoritos.orden = 'puntos'; favoritos.query(); return false;">Puntos</a></th>
                <th><a href="" onclick="favoritos.active2(this); favoritos.orden = 'comentarios'; favoritos.query(); return false;">Comentarios</a></th>
                <th></th>
                </tr>
                      
                        
                      </tbody>
                    </table>
                  </div>

{/if}
                        </div>
                      </div>
                    </div></div></div></section>


{include file='sections/main_footer.tpl'}