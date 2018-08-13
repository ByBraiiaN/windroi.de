{include file='sections/main_header.tpl'}
<section class="content">
<div class="row">
<div class="col-md-12" style="text-align: center;">



<div class="panel box box-primary">
                      <div class="box-header with-border">
                        <h4 class="box-title">
                          <a>
                            Avisos
                          </a>
                        </h4>
                      </div>
                      <div id="collapseOne" class="panel-collapse collapse in" aria-expanded="true">
                        <div class="box-body">

    <p class="text-muted show_error">{$tsAviso.titulo} {$tsAviso.mensaje}</p>
    {if $tsAviso.but}
    <input type="button" onclick="location.href='{if $tsAviso.link}{$tsAviso.link}{else}{$tsConfig.url}{/if}'" value="{$tsAviso.but}" class="btn bg-olive margin">
    {/if}
    {if $tsAviso.return}
    <input type="button" onclick="history.go(-{$tsAviso.return})" title="Volver" value="Volver" class="btn bg-olive margin">
    {/if}
                        </div>
                      </div>
                    </div>
	
</div>


</div>
</section>
{include file='sections/main_footer.tpl'}