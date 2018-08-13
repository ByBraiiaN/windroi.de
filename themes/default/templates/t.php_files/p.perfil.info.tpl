1:
        <header>
            <h3>Información de {$tsUsername}</h3>
        </header>
        <ul>
            <li>
                <span>País</span>
                <strong>{$tsPais}</strong>
            </li>
			{if $tsPerfil.p_sitio}
            <li>
                <span>Sitio Web</span>
                <strong><a rel="nofollow" href="{$tsPerfil.p_sitio}">{$tsPerfil.p_sitio}</a>
                </strong>
            </li>
            {/if}			
            <li>
                <span>Es usuario desde</span>
                <strong>{$tsPerfil.user_registro|fecha:"d_Ms_a"}</strong>
            </li>
            <li>
                <span>Última vez activo</span>
                <strong>{$tsPerfil.user_lastactive|fecha}</strong>
            </li>
			{if $tsPerfil.p_estudios}
            <li>
                <span>Estudios</span>
                <strong>{$tsPData.estudios[$tsPerfil.p_estudios]}</strong>
            </li>
            {/if}
            <h4>Idiomas</h4>
        	{foreach from=$tsPData.idiomas key=iid item=idioma}
            {if $tsPerfil.p_idiomas.$iid != 0}
            <li>
                <span>{$idioma}</span>
                {foreach from=$tsPData.inivel key=val item=text}{if $tsPerfil.p_idiomas.$iid == $val}
                <strong>{$text}</strong>
                {/if}{/foreach}
            </li>
            {/if}
            {/foreach}															
            <h4>Datos profesionales</h4>
			{if $tsPerfil.p_profesion}
            <li>
            	<span>Profesión</span>
                <strong>{$tsPerfil.p_profesion}</strong>
            </li>
            {/if}			
            {if $tsPerfil.p_empresa}
            <li>
            	<span>Empresa</span>
                <strong>{$tsPerfil.p_empresa}</strong>
            </li>
            {/if}			
            {if $tsPerfil.p_sector}
            <li>
                <span>Sector</span>
                <strong>{$tsPData.sector[$tsPerfil.p_sector]}</strong>
            </li>
            {/if}			
            {if $tsPerfil.p_ingresos}
            <li>
                <span>Ingresos</span>
                <strong>{$tsPData.ingresos[$tsPerfil.p_ingresos]}</strong>
            </li>
            {/if}			
            {if $tsPerfil.p_int_prof}
            <li>
                <span>Intereses profesionales</span>
                <strong>{$tsPerfil.p_int_prof}</strong>
            </li>{/if}			
            {if $tsPerfil.p_hab_prof}
            <li>
                <span>Habilidades profesionales</span>
                <strong>{$tsPerfil.p_hab_prof}</strong>
            </li>
            {/if}
			<h4>Vida personal</h4>
			{if $tsGustos == 'show'}
            <li>
                <span>Le gustaría</span>
                <strong>{foreach from=$tsPData.gustos key=val item=text}{if $tsPerfil.p_gustos.$val == 1}{$text}, {/if}{/foreach}</strong>
            </li>
            {/if}			
            {if $tsPerfil.p_estado}
            <li>
                <span>Estado civil</span>
                <strong>{$tsPData.estado[$tsPerfil.p_estado]}</strong>
            </li>
            {/if}			
            {if $tsPerfil.p_hijos}
            <li>
                <span>Hijos</span>
                <strong>{$tsPData.hijos[$tsPerfil.p_hijos]}</strong>
            </li>
            {/if}			
            {if $tsPerfil.p_vivo}
            <li>
                <span>Vive con</span>
                <strong>{$tsPData.vivo[$tsPerfil.p_vivo]}</strong>
            </li>
            {/if}
            <h4>&iquest;Cómo es?</h4>

			{if $tsPerfil.p_altura}
            <li>
                <span>Mide</span>
                <strong>{$tsPerfil.p_altura} centimetros</strong>
            </li>{/if}			
            {if $tsPerfil.p_peso}
            <li>
                <span>Pesa</span>
                <strong>{$tsPerfil.p_peso} kilos</strong>
            </li>{/if}			
            {if $tsPerfil.p_pelo}
            <li>
                <span>Su pelo es</span>
                <strong>{$tsPData.pelo[$tsPerfil.p_pelo]}</strong>
            </li>{/if}			
            {if $tsPerfil.p_ojos}
            <li>
                <span>Sus ojos son</span>
                <strong>{$tsPData.ojos[$tsPerfil.p_ojos]}</strong>
            </li>{/if}
            {if $tsPerfil.p_fisico}
            <li>
                <span>Su físico es</span>
                <strong>{$tsPData.fisico[$tsPerfil.p_fisico]}</strong>
            </li>
            {/if}
            {if $tsPerfil.p_tengo.0 != 0 || $tsPerfil.p_tengo.1 != 0}
            {foreach from=$tsPData.tengo key=val item=text}
            <li>
                <span></span>
                <strong>{if $tsPerfil.p_tengo.$val == 1}Tiene{else}No tiene{/if} {$text}</strong>
            </li>
            {/foreach}
            {/if}				
            <h4>Habitos personales</h4>
			{if $tsPerfil.p_dieta}
            <li>
                <span>Mantiene una dieta</span>
                <strong>{$tsPData.dieta[$tsPerfil.p_dieta]}</strong>
            </li>{/if}			
            {if $tsPerfil.p_fumo}
            <li>
                <span>Fuma</span>
                <strong>{$tsPData.fumo_tomo[$tsPerfil.p_fumo]}</strong>
            </li>{/if}			
            {if $tsPerfil.p_tomo}
            <li>
                <span>Toma alcohol</span>
                <strong>{$tsPData.fumo_tomo[$tsPerfil.p_tomo]}</strong>
            </li>{/if}
            <h4>Sus propias palabras</h4>
			{if $tsPerfil.p_intereses}
            <li>
                <span>Intereses</span>
                <strong>{$tsPerfil.p_intereses}</strong>
            </li>
            {/if}
            {if $tsPerfil.p_hobbies}
            <li>
                <span>Hobbies</span>
                <strong>{$tsPerfil.p_hobbies}</strong>
            </li>
            {/if}
            {if $tsPerfil.p_tv}
            <li>
                <span>Series de TV favoritas</span>
                <strong>{$tsPerfil.p_tv}</strong>
            </li>
            {/if}			
            {if $tsPerfil.p_musica}
            <li>
                <span>Música favorita</span>
                <strong>{$tsPerfil.p_musica}</strong>
            </li>
            {/if}
            {if $tsPerfil.p_deportes}
            <li>
                <span>Deportes y Equipos</span>
                <strong>{$tsPerfil.p_deportes}</strong>
            </li>
            {/if}	
            {if $tsPerfil.p_libros}
            <li>
                <span>Libros favoritos</span>
                <strong>{$tsPerfil.p_libros}</strong>
            </li>
            {/if}
            {if $tsPerfil.p_peliculas}
            <li>
                <span>Películas favoritas</span>
                <strong>{$tsPerfil.p_peliculas}</strong>
            </li>
            {/if}			
            {if $tsPerfil.p_comida}
            <li>
                <span>Comida favoríta</span>
                <strong>{$tsPerfil.p_comida}</strong>
            </li>
            {/if}
            {if $tsPerfil.p_heroes}
            <li>
                <span>Sus heroes son</span>
                <strong>{$tsPerfil.p_heroes}</strong>
            </li>
            {/if}
        </ul>
