{include file='sections/main_header.tpl'}
                {if $tsAction == 'ayuda'}
                <div class="emptyData">
                Hola <u>{$tsUser->nick}</u>, Sí necesitas ayuda, por favor contáctanos a través del siguiente 
                <a href="{$tsConfig.url}/pages/contacto/">formulario</a>.
                </div>
                {elseif $tsAction == 'chat'}
                {include file='modules/pages/m.pages_chat.tpl'}
                {elseif $tsAction == 'protocolo'}
                {include file='modules/pages/m.pages_protocolo.tpl'}
                {elseif $tsAction == 'terminos-y-condiciones'}
                {include file='modules/pages/m.pages_terminos.tpl'}
                {elseif $tsAction == 'privacidad'}
                {include file='modules/pages/m.pages_privacidad.tpl'}
                {elseif $tsAction == 'dmca'}
                {include file='modules/pages/m.pages_dmca.tpl'}
                {/if}
                <div style="clear:both"></div>
                
{include file='sections/main_footer.tpl'}