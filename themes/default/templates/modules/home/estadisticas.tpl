          <div class="row">
            <div class="col-md-3 col-sm-6 col-xs-12">
              <div class="info-box">
                <span class="info-box-icon bg-aqua"><i class="fa fa-trophy"></i></span>
                <div class="info-box-content qtip" title="R&eacute;cord conectados: {$tsStats.stats_max_online} - {$tsStats.stats_max_time|fecha}">
                  <span class="info-box-text">Online</span>
                  <span class="info-box-number">{$tsStats.stats_online}</span></div>
              </div>
            </div>
			<div class="col-md-3 col-sm-6 col-xs-12">
              <div class="info-box">
                <span class="info-box-icon bg-yellow"><i class="fa fa-user"></i></span>
                <div class="info-box-content">
                  <span class="info-box-text">Usuarios</span>
                  <span class="info-box-number">{$tsStats.stats_miembros}</span>
                </div>
              </div>
            </div>
            <div class="clearfix visible-sm-block"></div>

            <div class="col-md-3 col-sm-6 col-xs-12">
              <div class="info-box">
                <span class="info-box-icon bg-green"><i class="fa fa-files-o"></i></span>
                <div class="info-box-content">
                  <span class="info-box-text">Posts</span>
                  <span class="info-box-number">{$tsStats.stats_posts}</span>
                </div>
              </div>
            </div>
              <div class="col-md-3 col-sm-6 col-xs-12">
              <div class="info-box">
                <span class="info-box-icon bg-red"><i class="fa fa-comments-o"></i></span>
                <div class="info-box-content">
                  <span class="info-box-text">Comentarios</span>
                  <span class="info-box-number">{$tsStats.stats_comments}</span>
                </div>
              </div>
            </div>
          </div>
