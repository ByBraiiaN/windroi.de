{include file='sections/main_header.tpl'}

{$tsInstall}
        <section class="content">
              <div class="row">
		{include file="modules/home/posts-recientes.tpl"}
		{include file="modules/home/anuncio.tpl"}
		{include file="modules/home/top-posts.tpl"}
				
		
		{include file="modules/home/recien-user.tpl"}  
		{include file="modules/home/top-user.tpl"}
		{include file="modules/home/comentarios.tpl"}
          </div>  
		  {include file="modules/home/estadisticas.tpl"}
        </section>
              {include file="sections/main_footer.tpl"} 