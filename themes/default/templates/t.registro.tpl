{include file='sections/main_header.tpl'}
<section class="content">
<div class="row">
<div class="col-md-8">
<div class="panel box box-primary">
 <div class="box-header with-border">
                        <h4 class="box-title">
                          <a>
                            Registro Nuevo Usuario
                          </a>
                        </h4>
                      </div>
<div class="box-body">
<div id="regtoupV5" class="registro">
	<div id="RegistroForm">
	<!-- Paso Uno -->
		<div class="pasoUno">
      <div class="form-group has-feedback">
			<input placeholder="Nombre" class="inputV5Reg form-control qtip" name="nick" type="text" id="nick" tabindex="1" title="Ingrese un nombre de usuario &uacute;nico" onfocus="registro.focus(this)" onblur="registro.blur(this)" onkeydown="registro.clear_time(this.name)" onkeyup="registro.set_time(this.name)" autocomplete="off" /> 
            <span class="fa fa-user form-control-feedback"></span>
            <div class="help"><span><em></em></span></div></div>
        <div class="form-group has-feedback">
			<input placeholder="Contraseña" class="inputV5Reg form-control qtip" name="password" type="password" id="password" tabindex="2" title="Ingresa una contrase&ntilde;a segura" onfocus="registro.focus(this)" onblur="registro.blur(this)" autocomplete="off" /> <span class="fa fa-lock form-control-feedback"></span>
            <div class="help"><span><em></em></span></div></div>
			 <div class="form-group has-feedback">
			<input placeholder="Confirme Contraseña" class="inputV5Reg form-control qtip" name="password2" type="password" id="password2" tabindex="3" title="Vuelve a ingresar la contrase&ntilde;a" onfocus="registro.focus(this)" onblur="registro.blur(this)" autocomplete="off" /> <span class="fa fa-sign-out form-control-feedback"></span>
            <div class="help"><span><em></em></span></div></div>
		<div class="form-group has-feedback">
			<input placeholder="E-mail" class="inputV5Reg form-control qtip" name="email" type="text" id="email" tabindex="4" title="Ingresa tu direcci&oacute;n de email" onfocus="registro.focus(this)" onblur="registro.blur(this)" onkeydown="registro.clear_time(this.name)" onkeyup="registro.set_time(this.name)" autocomplete="off" /> 
            <span class="fa fa-envelope form-control-feedback"></span>
            <div class="help"><span><em></em></span></div></div></p>
		
            <label>Fecha de Nacimiento</label>
			<select  class="form-control qtip" id="dia" name="dia" tabindex="5" onblur="registro.blur(this)" onfocus="registro.focus(this)" autocomplete="off" title="Ingrese d&iacute;a de nacimiento">
                <option value="">Día</option>
            	{section name=dias start=1 loop=32}
                <option value="{$smarty.section.dias.index}">{$smarty.section.dias.index}</option>
            	{/section}
			</select></p>
             
			<select  class="form-control qtip"  id="mes" name="mes" tabindex="6" onblur="registro.blur(this)" onfocus="registro.focus(this)" autocomplete="off" title="Ingrese mes de nacimiento">
				<option value="">Mes</option>
            	{foreach from=$tsMeces key=mid item=mes}
                <option value="{$mid}">{$mes}</option>
            	{/foreach}	
            </select></p>
			<select  class="form-control qtip"  id="anio" name="anio" tabindex="7" onblur="registro.blur(this)" onfocus="registro.focus(this)" autocomplete="off" title="Ingrese a&ntilde;o de nacimiento">
				<option value="">Año</option>
            	{section name=year start=$tsEndY loop=$tsEndY step=-1 max=$tsMax}
                 <option value="{$smarty.section.year.index}">{$smarty.section.year.index}</option>
            	{/section}
			</select></p> <div class="help"><span><em></em></span></div>
         
		</div><input class="boton btn btn-block btn-success btn-flat" type="button" tabindex="13" class="mBtn btnOk" value="Paso 2 &raquo;" onclick="registro.change_paso(2)" id="sig"/>
	<!-- Paso Dos -->
		<div class="pasoDos">
			<label for="sexo">Genero</label><br/>
			<input class="radio" type="radio" id="sexo_m" tabindex="8" name="sexo" value="1" onblur="registro.blur(this)" onfocus="registro.focus(this)" autocomplete="off" title="Selecciona tu g&eacute;nero" /> 
            <label for="sexo_m">Soy un Hombre</label><br/>
			<input class="radio" type="radio" id="sexo_f" tabindex="9" name="sexo" value="0" onblur="registro.blur(this)" onfocus="registro.focus(this)" autocomplete="off" title="Selecciona tu g&eacute;nero" /> 
            <label for="sexo_f">Soy una Mujer</label>
	<div class="help"><span><em></em></span></div> 
		<br />
            <label for="pais">País</label>
			<select class="form-control" id="pais" name="pais" tabindex="10" onblur="registro.blur(this)" onchange="registro.blur(this)" onfocus="registro.focus(this)" autocomplete="off" title="Ingrese su pa&iacute;s">
				<option value="">País</option>
            	{foreach from=$tsPaises key=code item=pais}
                <option value="{$code}">{$pais}</option>
            	{/foreach}
			</select>
            <div class="help"><span><em></em></span></div>
		
            <label for="estado">Región</label>
			<select  class="form-control" title="Ingrese su estado" autocomplete="off" onfocus="registro.focus(this)" onchange="registro.blur(this)" onblur="registro.blur(this)" tabindex="11" name="estado" id="estado">
				<option value="">Región</option>
			</select> 
            <div class="help"><span><em></em></span></div>
			
	<div class="form-line">
			<label>Demuestra que no eres un robot:</label>
			<div class="g-recaptcha" data-sitekey="6LdJIBQUAAAAAEvv2AZQjUxXqO5UE5KvCR0FoXGP"></div>
			<div class="help"><span><em></em></span></div>
	</div>
          
			<input type="checkbox" class="checkbox" id="terminos" name="terminos" tabindex="12" onblur="registro.blur(this)" onfocus="registro.focus(this)" title="Acepta los T&eacute;rminos y Condiciones?" /> 
            <label class="list-label" for="terminos">
            	Al registrarme acepto los <a href="/pages/terminos-y-condiciones/" target="_blank">
            	términos y condiciones</a> del sitio.
            </label> 
            <div class="help"><span><em></em></span></div>
         
		</div>
    
	<input type="button"  class="boton btn btn-block btn-warning btn-flat" value="Registrarme!" onclick="registro.submit()" id="term"/>	
	</div>
</div>


<script type="text/javascript">
//
$.getScript("{$tsConfig.js}/registro.js{literal}", function(){
	//Seteo el pais seleccionado
	//registro.datos['pais']='MX';
	//registro.datos_status['pais']='ok';
	//registro.datos_text['pais']='OK';
	//
	registro.change_paso(1);
	
	//Genero el autocomplete de la ciudad
	/*$('#RegistroForm .pasoDos #ciudad').autocomplete('/registro-geo.php', {
		minChars: 2,
		width: 298
	}).result(function(event, data, formatted){
		registro.datos['ciudad_id'] = (data) ? data[1] : '';
		registro.datos['ciudad_text'] = (data) ? data[0].toLowerCase() : '';
		if(data)
			$('#RegistroForm .pasoDos #terminos').focus();
	});*/
	mydialog.procesando_fin();
});

//Load recaptcha
$.getScript("https://www.google.com/recaptcha/api.js?hl=es");
</script>
{/literal} </div></div></div>

<div class="col-md-4">
<div class="panel box box-primary">
 <div class="box-header with-border">
                        <h4 class="box-title">
                          <a>
                           Anuncio
                          </a>
                        </h4>
                      </div>
<div class="box-body">
{include file='modules/global/m.global_ads_300.tpl'}
</div></div></div>
</div></section>
{include file='sections/main_footer.tpl'}

