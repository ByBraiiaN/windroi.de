<div class="box box-warning">
            <div class="box-header with-border">
              <h3 class="box-title">Seleccionar orden</h3>

              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
              </div>
              <!-- /.box-tools -->
            </div>
            <!-- /.box-header -->
            <div class="box-body" style="">
			     

    	<li {if $tsMisComus.orden == 'nombre'}class="active"{/if}><a href="{$tsConfig.url}/comunidades/mis-comunidades/nombre">Nombre</a></li>

        <li {if $tsMisComus.orden == 'rango'}class="active"{/if}><a href="{$tsConfig.url}/comunidades/mis-comunidades/rango">Rango</a></li>

        <li {if $tsMisComus.orden == 'miembros'}class="active"{/if}><a href="{$tsConfig.url}/comunidades/mis-comunidades/miembros">Miembros</a></li>

        <li {if $tsMisComus.orden == 'temas'}class="active"{/if}><a href="{$tsConfig.url}/comunidades/mis-comunidades/temas">Temas</a></li>

        <li {if $tsMisComus.orden == 'fecha'}class="active"{/if}><a href="{$tsConfig.url}/comunidades/mis-comunidades/fecha">Fecha</a></li>

            </div>
            <!-- /.box-body -->
          </div>
