            {foreach from=$tsActividad.data item=ad key=id}
            {if $ad.data}
            <div id="more-{$id}" nid="last-activity-date-{$id}" class="date-sep" active="false">
                <span style="display:none">{$ad.title}</span>
                {foreach from=$ad.data item=ac}
                <ul class="sep">
                    <li>
                        <img src="{$tsConfig.url}/files/avatar/{$ac.uid}_16.jpg" width="16" height="16" class="ac_avatar" />
                        {if $ac.style != ''}
                        <!--<span class="monac_icons ma_{$ac.style}"></span>-->
                        {/if}
                        <a class="nomUser" href="{$tsConfig.url}/perfil/{$ac.user}">{$ac.user}</a>
             			<!--{$ac.text} -->
                        <a href="{$ac.link}">{$ac.ltext}</a>
	            		<span class="time">{$ac.date|hace}</span>
                    </li>
            	</ul>
                {/foreach}
            </div>
            {/if}
            {/foreach}
            {if $tsActividad.total > 0 && $tsActividad.total >= 25}
            <span id="last-activity-view-more">
                <a class="boton" onclick="actividad.cargar({$tsUserID},'more', 0); return false;" href="">Ver más actividad</a>
            </span>
            {/if}
            <div id="total_acts" val="{$tsActividad.total}"></div>
            <div id="jsdump">
            <script type="text/javascript">
            // {literal}
            $(function(){
                /*
                    EL SIGUIENTE CODIGO SIRBE PARA NO MOSTRAR LOS SEPARADORES DE FECHA POR SI YA ESTAN,
                    ESTO FUE HECHO ASI PARA EVITAR MAS CONSULTAS AL SERVIDOR... 
                */
                var ac_dates = new Array('today', 'yesterday', 'month', 'old');
                for(var i = 0; i < ac_dates.length; i++){
                    var obj_name = 'last-activity-date-' + ac_dates[i];
                    var obj = $('#' + obj_name);
                    // MORE
                    var m_name = 'more-' + ac_dates[i];
                    var mobj = $('#' + m_name);
                    // ACTIVO
                    var active = obj.attr('active');
                    // VALIDAMOS
                    if(typeof active == 'undefined'){
                        //
                        var new_id = $(mobj).attr('nid');
                        $(mobj).attr('id',new_id);
                        $(mobj).find('h3').show();
                        $(mobj).removeAttr('nid').attr('active','true');
                        
                    } else {
                        $(mobj).find('h3').remove();
                        var html = $(mobj).html();
                        $(obj).append(html)
                        $(mobj).remove();
                    }
                }
                // ME AUTO ELIMINO
                $('#jsdump').remove();
            });
            // {/literal}
            </script>
            </div>