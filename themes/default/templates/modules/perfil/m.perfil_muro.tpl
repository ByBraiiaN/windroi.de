<div id="perfil_wall" status="activo">
	<script type="text/javascript">
    	muro.stream.total = {$tsMuro.total};
    </script>
   
    <div id="wall-content">
    {include file='modules/perfil/m.perfil_muro_story.tpl'}
    </div>
    <!-- more -->
    {if $tsMuro.total >= 10}
    
    <a class="more-pubs btn btn-success btn-block margin-bottom" href="#" onclick="muro.stream.loadMore('wall'); return false;" >Publicaciones más antiguas</a>
    {elseif $tsMuro.total == 0 && $tsUser->is_member}
    <p class="emptyData">Este usuario no tiene comentarios, se el primero.</p>
    {/if}
</div>