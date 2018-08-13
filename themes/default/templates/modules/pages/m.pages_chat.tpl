<div class="col-md-12" style="margin-top:15px">
<div class="panel box box-primary">
 <div class="box-header with-border">
                        <h1 class="box-title">
                        <a>Chat de {$tsConfig.titulo}</a>
                        </h1></div>
<div class="box-body">

<section class="chat">
        {if $tsConfig.chat_id}
        <embed src="http://{$tsConfig.chat_id}.chatango.com/group" width="615" height="472" wmode="transparent" allowScriptAccess="always" allowNetworking="all" type="application/x-shockwave-flash" allowFullScreen="true" flashvars="cid={$tsConfig.chat_id}&v=0&w=0"></embed>
        {elseif $tsConfig.xat_id}
		<embed src="http://www.xatech.com/web_gear/chat/chat.swf" quality="high" width="615" height="472" name="chat" FlashVars="id={$tsConfig.xat_id}" align="middle" allowScriptAccess="sameDomain" type="application/x-shockwave-flash" pluginspage="http://xat.com/update_flash.shtml" />
        <small><a target="_BLANK" href="http://xat.com/web_gear/chat/go_large.php?id={$tsConfig.xat_id}">Chat más amplio.</a></small>
		{else}
        <p class="emptyData">Estamos por agregar el chat para que todos ustedes se puedan divertir y hacer nuevos amigos.</p>
        {/if}		
</section>
<aside class="asideChat">
	<div class="protocoloChat">
    	<header onclick="$('#protocolo').slideToggle();">
			<h3>Protocolo</h3>
        </header>
        <ol>
            <li>No se permite el uso de nicks que contengan términos insultantes, sexuales, spam, apologías a la violencia o algún pedido de carácter sexual, compañía, parejas y/o a fines.</li>
            <li>Está prohibido faltar el respeto, insultar, provocar, difamar, acosar, amenazar o hacer cualquier otra cosa no deseada, tanto directa como indirecta a otro usuario.</li>
            <li>No está permitido el SPAM, publicidad o propaganda de páginas personales, chats, foros, mensajes comerciales destinados a vender productos o servicios, etc.</li>
            <li>No repetir o enviar varias líneas de texto en un cierto tiempo, NO FLOOD.</li>
            <li>Recomendamos no abusar de las MAYúSCULAS, solo utilizarlas por reglas ortograficas (comienzos de oración, nombres propios o siglas), ya que el uso de ésta significa GRITAR.</li>
        </ol>
        <p>
        	<i>Este protocolo es solo para el chat, para la web en general existe otro 
            <a href="{$tsConfig.url}/pages/protocolo/">protocolo</a>.</i>
        </p>
    </div>
</aside></div></div></div>