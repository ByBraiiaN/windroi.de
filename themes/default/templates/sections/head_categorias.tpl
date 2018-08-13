<section class="selectCategotia">
    <select onchange="ir_a_categoria(this.value)" class="form-control">
        <option selected="selected" value="{if $tsConfig.c_allow_portal == 0}-1{else}-2{/if}">Todas las categorías</option>
        {foreach from=$tsConfig.categorias item=c}
        <option value="{$c.c_seo}" {if $tsCategoria == '$c.c_seo'}selected="selected"{/if}>{$c.c_nombre}</option>
        {/foreach}
    </select>
</section>