

{if $tsCom.c_estado == 1}<div class="alert alert-danger">La comunidad est&aacute; suspendida, para eliminarla permanentemente ve a la administraci&oacute;n</div>{/if}







    
    
    <div class="box box-primary ">
        {if $tsAction == 'tema'}<div class="box-body"> 
                    <div class="pull-left">
              <a class="pull-left" href="{$tsConfig.url}/comunidades/{$tsCom.c_nombre_corto}/"><img class="img-circle" src="{$tsConfig.url}/files/uploads/c_{$tsCom.c_id}.jpg" alt="Imagen de la comunidad" /></a>
<div class="pull-right" style="margin-left:5px;">
               <a class="" href="{$tsConfig.url}/comunidades/{$tsCom.c_nombre_corto}/"><h3 title="Nombre">{$tsCom.c_nombre}</h3></a>
               <a class="" href="{$tsConfig.url}/comunidades/{$tsCom.c_nombre_corto}/"><h5 title="Nombre corto">@{$tsCom.c_nombre_corto}</h5></a>

              <p  class="" class="text-muted">{$tsCom.c_descripcion}</p></div></div>
<div class=" pull-right">
              <ul class="list-group list-group-unbordered">
                <li class="list-group-item">
                  <b>Miembros</b></b> <a class="pull-right" href="{$tsConfig.url}/comunidades/{$tsCom.c_nombre_corto}/miembros/">{$tsCom.c_miembros|number_format:0:',':'.'}</a>
                </li>
                <li class="list-group-item">
                  <b>Temas</b> <a class="pull-right">{$tsCom.c_temas|number_format:0:',':'.'}</a>
                </li>
                <li class="list-group-item">
                  <b>Seguidores</b> <a class="pull-right">{$tsCom.c_seguidores|number_format:0:',':'.'}</a>
                </li>
              </ul></div>
                           {if $tsUser->is_member}<a href="javascript:{if $tsUser->is_member}com.unirme(){else}registro_load_form(){/if};" class="action_comunidad btn btn-primary btn-block pull-right" style="{if $tsCom.es_miembro}display:none;{/if}">Unirme</a>
              <a href="javascript:com.abandonar();" class="action_comunidad btn btn-primary btn-block pull-right" style="{if !$tsCom.es_miembro}display:none;{/if}">Abandonar</a>{/if}
        {else}           <div class="box-body text-center">
              <a href="{$tsConfig.url}/comunidades/{$tsCom.c_nombre_corto}/"><img class="img-circle" src="{$tsConfig.url}/files/uploads/c_{$tsCom.c_id}.jpg" alt="Imagen de la comunidad" /></a>

               <a href="{$tsConfig.url}/comunidades/{$tsCom.c_nombre_corto}/"><h3 title="Nombre">{$tsCom.c_nombre}</h3></a>
               <a href="{$tsConfig.url}/comunidades/{$tsCom.c_nombre_corto}/"><h5 title="Nombre corto">@{$tsCom.c_nombre_corto}</h5></a>

              <p class="text-muted">{$tsCom.c_descripcion}</p>

              <ul class="list-group list-group-unbordered">
                <li class="list-group-item">
                  <b>Miembros</b></b> <a class="pull-right" href="{$tsConfig.url}/comunidades/{$tsCom.c_nombre_corto}/miembros/">{$tsCom.c_miembros|number_format:0:',':'.'}</a>
                </li>
                <li class="list-group-item">
                  <b>Temas</b> <a class="pull-right">{$tsCom.c_temas|number_format:0:',':'.'}</a>
                </li>
                <li class="list-group-item">
                  <b>Seguidores</b> <a class="pull-right">{$tsCom.c_seguidores|number_format:0:',':'.'}</a>
                </li>
              </ul>
                       {if $tsUser->is_member}<a href="javascript:{if $tsUser->is_member}com.unirme(){else}registro_load_form(){/if};" class="action_comunidad btn btn-primary btn-block" style="{if $tsCom.es_miembro}display:none;{/if}">Unirme</a>
              <a href="javascript:com.abandonar();" class="action_comunidad btn btn-primary btn-block" style="{if !$tsCom.es_miembro}display:none;{/if}">Abandonar</a>{/if}       
              {/if}

            </div>
            <!-- /.box-body -->
          </div>
 
 <div class="box box-primary collapsed-box">
            <div class="box-header with-border">
              <h3 class="box-title">Detalles de la comunidad</h3><div class="box-tools pull-right"> <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i> </button> </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body" style="display: none;">

        		<strong>Categor&iacute;a:</strong> <a href="{$tsConfig.url}/comunidades/home/{$tsCom.cat.c_seo}/">{$tsCom.cat.c_nombre}</a> &raquo; {$tsCom.cat.s_nombre}<br/>

                <strong>Creado:</strong> por <a href="{$tsConfig.url}/perfil/{$tsCom.user_name}/">{$tsCom.user_name}</a> {$tsCom.c_fecha|hace}<br/>

                <strong>Tipo:</strong> {if $tsCom.c_acceso == 1}Todos pueden ver la comunidad{else}S&oacute;lo usuarios registrados pueden ver la comunidad.{/if}<br/>

                <strong>Tipo de validaci&oacute;n:</strong> Los nuevos miembros son aceptados automaticamente con el rango <strong>{if $tsCom.c_permisos == 1}Visitante{elseif $tsCom.c_permisos == 2}Comentador{else}Posteador{/if}</strong>

            </div>
            <!-- /.box-body -->
          </div>   
    
    