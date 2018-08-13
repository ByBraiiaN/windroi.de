<div class="panel box box-primary">
                      <div class="box-header with-border">
                        <h4 class="box-title">
                          <a>
                            Mi Avatar
                          </a>
                        </h4>
                      </div>
                      <div id="collapseOne" class="panel-collapse collapse in">
                        <div class="box-body">
                    <div class="sidebar-tabs adminAvatar">
 
    <div style="display: none" class="avatar-loading"></div>
    <img alt="" src="{$tsConfig.url}/files/avatar/{if $tsPerfil.p_avatar}{$tsPerfil.user_id}_120{else}avatar{/if}.jpg?t={$smarty.now}" style="width:100%" class="avatar-big" id="avatar-img"/>
    <ul class="change-avatar" style="display: none;  margin-left: -45px;">
        <li class="local-file">
          <br />
            <input type="file" name="file-avatar" id="file-avatar" size="15" class="browse form-control"/>
            <button onclick="avatar.upload(this)" class="avatar-next local btn btn-block btn-info btn-flat">Subir</button>
        </li>
        <li class="url-file">
            {if $tsConfig.c_allow_upload}
            <span>Direccón de la imagen</span><br />
            <input type="text" name="url-avatar" id="url-avatar" size="45"/>
            <button onclick="avatar.upload(this);" class="avatar-next url">Subir</button>
            {else}
            <p class="text-muted">Lo sentimos por el momento solo puedes subir avatares desde tu PC.</p>
            {/if}
        </li>
    </ul>
<a style="cursor:pointer;" onclick="avatar.edit(this)" class="boton btn btn-block btn-danger btn-flat" id="avatar-edit">Editar</a>
<hr />
<p class="text-muted">Progreso</p>
<div class="progress progress-sm active">
                    <div title="{$tsPerfil.porcentaje}% Complete" class="progress-bar progress-bar-success progress-bar-striped qtip" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: {$tsPerfil.porcentaje}%">
                      <span class="sr-only">{$tsPerfil.porcentaje}% Complete</span>
                    </div>
                  </div>

</div>
<div id="prueba"></div>
                        </div>
                      </div>
                    </div>




