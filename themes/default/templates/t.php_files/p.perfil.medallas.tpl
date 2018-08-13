1:
	<header>
        <h3>Medallas de {$tsUsername} ({$tsMedallas.total})</h3>
    </header>
    {if $tsMedallas.medallas}
        <ul>
        {foreach from=$tsMedallas.medallas item=m}
        <li>
        	<img src="{$tsConfig.tema.t_url}/images/icons/med/{$m.m_image}_32.png" title="{$m.medal_date|hace:true}"/>
        	<strong>{$m.m_title}</strong>
			<span>{$m.m_description}</span>
        </li>
        {/foreach}
    </ul>
        {else}
        <p class="emptyData">No tiene medallas</p>
        {/if}