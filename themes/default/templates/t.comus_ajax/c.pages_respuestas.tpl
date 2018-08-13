{if $tsRespuestas.pages.pages > 1}
<div class="com_pagination">
    {if $tsRespuestas.pages.prev}<a class="cp_prev" onclick="javascript:com.pages_respuestas({$tsRespuestas.pages.prev});"></a>{/if}
    {section name=pages start=1 loop=$tsRespuestas.pages.section max=$tsRespuestas.pages.pages}
    <a {if $tsRespuestas.pages.current == $smarty.section.pages.index}class="here"{/if} onclick="javascript:com.pages_respuestas({$smarty.section.pages.index});">{$smarty.section.pages.index}</a>
    {/section}
    {if $tsRespuestas.pages.pages > 1 && $tsRespuestas.pages.pages > $tsRespuestas.pages.current}<a class="cp_next" onclick="javascript:com.pages_respuestas({$tsRespuestas.pages.next});"></a>{/if}
</div>
{/if}

<div class="ctc_coment_list">
    {foreach from=$tsRespuestas.data item=r}
    <div class="com_coment_resp clearfix" id="coment_id_{$r.r_id}">
        {if $tsUser->is_member}
        <ul class="comTemas">
            {if $r.r_autor != $tsUser->uid}
            <li><a onclick="javascript:com.votar_respuesta({$r.r_id}, 'pos');return false;" class="qtip" title="Me gusta"><i class="com_icon icon_like"></i></a></li>
            <li><a onclick="javascript:com.votar_respuesta({$r.r_id}, 'neg');return false;" class="qtip" title="No me gusta"><i class="com_icon icon_dislike"></i></a></li>
            {if $tsCom.es_miembro && $tsTema.t_cerrado == 0 && $tsCom.mi_rango >= 2 || $tsCom.mi_rango >= 4 || $tsUser->is_admod || $tsUser->uid == $tsTema.t_autor}
			<li><a onclick="javascript:com.citar_com({$r.r_id}, '{$r.user_name}');return false;" class="qtip" title="Responder"><i class="com_icon icon_reply"></i></a></li>
            {/if}
			<li><a onclick="javascript:bloquear({$r.r_autor}, true, 'comentarios')" class="qtip" title="Bloquear"><i class="com_icon icon_bloquear"></i></a></li>
            {/if}       
            {if $r.r_autor == $tsUser->uid || $tsUser->is_admod || $tsCom.mi_rango >= 4}
            <li><a onclick="javascript:com.del_respuesta({$r.r_id});return false;" class="qtip" title="Borrar comentario"><i class="com_icon icon_del"></i></a></li>
            {/if}
        </ul>
        {/if}
        <div class="ctcf_avatar">
            <a href="{$tsConfig.url}/perfil/{$r.user_name}">
                <img src="{$tsConfig.url}/files/avatar/{$r.r_autor}_50.jpg" />
            </a>
        </div>
        <div class="ctcf_detalles">
            <div class="ctcf_info">
                @<a href="{$tsConfig.url}/perfil/{$r.user_name}">{$r.user_name}</a>
                {if $tsUser->is_admod == 1}<span>IP <a href="{$tsConfig.url}/moderacion/buscador/1/1/{$r.r_ip}" class="geoip" target="_blank">{$r.r_ip}</a></span>{/if}
                <span>{$r.r_fecha|hace}</span><span id="total_votos_{$r.r_id}" {if $r.r_votos_pos-$r.r_votos_neg != 0}class="qtip" title="+{$r.r_votos_pos} / -{$r.r_votos_neg}"{/if} style="font-weight: bold;font-size: 12px;color: {if $r.r_votos_pos-$r.r_votos_neg < 0}red{elseif $r.r_votos_pos-$r.r_votos_neg > 0}green{else}#999{/if};">{if $r.r_votos_pos-$r.r_votos_neg != 0}{if $r.r_votos_pos-$r.r_votos_neg > 0}+{/if}{$r.r_votos_pos-$r.r_votos_neg}{/if}</span>
            </div>
            <div class="ctcf_body">{$r.r_body}</div>
            <div style="display:none;" id="coment_source_{$r.r_id}">{$r.r_source}</div>
        </div>
    </div>
    {/foreach}
    <div id="add_new_com"></div>
</div>

{if $tsRespuestas.pages.pages > 1}
<div class="com_pagination">
    {if $tsRespuestas.pages.prev}<a class="cp_prev" onclick="javascript:com.pages_respuestas({$tsRespuestas.pages.prev});"></a>{/if}
    {section name=pages start=1 loop=$tsRespuestas.pages.pages+1 max=$tsRespuestas.pages.pages}
    <a {if $tsRespuestas.pages.current == $smarty.section.pages.index}class="here"{/if} onclick="javascript:com.pages_respuestas({$smarty.section.pages.index});">{$smarty.section.pages.index}</a>
    {/section}
    {if $tsRespuestas.pages.pages > 1 && $tsRespuestas.pages.pages > $tsRespuestas.pages.current}<a class="cp_next" onclick="javascript:com.pages_respuestas({$tsRespuestas.pages.next});"></a>{/if}
</div>
{/if}