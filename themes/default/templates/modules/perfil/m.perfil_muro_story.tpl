         {foreach from=$tsMuro.data item=p}
                              
                                <ul class="timeline">
    <li class="time-label">
        <span {if $p.user_name == $tsUser->nick}class="bg-blue"{else}class="bg-green"{/if}>
           {$p.p_date|fecha}
        </span>
    </li>
       <li>
       {if $p.p_type == 1 && $p.p_user == $p.p_user_pub}<i class="fa fa-envelope bg-blue"></i>{else} <i class="fa fa-user bg-green"></i>{if $p.p_type == 2}<i class="fa fa-picture-o bg-blue"></i>{/if}{if $p.p_type == 3}<i class="fa fa-fa-link bg-blue"></i>{/if}{if $p.p_type == 4}<i class="fa fa-video-camera bg-blue"></i>{/if}{/if}
                 <!--i class="stream w_{if $p.p_type == 1 && $p.p_user == $p.p_user_pub}0{else}{$p.p_type}{/if}"></i-->
         <!--i {if $p.user_name == $tsUser->nick}class="fa fa-user bg-blue "{else}class="fa fa-user bg-green"{/if}></i-->
                                <div class="Story timeline-item" id="pub_{$p.pub_id}">
                                
          <span {if $p.p_likes == 0}style="display:none"{/if} class="time" id="lk_{$p.pub_id}">   <i class="fa fa-heart"></i> {$p.likes.text}</a> </span>
       
           <span class="time"><i class="fa fa-clock-o"></i> {$p.p_date|fecha}</span>
   <h3 class="timeline-header"><a href="{$tsConfig.url}/perfil/{$p.user_name}">{if $p.user_name == $tsUser->nick}Yo{else}{$p.user_name}{/if}</a></h3>
   
                              
                                        <div class="timeline-body">
                                           
                                            <div class="Story_Message">
                                              
                                                <span>{$p.p_body|quot}</span>
                                                {if $p.p_type != 1}
                                                <div class="mvm clearfix">
                                                    {if $p.p_type == 2}
                                                    <a href="#" onclick="muro.load_atta('foto', '{$p.a_url}', this); return false" class="uiPhoto"><img src="{$p.a_img}"/></a>
                                                    {elseif $p.p_type == 3}
                                                    <div class="uiLink">
                                                        <div><a href="{$p.a_url}" target="_blank" class="a_blue"><strong>{$p.a_title}</strong></a></div>
                                                        <a href="{$p.a_url}" target="_blank" class="a_blue">{$p.a_url}</a>
                                                    </div>
                                                    {elseif $p.p_type == 4}
                                                    <a href="#" onclick="muro.load_atta('video','{$p.a_url}', this); return false;"class="uiVideoThumb">
                                                        <img src="http://img.youtube.com/vi/{$p.a_url}/1.jpg" width="130" height="97"/>
                                                        <i></i>
                                                    </a>
                                                    <div class="videoDesc">
                                                        <strong><a href="http://www.youtube.com/watch?v={$p.a_url}" target="_blank" class="a_blue">{$p.a_title}</a></strong>
                                                        <div style="margin-top:5px">
                                                        {$p.a_desc}
                                                        </div>
                                                    </div>
                                                    {/if}
                                                </div>
                                                {/if}
                                            </div>
                                        </div>
                                        
                                   
                                    <div class="clearBoth"></div>
                                     <div class="timeline-footer">
                                           
                                            
                                 <div class="Story_Info">
                                     
                                                <a onclick="muro.like_this({$p.pub_id}, 'pub', this); return false;" class="btn btn-primary btn-xs">{$p.likes.link}</a>
                                                <a onclick="muro.show_comment_box({$p.pub_id}); return false" class="btn btn-xs bg-maroon">Comentar</a>
                                                 {if $p.p_user == $tsUser->uid || $p.p_user_pub == $tsUser->uid || $tsUser->is_admod || $tsUser->permisos.moepm}<div style="float:right;"><a style="color:white;" class="btn btn-danger btn-xs" href="#" onclick="muro.del_pub({$p.pub_id},1); return false;" title="Eliminar la publicaci&oacute;n" class="qtip uiClose">Delete</a></div>{/if}
												{if $tsUser->is_admod}
												&middot;
												<span class="btn btn-warning btn-flat btn-xs">{$p.p_ip}</span>
												{/if}
                                            </div>
                                        </div>
                                </div>
                               
                               
                                
                                <ul id="cb_{$p.pub_id}" class="Story_Comments" {if $p.p_comments == 0 && $p.p_likes == 0}style="display:none"{/if}>
                                                <li class="lifi"><i></i></li>
                                               
                                                <li style="width:90%; margin: 12px auto 0;">
                                                   <ul id="cl_{$p.pub_id}" class="commentList">
                                                        {if $p.p_comments > 2 && !$p.hide_more_cm}
                                                        <li class="ufiItem">
                                                            <div class="more_comments clearfix">
                                                                <i></i>
                                                                <a href="#" class="a_blue floatL" onclick="muro.more_comments({$p.pub_id}, this); return false">Ver los {$p.p_comments} comentarios</a>
                                                                <img width="16" height="11" src="http://static.ak.fbcdn.net/rsrc.php/yb/r/GsNJNwuI-UM.gif"/>
                                                            </div>
                                                        </li>
                                                        {/if}
                                                       
                                                   </ul> 
                                                </li>{if $tsPrivacidad.mf.v == true && $tsUser->is_member || $tsType == 'news'}
                                                <li class="ufiItemm n">
                                                    <div class="newComment">
                                                        <input style="width:90%; margin: 12px auto 0;" class="form-control" type="text" title="Escribe un comentario...." name="hack" value="Escribe un comentario..." pid="{$p.pub_id}" />
                                                        <div class="formulario" style="display:none">
                                                    
                                                            <textarea style="width:90%; margin: 12px auto 0;" class="form-control" title="Escribe un comentario..." id="cf_{$p.pub_id}" pid="{$p.pub_id}" name="add_wall_comment" onfocus="onfocus_input(this)" onblur="onblur_input(this)"></textarea>
                                                            <div class="clearBoth"></div>
                                                        </div>
                                                    </div>
                                                </li>{/if}
                                            </ul>
                                </li>
                                
                                 {foreach from=$p.comments item=c}
                                   <li class="time-label">
        <span class="bg-green">
            {$c.c_date|fecha}
        </span>
    </li>
                                <li>
                  <i class="fa fa-comment bg-yellow"></i>
                  <div class="timeline-item">
                  
                    <span class="time"><i class="fa fa-clock-o"></i> {$c.c_date|fecha}</span>
                    <h3 class="timeline-header no-border"><a href="{$tsConfig.url}/perfil/{$c.user_name}">{$c.user_name}</a> {$c.c_body|quot}</h3>
                  </div>
                </li>   {/foreach}
                                
                                
                                
                                </ul> 
                                
                                {/foreach}