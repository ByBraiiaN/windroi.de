<div class="alert alert-warning"><a href="{$tsConfig.url}/pages/protocolo/" title="Protocolo">Antes de crear un tema lee el protocolo.</a></div>

<!-- upload -->
          <div class="box box-warning" id="upload_form" style="display:none">
            <div class="box-header with-border">
              <h3 class="box-title">Subir Imagenes</h3>
              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
              </div>
            </div>
            <div class="box-body">
                        <div id="upload">
                        </div>
                        <script type="text/javascript" src="{$tsConfig.js}/jquery.form.js"></script>
                        {literal}
                        <script type="text/javascript">
                        $(function(){
                            $('#up_form').ajaxForm({
                                    resetForm: true,
                                    dataType: 'json',
                                    beforeSubmit: function(a,f,o) {
                                        //o.dataType = $('#uploadResponseType')[0].value;
                                        $('#results').html('<center><img src="' + global_data.img + '/images/loading_bar.gif"/></center>');
                                    },
                                    success: function(data) {
                                        var res = $('#results');
                                        var imgs = $('#imagenes');
                                        var resp = data.length;
                                        //
                                        if(resp > 0){
                                            res.html(''); // RESET
                                            for(var i = 0; i < resp; i++ ){
                                                // STATUS
                                                var li = '<span class="status_' + data[i][0] + '>';
                                                if(data[i][0] == 1) li += '#' + (i + 1) + ' Subido con &eacute;xito.';
                                                else if(data[i][1] != 'No Found')li += data[i][1];
                                                li += '</span>';
                                                //
                                                res.append(li);
                                                // AGREGAMOS LAS CORRECTAS
                                                if(data[i][0] == 1){
                                                    var ext = data[i][2];
                                                    var img = data[i][1];
                                                    //img = img.replace(ext,'th.' + ext);
                                                    // HTML
                                                    var plink = '<a href="#post" onclick="upload.agregar(';
                                                    plink += "'" + data[i][1] + "'";
                                                    plink += '); return false;"';
                                                    //
                                                    var html = '<div class="item">';
                                                    html += plink + '><img style="width:41px" src="' + img + '"/></a>';
                                                    html += plink + ' class="txt">Agregar al post</a>';
                                                    html += '</div>';
                                                    imgs.append(html);
                                                }
                                            }
                                        } else {
                                            res.html('No se seleccionaron archivos.');
                                        }
                                    }
                                });
 
                        });
                        </script>
                        {/literal}
                        <form id="up_form" method="post" action="{$tsConfig.url}/upload-images.php" enctype="multipart/form-data">
                            <div class="clearfix">
                            <p>Puedes subir im&aacute;genes para tu post desde aqu&iacute;, solo selecciona las que quieras desde tu PC, y podr&aacute;s agregarlas f&aacute;cilmente. El proceso puede tardar unos minutos.</p>
                            <hr />
                            <div class="clearfix">
                                <div id="fileinputs" class="inputs floatL">
                                    #1 <input type="file" name="img1" />
                                    #2 <input type="file" name="img2" />
                                    #3 <input type="file" name="img3" />
                                    #4 <input type="file" name="img4" />
                                    #5 <input type="file" name="img5" />
                                    <input type="submit" class="btn warning center" value="Subir Im&aacute;genes" />
                                </div>
                                <div id="imagenes" class="floatL"></div>
                            </div>
                            <hr />
                            <div id="results"></div>
                            </div>
                            </form>
                    
            </div>
            <!-- /.box-body -->
          </div>
<!-- end upload -->

<form action="" method="post" id="add_new_tema">
<div class="col-md-8">
    <div class="box box-success">
	<div class="box-body">
    	<div class="cat_item ">
        	<label>T&iacute;tulo del Tema</label>
            <input type="text" name="titulo" class="form-control required" style="width: 400px;padding: 8px;" maxlength="60" value="{$tsTema.t_titulo}" />
        </div>
        <div class="cat_item ">
        	<label>Cuerpo</label>
            <textarea type="text" name="cuerpo" id="markItUp" class="form-control required" style="width:586px;min-height: 250px;border-radius: 0 0 5px 5px;">{$tsTema.t_cuerpo}</textarea>
        </div>
        {if $tsTema.t_autor && $tsTema.t_autor != $tsUser->uid}
        <div class="cat_item ">
        	<label>Causa de la moderac&oacute;n</label>
            <input type="text" name="razon" class="form-control required" style="width: 582px;padding: 8px;" maxlength="80" />
        </div>
        {/if}

        <div class="cat_item ">
        	<input type="hidden" name="temaid" value="{$tsTema.t_id}" />
            <input type="button" class="btn btn-primary ibg" value="Continuar" onclick="com.crear_tema()" />
            <input type="button" class="btn btn-primary" value="Guardar en borradores" onclick="com.save_borrador()" />
            <input type="hidden" name="bid" value="{$tsTema.b_id}" />
            <i id="msj_borrador"></i>
        </div>
    </div>
</div>
</div>

<div class="col-md-4">
	<div class="box box-success">
    	<div class="box-body" style="margin: 0;">
        	<label>Opciones</label>
            <div class="cat_option ">
            	<input type="checkbox" name="cerrado" class="floatL" {if $tsTema.t_cerrado == 1}checked="checked"{/if} /><label> Cerrar resuestas</label>
                <p>Nadie podr&aacute; responder en este tema</p>
            </div>
            {if $tsCom.mi_rango >= 4 || $tsUser->is_admod}
            <div class="cat_option ">
            	<input type="checkbox" name="sticky" class="floatL" {if $tsTema.t_sticky == 1}checked="checked"{/if} /><label> Sticky</label>
                <p>El tema quedar&aacute; destacado</p>
            </div>
            {/if}
        </div>
    </div>
</div>
</form>