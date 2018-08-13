
  <div class="box box-warning">
    <div class="box-header with-border">
      <h3 class="box-title">Comunidades</h3>

      <div class="box-tools pull-right"></div><!-- /.box-tools -->
    </div><!-- /.box-header -->

    <div class="box-body" style="">
      {$tsConfig.titulo} te permite crear tu comunidad para que puedas compartir gustos e
      intereses con los dem&aacute;s. <a class="btn btn-primary" href=
      "{$tsConfig.url}/comunidades/crear/">&iexcl;Crea la tuya!</a>
    </div><!-- /.box-body -->
  </div>

  <div class="box box-primary">
    <div class="box-header with-border">
      <h3 class="box-title">Estad&iacute;sticas</h3>
    </div><!-- /.box-header -->

    <div class="box-body">
      <div class="">
        <div class="floatL">
          <strong id="stat-onl">{$tsStats.stats_online|number_format:0:',':'.'}</strong>
          usuarios online
        </div>

        <div class="floatR">
          <strong id=
          "stat-comu">{$tsStats.stats_comunidades|number_format:0:',':'.'}</strong>
          comunidades
        </div>
      </div>

      <div class="">
        <div class="floatL">
          <strong id="stat-tem">{$tsStats.stats_temas|number_format:0:',':'.'}</strong>
          temas
        </div>

        <div class="floatR">
          <strong id=
          "stat-com">{$tsStats.stats_respuestas|number_format:0:',':'.'}</strong>
          respuestas
        </div>
      </div>
    </div><!-- /.box-body -->
  </div>

  <div class="box box-warning">
    <div class="box-header with-border">
      <h2 class="box-title">Comentarios recientes</h2>
    </div>

    <div class="box-body">
      {if $tsRespuestas} {foreach from=$tsRespuestas item=r}
		{if $r.t_estado == 0}
      <div class="com_list_element" >
        <a class="cle_autor" href="{$tsConfig.url}/perfil/{$r.user_name}">{$r.user_name}</a> en <a class="cle_title"
        href="{$tsConfig.url}/comunidades/{$r.c_nombre_corto}/{$r.t_id}/{$r.t_titulo|seo}.html#coment_id_{$r.r_id}">{$r.t_titulo|limit:30}</a>
      </div>{/if}{/foreach} {else}

      <div class="alert alert-info">
        No hay comentarios recientes
      </div>{/if}
    </div>
  </div>

  <div class="box box-warning">
    <div class="box-header with-border">
      <h2 class="box-title">Populares</h2>


      <div class="box-tools pull-right cbt_list">
          
<select size="1" name="usgsfeed" id="usgsfeed" onchange="com.pop_list_change(this.value);">
    <option value="Historico" SELECTED>Historico</option>
<option value="Semana" >Semana</option>
<option value="Mes">Mes</option>
</select>
          

      </div>
    </div>

    <div class="box-body">
      <div id="com_change_pop">
        <div id="ccp_historico" style="display: block;">
          {if $tsPopulares.historico} {foreach from=$tsPopulares.historico item=c key=i}

          <div class="com_list_element" title="La comunidad ha sido eliminada">
            <span class="cle_item">{$i+1}</span> <a href=
            "{$tsConfig.url}/comunidades/{$c.c_nombre_corto}/">{$c.c_nombre|limit:30}</a>
            <span class="cle_number">{$c.c_miembros}</span>
          </div>{/foreach} {else}

          <div class="alert alert-info">
            Nada por aqu&iacute;
          </div>{/if}
        </div>

        <div id="ccp_mes" style="display: none;">
          {if $tsPopulares.mes} {foreach from=$tsPopulares.mes item=c key=i}

          <div class="com_list_element" title="La comunidad ha sido eliminada">
            <span class="cle_item">{$i+1}</span> <a href=
            "{$tsConfig.url}/comunidades/{$c.c_nombre_corto}/">{$c.c_nombre|limit:30}</a>
            <span class="cle_number">{$c.c_miembros}</span>
          </div>{/foreach} {else}

          <div class="alert alert-info">
            Nada por aqu&iacute;
          </div>{/if}
        </div>
        <div id="ccp_semana" style="display: none;">
          {if $tsPopulares.semana} {foreach from=$tsPopulares.semana item=c key=i}

          <div class="com_list_element" title="La comunidad ha sido eliminada">
            <span class="cle_item">{$i+1}</span> <a href=
            "{$tsConfig.url}/comunidades/{$c.c_nombre_corto}/">{$c.c_nombre|limit:30}</a>
            <span class="cle_number">{$c.c_miembros}</span>
          </div>{/foreach} {else}

          <div class="alert alert-info">
            Nada por aqu&iacute;
          </div>{/if}
        </div>

      </div>
    </div>
  </div>

  <div class="box box-warning">
    <div class="box-header with-border">
      <h2 class="box-title">Comunidades recientes</h2>
    </div>

    <div class="box-body">
      {if $tsRecientes} {foreach from=$tsRecientes item=c}

      <div class="com_list_element" title="La comunidad ha sido eliminada">
        <a href="{$tsConfig.url}/comunidades/{$c.c_nombre_corto}/">{$c.c_nombre}</a>
      </div>{/foreach} {else}

      <div class="alert alert-info">
        No se han creado comunidades a&uacute;n
      </div>{/if}
    </div>

  </div>{* Solo la primera comunidad de la semana *} {if $tsPopulares.semana}

  <div class="box box-info">
    <div class="box-header with-border">
      <h2 class="box-title">Comunidad destacada</h2>
    </div>

    <div class="box-body text-center">
      {foreach from=$tsPopulares.semana item=c key=i} {if $i == 0} <a href=
      "{$tsConfig.url}/comunidades/{$c.c_nombre_corto}/" title=
      "{$c.c_nombre}"><img class="img-circle" src=
      "{$tsConfig.url}/files/uploads/c_{$c.c_id}.jpg" alt="{$c.c_nombre}" width="120"
      height="120" /></a>

      <h2 class="box-title">{$c.c_nombre}</h2><a class="btn btn-primary" href=
      "{$tsConfig.url}/comunidades/{$c.c_nombre_corto}/">Ver comunidad</a> {/if}
      {/foreach}
    </div>
  </div>{/if}