<div class="box box-warning">
    <div class="box-header with-border "><h2 class="box-title">Comunidades por pa&iacute;s</h2></div>
    <div class="box-body">
    	<div class="com_list_element"><a href="{$tsConfig.url}/comunidades/dir/Internacional/">Todos los pa&iacute;ses</a></div>
        {foreach from=$tsPaises.data item=p}
        <div class="com_list_element">
            <a href="{$tsConfig.url}/comunidades/dir/{$p.c_pais}/">{$p.pais}</a>
            <span class="cle_number">{$p.total}</span>
        </div>
        {/foreach}
    </div>
</div>