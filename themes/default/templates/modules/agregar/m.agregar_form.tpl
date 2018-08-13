{if $tsUser->is_admod || $tsUser->permisos.gopp}
        <section class="content">   
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
		<form action="{$tsConfig.url}/agregar.php{if $tsAction == 'editar'}?action=editar&pid={$tsPid}{/if}" method="post" name="newpost" autocomplete="off"> 
          <div class="row">
            <div class="col-md-3">
              <a class="btn btn-primary btn-block margin-bottom">{$tsConfig.titulo}</a>
			  <div class="box box-success">
                <div class="box-header with-border">
                  <h3 class="box-title">Categoria</h3>
                  <div class='box-tools'>
                   <button class='btn btn-box-tool' data-widget='collapse'><i class='fa fa-minus'></i></button>
                  </div>
                </div>
                <div class="box-body no-padding form-add-post">
                 <ul class="formPostUl" style="margin-top:0px;">    
            <li>
             <select class="agregar required form-control" tabindex="5" size="9" size="{$tsConfig.categorias.ncats}" name="categoria">
                                    <option value="" selected="selected">Elegir una categor&iacute;a</option>
                                        {foreach from=$tsConfig.categorias item=c}
                                        <option value="{$c.cid}" {if $tsDraft.b_category == $c.cid}selected="selected"{/if} style="background-image:url({$tsConfig.images}/icons/cat/{$c.c_img});background-repeat:no-repeat;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{$c.c_nombre}</option>
                                        {/foreach}
                                    </select>
	<span style="display: none;" class="errormsg"></span>
            </li>
		</ul>
                </div>
              </div>
              <div class="box box-solid">
                <div class="box-header with-border">
                  <h3 class="box-title">Opciones</h3> 
                  <div class='box-tools'>
                    <button class='btn btn-box-tool' data-widget='collapse'><i class='fa fa-minus'></i></button>
                  </div>
                </div>
                <div class="box-body no-padding">
           <ul class="nav nav-pills nav-stacked">
                    <li><a class="qtip" title=" Tu post ser&aacute; visto s&oacute;lo por los usuarios que tengan cuenta en {$tsConfig.titulo}" ><i class="fa fa-lock"></i> Usuarios registrados <span class="pull-right"> <input type="checkbox" tabindex="6" name="privado" id="privado" class="floatL" {if $tsDraft.b_private == 1}checked="checked"{/if} /></span></a></li>
                    
                     <li><a class="qtip" title="Si tu post es pol&eacute;mico ser&iacute;a mejor que cierres los comentarios" ><i class="fa fa-lock"></i> Cerrar Comentarios <span class="pull-right">  <input type="checkbox" tabindex="7" name="sin_comentarios" id="sin_comentarios" class="floatL" {if $tsDraft.b_block_comments == 1}checked="checked"{/if}></span></a></li>
                     
                     <li><a class="qtip" title="Tu post mostrar&aacute; los &uacute;ltimos visitantes que ha tenido" ><i class="fa fa-lock"></i> Visitantes recientes <span class="pull-right">  <input type="checkbox" tabindex="8" name="visitantes" id="visitantes" class="floatL" {if $tsDraft.b_visitantes == 1}checked="checked"{/if} /></span></a></li>
                     
                      {if $tsUser->is_admod == 1}
					  <li><a class="qtip" title=" Este post se mostrara en el incio de BLOG" ><i class="fa fa-lock"></i> Blogger <span class="pull-right">  <input type="checkbox" tabindex="10" name="blogger" id="blogger" class="floatL" {if $tsDraft.b_blogger == 0}checked="checked"{/if} ></span></a></li> 
                       <li><a class="qtip" title=" Resalta este post entre los dem&aacute;s" ><i class="fa fa-lock"></i> Patrocinado <span class="pull-right">  <input type="checkbox" tabindex="11" name="patrocinado" id="patrocinado" class="floatL" {if $tsDraft.b_sponsored == 1}checked="checked"{/if} ></span></a></li> {/if}
                     {if $tsUser->is_admod || $tsUser->permisos.most}
                     <li><a class="qtip" title="Colocar a este post fijo en la home" ><i class="fa fa-lock"></i> Sticky <span class="pull-right"> <input type="checkbox" tabindex="12" name="sticky" id="sticky" class="floatL" {if $tsDraft.b_sticky == 1}checked="checked"{/if} ></span></a></li>{/if}
                     
                  </ul>      
                  
                </div>
              </div>
              
            </div>
            <div class="col-md-9">
              <div class="box box-primary">
                <div class="box-header with-border">
                  <h3 class="box-title">Crear Nuevo Post</h3>
                </div>
                <div class="box-body form-add-post" >
                
                  <li class="form-group">
                  
                  <input type="hidden" value="{$tsDraft.bid}" name="borrador_id"/>
                   <input placeholder="Escribe aqu&#237; el t&#237;tulo del post" type="text" tabindex="1" name="titulo" maxlength="50" size="60" class="text-inp required form-control" value="{$tsDraft.b_title}"  title="Tienes que poner un T&iacute;tulo a tu Post" required=""/>
                    <span style="display: none;" class="errormsg"></span>
                  </li>
                   <!--<div class="text-muted" id="repost"></div>-->  
				   
				   <li class="form-group">
                   <input  placeholder="Imagen de portada" type="text" tabindex="2" name="imgport" maxlength="500" class="text-inp required form-control" value="{$tsDraft.b_imgport}" title="URL de imagen de portada" required="" />
                    <span style="display: none;" class="errormsg"></span>  
                  </li>
                    <a name="post"></a></p>
                  <li class="form-group">
                    
                   <input  placeholder="Ingresa al menos 4 etiquetas distintas separadas por comas." type="text" tabindex="2" name="tags" maxlength="128" class="text-inp required form-control" value="{$tsDraft.b_tags}" title="Una lista separada por comas que describa el contenido. Ejemplo: musica, pop, Shakira, cd" required="" />
                    <span style="display: none;" class="errormsg"></span>  
                  </li>
                  <li class="form-group">
                   <span style="display: none;" class="errormsg"></span>  
                   <textarea id="markItUp" name="cuerpo" tabindex="3" style="min-height:460px;width: 99%;" class="required form-control" title="Tienes que agregar un contenido" required="">{$tsDraft.b_body}</textarea>
                  </li>
                </div>
                <div class="box-footer">
                  <div class="pull-right">
                      <span>
		<input type="button" tabindex="9" title="Guardar en borradores" value="Guardar en borradores" onclick="save_borrador()" class="boton btn bg-olive" id="borrador-save">
		<input type="button" tabindex="8" title="Previsualizar" value="Continuar &raquo;" name="preview" class="boton btn bg-purple">        </span>
                      <div id="borrador-guardado" class="borradorGuardado"></div>
                  </div>
                  	{if ($tsUser->is_admod > 0 || $tsUser->permisos.moedpo) && $tsDraft.b_title && $tsDraft.b_user != $tsUser->uid}
        	<li>     
                <span style="display: none;" class="errormsg"></span>
				<input style="width: 70%;" class="form-control" placeholder="Modificar Post" type="text" tabindex="8" name="razon" maxlength="150" class="text-inp" value=""/></p>
                <p class="text-muted">Si has modificado el contenido de este post ingresa la raz&oacute;n por la cual lo modificaste.</p>
            </li>
        	{/if}
                </div>
              </div>
            </div>
          </div></form>
        </section>
        {else}
    <div class="text-red">
    	Lo sentimos, pero no puedes publicar un nuevo post.
    </div>
     {/if}