<section id="perfil-form" class="perfilForm">
	<nav>
    <ul>
        <li>
            <span class="uiComposer">
                <a class="qtip" href="#"  title="Estado" onclick="muro.stream.load('status', this); return false;" id="stMain">
                <i class="iconEstado"></i>
                </a>
            </span>
        </li>
        <li>
            <span class="uiComposer">
                <a class="qtip" href="#" title="Foto" onclick="muro.stream.load('foto', this); return false;">
                <i class="iconFoto"></i>
                </a>
            </span>
        </li>
        <li>
            <span class="uiComposer">
                <a class="qtip"  href="#" title="Enlace" onclick="muro.stream.load('enlace', this); return false;">
                <i class="iconEnlace"></i>
                </a>
            </span>
        </li>
        <li>
            <span class="uiComposer">
                <a class="qtip" href="#" title="Video" onclick="muro.stream.load('video', this); return false;">
                <i class="iconVideo"></i>
                </a>
            </span>
        </li>
        <li class="streamLoader"><img width="16" height="11" alt="" src="http://static.ak.fbcdn.net/rsrc.php/yb/r/GsNJNwuI-UM.gif" class="img"/></li>
    </ul>
    </nav>
    <div id="attaContent" class="noticiaMuro">
        <div id="statusFrame" style="display:block">
        	<textarea class="form-control" id="wall" onfocus="onfocus_input(this)" onblur="onblur_input(this)" title="{if $tsInfo.uid == $tsUser->uid}Publicar nuevo estado{else}Escribe algo....{/if}"></textarea>
        </div>
        <div id="fotoFrame">
        	<input style="width:85%;" type="text" name="ifoto" value="{$tsConfig.url}/ejemplo.jpg" title="{$tsConfig.url}/ejemplo.jpg" onfocus="onfocus_input(this)" onblur="onblur_input(this)"/>
        	<a style="height: 30px;" class="btn bg-purple margin" href="#" onclick="muro.stream.adjuntar(); return false;">Adjuntar</a>
        </div>
        <div id="enlaceFrame">
        	<input style="width:85%;"  type="text" name="ienlace" value="{$tsConfig.url}/ejemplo.html" title="{$tsConfig.url}/ejemplo.html" onfocus="onfocus_input(this)" onblur="onblur_input(this)"/>
        	<a style="height: 30px;"  class="btn bg-purple margin" href="#" onclick="muro.stream.adjuntar(); return false;">Adjuntar</a>
        </div>
        <div id="videoFrame">
        	<input style="width:85%;"  type="text" name="ivideo" value="http://www.youtube.com/watch?v=f_30BAGNqqA" title="http://www.youtube.com/watch?v=f_30BAGNqqA" onfocus="onfocus_input(this)" onblur="onblur_input(this)"/>
        	<a style="height: 30px;"  class="btn bg-purple margin" href="#" onclick="muro.stream.adjuntar(); return false;">Adjuntar</a>
        </div>
	</div>
    <div class="attaDesc">
        <div class="wrap">
        	<textarea class="form-control" id="attaDesc" onfocus="onfocus_input(this)" onblur="onblur_input(this)" title="Haz un comentario sobre esta foto..."></textarea>
        	<input type="button" class="boton btn bg-purple margin dataa" value="Compartir" onclick="muro.stream.compartir();" />
        </div>
    </div>
    <div class="btnStatus">
    	<input type="button" class="btn bg-purple margin dataa" value="Compartir" onclick="muro.stream.compartir();" />
    </div>

</section>