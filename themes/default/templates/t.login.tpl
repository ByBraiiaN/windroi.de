{include file='sections/main_header.tpl'}
<body class="bg-gray">
 <div class="form-box" id="login-box">
 <div class="header">{$tsConfig.titulo}</div>
<div class="reg-login">
<div style="display: block;" id="login_cuerpo">
<div class="login-panel">
<span class="gif_cargando floatR" id="login_cargando"></span>
<div class="btn btn-block btn-danger" id="login_error"></div>
<form style="padding-top: 1px;" action="javascript:login_ajax('registro-logueo')" id="login-registro-logueo" method="POST" >
<div class="body bg-white">
<p class="login-box-msg">Inicio de sesion</p>
<div class="form-group has-feedback">
            <input  placeholder="Usuario o Email"  id="nickname" name="nick" class="form-control" tabindex="1" size="20" maxlength="30"  autofocus type="text"/>
            <span class="fa fa-user form-control-feedback"></span>
          </div>
          <div class="form-group has-feedback">
            <input placeholder="Constrase&#241;a" id="password" name="pass" class="form-control" tabindex="2" size="20" type="password"/>
            <span class="fa fa-lock form-control-feedback"></span>
          </div>
          
            <div class="row">
            <div class="col-xs-8"> 
              <div class="icheckbox_square-blue checked">
                <label>
                 <input type="checkbox" id="rem" name="rem" value="true" checked="checked" /> Recordar Usuario
                </label>
              </div>                        
            </div>
            <div class="col-xs-4">
              <button type="submit" class="btn btn-primary btn-block btn-flat">Entrar<i style="margin-left:5px;" class="fa fa-sign-in"></i></button>
            </div>
          </div>
</div>

<div class="footer">   
<div style="line-height: 8px;">
        <a  onclick="$(this).closest('form').submit(); return false">
        <a href="#" onclick="resend_validation();">No lleg&oacute; el correo de validaci&oacute;n?</a></p>
        <a href="#" class="text-center" onclick="remind_password();">Olvidaste tu contrase&ntilde;a?</a></p>
        <a href="{$tsConfig.url}/registro/" class="text-center">Registrate</a>
        </a></div>
<div class="social-auth-links text-center">
        <p>- O -</p>
        <a href="#" class="btn btn-block btn-social btn-facebook btn-flat"><i class="fa fa-facebook"></i> Acceder con Facebook (Desarrollo)</a></p>
        <a href="#" class="btn btn-block btn-social btn-google-plus btn-flat"><i class="fa fa-google-plus"></i> Acceder con Google+ (Desarrollo)</a>
        </div>
        
<input type="submit" style="visibility:hidden">
</div></div>
</form>

</div>
</div>
</div>
{literal}
<script type="text/javascript"> 
$('form[name="login"] input[name="nick"]').focus();
</script>
{/literal}
</body>
{include file='sections/main_footer.tpl'}

