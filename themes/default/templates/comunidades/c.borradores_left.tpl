<div class="box box-warning">
<div class="box-header with-border "><h2 class="box-title">Borradores ({$tsBorradores.total})</h2></div>

<div class="box-body">

    {foreach from=$tsBorradores.data item=b}

    <div class="com_list_element  comid {$b.c_id}" id="borrador_id_{$b.b_id}">

        <a href="{$tsConfig.url}/comunidades/{$b.c_nombre_corto}/agregar/{$b.b_id}">{$b.b_titulo} </a> {$b.c_nombre}

        <br />

        &Uacute;ltima vez guardado el {$b.b_fecha|date_format:"%d/%m/%y a las %H:%M hs."}

        <a href="javascript:com.del_borrador({$b.b_id});" title="Eliminar borrador" class="item_deleted floatR"><i class="com_icon icon_del" style="vertical-align:top"></i></a>

    </div>

    {/foreach}

</div></div>