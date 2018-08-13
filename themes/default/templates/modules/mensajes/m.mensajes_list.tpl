{if $tsMensajes.data}
<div class="box box-primary">
                <div class="box-header with-border">
                  <h3 class="box-title">Inbox</h3>
                  <div class="box-tools pull-right">
                    <div class="has-feedback">
                    <form method="get" action="{$tsConfig.url}/mensajes/search/">
                      <input type="text" class="form-control input-sm" placeholder="Search Mail" value="{$tsMensajes.texto}">
                      <span style="margin-top: -8px;" class="fa fa-search form-control-feedback"></span></form>
                    </div>
                  </div><!-- /.box-tools -->
                </div><!-- /.box-header -->
                <div class="box-body no-padding">
                 
                  <div class="table-responsive mailbox-messages">
                    <table class="table table-hover table-striped">
               {foreach from=$tsMensajes.data item=mp}
                        <tr id="mp_{$mp.mp_id}" {if $mp.mp_read_to == 0} class="unread"{/if}>
                          
                          <td class="mailbox-star"><a href="#">   <img src="{$tsConfig.url}/files/avatar/{$mp.mp_from}_50.jpg" /></a></td>
                          <td class="mailbox-name"><a href="{$tsConfig.url}/perfil/{$mp.user_name}"> {$mp.user_name}</a></td>
                          <td class="mailbox-subject"><b>{$mp.mp_subject}</b> - 	<a class="enlaceMensaje" href="{$tsConfig.url}/mensajes/leer/{$mp.mp_id}"> {if $mp.mp_type == 1}<i class="return"></i>{/if}{$mp.mp_preview}</a><div class="pull-right"> <nav>
            <a href="#" class="qtip read" title="Marcar como leido" onclick="mensaje.marcar('{$mp.mp_id}:{$mp.mp_type}', 0, 1, this); return false;" {if $mp.mp_read_to == 1}style="display:none"{/if}>
            <i class="fa fa-circle-o text-aqua"></i></a>
            <a href="#" class="qtip unread" title="Marcar como no leido" onclick="mensaje.marcar('{$mp.mp_id}:{$mp.mp_type}', 1, 1, this); return false;" {if $mp.mp_read_to == 0}style="display:none"{/if}>
            <i class="fa fa-circle-o text-red"></i></a>
            <a href="#" class="qtip" title="Eliminar" onclick="mensaje.eliminar('{$mp.mp_id}:{$mp.mp_type}',1); return false;">
            <i class="fa fa-trash-o"></i></a>
        </nav>
                          
                          </div></td>
                          <td class="mailbox-attachment"><i class="fa fa-paperclip"></i></td>
                          <td class="mailbox-date">{$mp.mp_date|fecha:'d_Ms_a'}</td>
                        </tr>{/foreach}
                      </tbody>
                    </table><!-- /.table -->
                  </div><!-- /.mail-box-messages -->
                </div><!-- /.box-body -->
              {if $tsMensajes.data}
{else}
<div class="text-red">No hay mensajes</div>
{/if}
              </div>{/if}<!-- /. box -->

	{if $tsAction == ''}
	{if $tsQT == ''}
    <div class="box box-primary">
<div class="box-body">
                        
                        
<div class="mpFooter">
            
	<a class="boton btn btn-info btn-flat" href="{$tsConfig.url}/mensajes/?qt=unread">No leidos</a>
	{else}
	<a class="boton btn btn-info btn-flat" href="{$tsConfig.url}/mensajes/">Todos</a>
	{/if}
	{/if}
	{if $tsMensajes.pages.prev != 0}
        <a href="{$tsConfig.url}/mensajes/{if $tsAction}{$tsAction}/{/if}?page={$tsMensajes.pages.prev}{if $tsQT != ''}&qt=unread{/if}" class="boton btn btn-info btn-flat floatL">Anterior</a>
    {/if}
	{if $tsMensajes.pages.next != 0}
    	<a href="{$tsConfig.url}/mensajes/{if $tsAction}{$tsAction}/{/if}?page={$tsMensajes.pages.next}{if $tsQT != ''}&qt=unread{/if}" class="boton btn btn-info btn-flat floatR">Siguiente</a>
    </div></div></div>{/if}
