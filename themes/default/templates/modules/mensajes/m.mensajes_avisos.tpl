{if $tsMensajes}
<div class="box box-primary">
                <div class="box-header with-border">
                  <h3 class="box-title">Inbox</h3>
                  <div class="box-tools pull-right">
                    <div class="has-feedback">
                    <form method="get" action="{$tsConfig.url}/mensajes/search/">
                      <input type="text" class="form-control input-sm" placeholder="Search Mail" value="{$tsMensajes.texto}">
                      <span style="margin-top: -8px;" class="glyphicon glyphicon-search form-control-feedback"></span></form>
                    </div>
                  </div><!-- /.box-tools -->
                </div><!-- /.box-header -->
                <div class="box-body no-padding">
                  <div class="mailbox-controls">
                    <!-- Check all button -->
                    <button class="btn btn-default btn-sm"><i class="fa fa-refresh"></i></button>
                     <button class="btn btn-default btn-sm"><i class="fa fa-chevron-left"></i></button>
                        <button class="btn btn-default btn-sm"><i class="fa fa-chevron-right"></i></button>
                    <div class="pull-right">
                      <span title="{$tsAvisos} Avisos " class="badge bg-green" style="margin-right: 23px;">{$tsAvisos}</span>
                      
                    </div><!-- /.pull-right -->
                  </div>
                  <div class="table-responsive mailbox-messages">
                    <table class="table table-hover table-striped">
                  {foreach from=$tsMensajes item=av}
                        <tr>
                          
                          <td class="mailbox-star"><a href="#"><i class="fa fa-star text-yellow"></i></a></td>
                          
                          <td class="mailbox-name"><a href="{$tsConfig.url}/perfil/{$tsUser->info.user_name}">{$tsUser->nick}</a></td>
                          <td class="mailbox-subject"><b>{$tsConfig.titulo}</b> - 	<a class="enlaceMensaje" href="{$tsConfig.url}/mensajes/avisos/?aid={$av.av_id}">{$av.av_body|truncate:50}</a><div class="pull-right"><a class="qtip" title="Eliminar" href="{$tsConfig.url}/mensajes/avisos/?did={$av.av_id}"  class="btn btn-default btn-sm"><i class="fa fa-trash-o"></i></a></div></td>
                          <td class="mailbox-attachment"><i class="fa fa-paperclip"></i></td>
                          <td class="mailbox-date">{$av.av_date|fecha}</td>
                        </tr>{/foreach}
                      </tbody>
                    </table><!-- /.table -->
                  </div><!-- /.mail-box-messages -->
                </div><!-- /.box-body -->
              
              </div><!-- /. box -->
{elseif $tsMensaje.av_id > 0}
<div class="panel box box-primary">
                      <div class="box-header with-border">
                        <h4 class="box-title">
                          <a>
                            {$tsMensaje.av_subject}
                          </a>
                        </h4>
                        
                         <div class="pull-right">
                          <div class="btn-group">
                      <a href="{$tsConfig.url}/mensajes/avisos/?did={$tsMensaje.av_id}"><button class="btn btn-default btn-sm"><i class="fa fa-trash-o"></i></button></a>
                     <a href="{$tsConfig.url}/mensajes/avisos/"> <button class="btn btn-default btn-sm"><i class="fa fa-reply"></i></button></a>

                    </div><span style="padding-left: 12px;" class="text-muted">{$tsMensaje.av_date|fecha}</span>
                         </div>
                      </div>
                      <div id="collapseOne" class="panel-collapse collapse in">
                        <div class="box-body">
                         {$tsMensaje.av_body}
                          {if $tsMensaje}
            	{else}
	<p class="text-muted">{if $tsMensaje}{$tsMensaje}{else}No hay avisos o alertas{/if}</p>
	{/if}
                        </div>
                      </div>
                    </div>	{/if}

