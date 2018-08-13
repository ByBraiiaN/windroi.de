<div class="box box-warning">
                <div class="box-header with-border">
              <h3 class="box-title">Seleccionar vista</h3>
            </div>
    <div class="box-body">    	<a id="miembros" class="active btn btn-primary" href="javascript:com.load_members('miembros');">Miembros</a>

        <a id="suspendidos" class="btn btn-danger" href="javascript:com.load_members('suspendidos');">Suspendidos</a></div>
</div>


<div class="box box-warning">
                <div class="box-header with-border">
              <h3 class="box-title">Buscador de miembros</h3>
            </div>
    <div class="box-body">
<input type="text" class="form-control" id="search_member" />
<input type="button" value="Buscar" class="btn btn-primary ibg" onclick="com.search_member();"/></div>
</div>




<div class="box box-success">
            <div class="box-header with-border">
              <h3 class="box-title">Miembros de {$tsCom.c_nombre}</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">





	<div id="com_members_result">{include file='t.comus_ajax/c.com_members.tpl'}</div>

            </div>
            <!-- /.box-body -->
          </div>
		  


