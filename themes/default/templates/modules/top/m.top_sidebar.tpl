<div class="panel box box-primary">
                      <div class="box-header with-border">
                        
                         	<select style="  width: 18%;" class="form-control"onchange="location.href='{$tsConfig.url}/top/{$tsAction}/?fecha={$tsFecha}&cat='+$(this).val()">
        <option value="0">Todas</option>
        {foreach from=$tsConfig.categorias item=c}
        <option value="&cat={$c.cid}" {if $tsCat == $c.cid}selected="selected"{/if}>{$c.c_nombre}</option>
        {/foreach}
	</select>
              
          <div  style="margin-top: -33px;"class="pull-right"><a class="btn btn-warning" href="{$tsConfig.url}/top/posts/">Posts</a>
           <a class="btn btn-danger" href="{$tsConfig.url}/top/usuarios/">Usuarios</a>
		   <a class="btn btn-danger" href="{$tsConfig.url}/top/temas/">Temas</a>
		   <a class="btn btn-danger" href="{$tsConfig.url}/top/comunidades/">Comunidades</a></div>
		   
                      </div>
                      <div id="collapseOne" class="panel-collapse collapse in">
                        <div class="box-body">
                        | 	<a href="{$tsConfig.url}/top/{$tsAction}/?fecha=2&cat={$tsCat}&sub={$tsSub}" {if $tsFecha == 2}class="selected"{/if}>Ayer</a> | 
		<a href="{$tsConfig.url}/top/{$tsAction}/?fecha=1&cat={$tsCat}&sub={$tsSub}" {if $tsFecha == 1}class="selected"{/if}>Hoy</a> | 
			<a href="{$tsConfig.url}/top/{$tsAction}/?fecha=3&cat={$tsCat}&sub={$tsSub}" {if $tsFecha == 3}class="selected"{/if}>Últimos 7 días</a> | 
			<a href="{$tsConfig.url}/top/{$tsAction}/?fecha=4&cat={$tsCat}&sub={$tsSub}" {if $tsFecha == 4}class="selected"{/if}>Del mes</a> | 
			<a href="{$tsConfig.url}/top/{$tsAction}/?fecha=5&cat={$tsCat}&sub={$tsSub}" {if $tsFecha == 5}class="selected"{/if}>Todos los tiempos</a> | 
                        </div>
                      </div>
                    </div>

<section class="filtrarTop">

	<nav>
		<ul>
		
		</ul>
	</nav>
</section>
