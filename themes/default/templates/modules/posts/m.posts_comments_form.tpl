<div class="form-group">
                    
<div id="procesando"><div id="post"></div></div>
	<div class="error"></div>
	<textarea placeholder="Escribe un  comentario" id="body_comm" class="form-control" tabindex="1" title="Escribir un comentario..." style="resize:none;" onfocus="onfocus_input(this)" onblur="onblur_input(this)"></textarea>
 </div>.

<div class="form-group">
<div class="buttons">
		
            <input type="hidden" id="auser_post" value="{$tsPost.post_user}" />
            <input type="button" onclick="comentario.nuevo('true')" class="btn btn-primary" value="Enviar Comentario" tabindex="3" id="btnsComment"/>
		<a href="#" onclick="moreEmoticons(true); return false;" style="float:right" id="moreemofn"> M&aacute;s emoticones</a>
		{include file='modules/global/m.global_emoticons.tpl'}

	</div></div>
