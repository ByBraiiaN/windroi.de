<div class="comTemas" id="coment_id_{$newCom.4}">
        	<ul class="comTemas">
                <li><a href="#" onclick="com.del_respuesta({$newCom.4});return false;" class="qtip" title="Borrar comentario"><i class="com_icon icon_del"></i></a></li>
            </ul>
            <div class="ctcf_avatar">
                <a href="{$tsConfig.url}/perfil/{$newCom.2}">
                    <img src="{$tsConfig.url}/files/avatar/{$newCom.1}_50.jpg" />
                </a>
            </div>
            <div class="ctcf_detalles">
                <div class="ctcf_info">@<a href="{$tsConfig.url}/perfil/{$newCom.2}">{$newCom.2}</a><span>{$newCom.3|hace}</span></div>
                <div class="ctcf_body">{$newCom.0|nl2br}</div>
            </div>
        </div>
<div id="add_new_com"></div>