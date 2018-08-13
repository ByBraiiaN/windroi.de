

{if $tsMiembros.total > 0}
	{if $tsMiembros.type == 'miembros'}
        {foreach from=$tsMiembros.data item=a}
<ul> 
<header> 
<h4> 
<a href="{$tsConfig.url}/perfil/{$a.user_name}" style="color:#ff6633">{$a.user_name} (<strong>{if $a.m_permisos == 5}Administrador{elseif $a.m_permisos == 4}Moderador{elseif $a.m_permisos == 3}Posteador{elseif $a.m_permisos == 2}Comentador{elseif $a.m_permisos == 1}Visitante{/if}</strong>)</a> 
</h4> 
</header> 
<div class="avatarBox"> 
<img width="75" height="75" src="{$tsConfig.url}/files/avatar/{$a.m_user}_120.jpg" class="av"></a> 
</div>
                
                <li><a onclick="mensaje.nuevo('{$a.user_name}','','',''); return false">Enviar mensaje</a></li>
                {if $tsCom.mi_rango == 5 && $a.m_user != $tsUser->uid || $tsUser->is_admod && $a.m_user != $tsUser->uid}
                <li><a href="javascript:com.member_admin({$a.m_user});">Administrar</a></li>
                {/if}
 </ul><br/>
        {/foreach}
    {elseif $tsMiembros.type == 'suspendidos'}
    	{foreach from=$tsMiembros.data item=a}
    	
    	
    	
   <ul> 
<header> 
<h4> 
<a href="{$tsConfig.url}/perfil/{$a.user_name}" style="color:#ff6633">{$a.user_name}</a> 
</h4> 
</header> 
<div class="avatarBox"> 
<img width="75" height="75" src="{$tsConfig.url}/files/avatar/{$a.ban_user}_120.jpg" class="av"></a> 
</div>
                
                <li>Causa: <strong>{$a.ban_causa}</strong></li>
                <li>Inicio: <strong>{$a.ban_fecha|date_format:"%d/%m/%y a las %H:%M hs."}</strong> Termina: <strong>{if $a.ban_termina == 0}Indefinido{else}{$a.ban_termina|date_format:"%d/%m/%y a las %H:%M hs."}{/if}</strong></li>
                <li><a onclick="mensaje.nuevo('{$a.user_name}','','',''); return false">Enviar mensaje</a></li>
                {if $tsCom.mi_rango == 5 || $tsUser->is_admod}
                <li><a href="javascript:com.admin_rehabilitar({$a.ban_user});">Rehabilitar</a></li>
                {/if}
                
 </ul><br/> 	
   
        {/foreach}
    {/if}
    {if $tsMiembros.pages.pages > 1}
    <div class="com_pagination clearfix">
        {if $tsMiembros.pages.prev}<a class="cp_prev" href="{$tsConfig.url}/comunidades/{$tsCom.c_nombre_corto}/miembros.{$tsMiembros.pages.prev}/"></a>{/if}
        {if $tsMiembros.pages.pages > 1 && $tsMiembros.pages.pages > $tsMiembros.pages.current}<a class="cp_next" href="{$tsConfig.url}/comunidades/{$tsCom.c_nombre_corto}/miembros.{$tsMiembros.pages.next}/"></a>{/if}
    </div>
    {/if}
{else}
	<div class="alert alert-danger">{$tsMiembros}</div>
{/if}