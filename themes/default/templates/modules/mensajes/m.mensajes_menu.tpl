              <a href="#"  onclick="mensaje.nuevo('','','',''); return false;" class="btn btn-primary btn-block margin-bottom">Redactar</a>
              <div class="box box-solid">
                <div class="box-header with-border">
                  <h3 class="box-title">Carpetas</h3>
                  <div class="box-tools">
                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                  </div>
                </div>
                <div class="box-body no-padding">
                  <ul class="nav nav-pills nav-stacked">
                    <li {if $tsAction == ''}class="active"{/if}><a href="{$tsConfig.url}/mensajes/"><i class="fa fa-inbox"></i> Recibidos </a></li>
                    <li {if $tsAction == 'enviados'}class="active"{/if}><a href="{$tsConfig.url}/mensajes/enviados/"><i class="fa fa-envelope-o"></i> Enviados</a></li>
                    <li {if $tsAction == 'respondidos'}class="active"{/if}><a href="{$tsConfig.url}/mensajes/respondidos/"><i class="fa fa-file-text-o"></i> Respondidos</a></li>
                    	{if $tsAction == 'search'}
			<li><span class="cat-title"><a href="#">Resultados de búqueda</a></span></li>{/if} 
                    <li><a href="#"  onclick="mensaje.nuevo('','','',''); return false;"><i class="fa fa-filter"></i> Nuevo Mensaje </a></li>
                    <li {if $tsAction == 'avisos'} class="active"{/if}><a href="{$tsConfig.url}/mensajes/avisos/"><i class="fa fa-bell-o"></i> Avisos / Alertas <span class="label label-waring pull-right">{$tsAvisos}</span></a></li>
                  </ul>
                </div><!-- /.box-body -->
              </div><!-- /. box -->

                    