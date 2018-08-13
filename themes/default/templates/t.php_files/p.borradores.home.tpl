{include file='sections/main_header.tpl'}
<script type="text/javascript" src="{$tsConfig.js}/borradores.js"></script>
<section id="borradores" class="pageborradores">
	<script type="text/javascript">
		var borradores_data = [{$tsDrafts}];
	</script>

<div class="col-md-8">
	<div class="box box-info">
		<div class="box-header with-border">
		<h3 class="box-title">Posts</h3></div>			  
		<div class="box-body">    
		    
    <section class="resultBorrador">
            <div class="buscarBorradores">
            	<label for="borradores-search">Buscar</label><input class="form-control"type="text" id="borradores-search" value="" onKeyUp="borradores.search(this.value, event)" onFocus="borradores.search_focus()" onBlur="borradores.search_blur()" autocomplete="off" />
            </div>

        <div id="res" class="boxy-content">
            {if $tsDrafts}
            <ul id="resultados-borradores"></ul>
            {else}
            <p class="emptyData">No tienes ningún borrador ni post eliminado.</p>
            {/if}
        </div>
        <div id="template-result-borrador" style="display:none">
            <li id="borrador_id___id__">
                <a class="tituloBorrador" title="__categoria_name__" class="categoriaPost __categoria__ __tipo__" href="__url__" onclick="__onclick__">
                    <h3><img src="{$tsConfig.tema.t_url}/images/icons/cat/__imagen__" /> __titulo__</h3>
                </a>
                <span>Causa: __causa__</span><br/>
                <span>Última vez guardado el __fecha_guardado__</span> 
                <a class="eliminarBorrador" style="color:red;font-size:14px;" href="" onclick="borradores.eliminar(__borrador_id__, true); return false;">Borrar</a>
                
            </li>
        </div>
    </section>
</div></div></div>

<div class="col-md-4">
     <div class="box box-success">
       <div class="box-header with-border">
            <h3 class="box-title">Filtrar</h3>
            </div>
            
		<ul class="cat-list" id="borradores-filtros">
        	<h4>Mostrar</h4>
			<li id="todos" class="active"><span class="cat-title"><a href="" onclick="borradores.active(this); borradores.filtro = 'todos'; borradores.query(); return false;">Todos</a></span> <span class="count"></span></li>
			<li id="borradores"><span class="cat-title"><a href="" onclick="borradores.active(this); borradores.filtro = 'borradores'; borradores.query(); return false;">Borradores</a></span> <span class="count"></span></li>
			<li id="eliminados"><span class="cat-title"><a href="" onclick="borradores.active(this); borradores.filtro = 'eliminados'; borradores.query(); return false;">Eliminados</a></span> <span class="count"></span></li>
		</ul>
		<ul id="borradores-orden" class="cat-list">
    	    <h4>Ordenar por</h4>
			<li class="active"><span><a href="" onclick="borradores.active(this); borradores.orden = 'fecha_guardado'; borradores.query(); return false;">Fecha guardado</a></span></li>
			<li><span><a href="" onclick="borradores.active(this); borradores.orden = 'titulo'; borradores.query(); return false;">T&iacute;tulo</a></span></li>
			<li><span><a href="" onclick="borradores.active(this); borradores.orden = 'categoria'; borradores.query(); return false;">Categor&iacute;a</a></span></li>
		</ul>
		<ul class="cat-list" id="borradores-categorias">
        	<h4>Categorias</h4>
			<li id="todas" class="active"><span class="cat-title active"><a href="" onclick="borradores.active(this); borradores.categoria = 'todas'; borradores.query(); return false;">Ver todas</a></span> <span class="count"></span></li>
		</ul>
		
	</div>
</div>
{include file='sections/main_footer.tpl'}