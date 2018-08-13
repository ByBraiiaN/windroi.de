<div class="col-md-4">
                  <div class="box box-danger">
                    <div class="box-header with-border">
                      <h3 class="box-title">&Uacute;ltimos usuarios</h3>
                      <div class="box-tools pull-right">
					   <span class="label label-danger">{$tsStats.stats_miembros} Nuevos</span>
                        <button data-widget="collapse" class="btn btn-box-tool"><i class="fa fa-minus"></i></button>
                        <button data-widget="remove" class="btn btn-box-tool"><i class="fa fa-times"></i></button>
                      </div>
                    </div>
                    <div class="box-body no-padding">
                      <ul class="users-list clearfix">
                      {foreach from=$tsUlt  item=m}
                        <li>
                          <img alt="User Image" src="{$tsConfig.url}/files/avatar/{$m.user_id}_120.jpg">
                          <a href="/perfil/{$m.user_name}" class="users-list-name">{$m.user_name|truncate:50}</a>
         
                        </li>   {/foreach}
                    
                      </ul>
                    </div>
                    <div class="box-footer text-center">
                      <a class="uppercase" href="{$tsConfig.url}/usuarios/">Ver M&aacute;s</a>
                    </div>
                  </div>
                </div>