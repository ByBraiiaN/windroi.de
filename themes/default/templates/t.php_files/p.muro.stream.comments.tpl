1:
{foreach from=$tsComments.data item=c}
<ul class="timeline">

  <li>
                  <i class="fa fa-user bg-aqua"></i>
                  <div class="timeline-item">
                  
                    <span class="time"><i class="fa fa-clock-o"></i> {$c.c_date|fecha}</span>
                    {if $tsComments.user == $tsUser->uid || $c.c_user == $tsUser->uid}<span class="close"><a href="#" onclick="muro.del_pub({$c.cid}, 2); return false" class="uiClose" title="Eliminar"></a></span>{/if}                    
                    <h3 class="timeline-header no-border"><a href="{$tsConfig.url}/perfil/{$c.user_name}">{$c.user_name}</a> {$c.c_body|quot}</h3>
                    <a style="cursor: pointer; padding: 6px; line-height: 33px; margin-top: 11px;" onclick="muro.like_this({$c.cid}, 'com', this); return false;" class="a_blue">{$c.like}</a> <span class="cm_like"{if $c.c_likes == 0} style="display:none"{/if}>&middot; <i></i> <a onclick="muro.show_likes({$c.cid}, 'com'); return false;" id="lk_cm_{$c.cid}" class="a_blue">{$c.c_likes} persona{if $c.c_likes > 1}s{/if}</a>                    
                  </div>
                </li> </ul>
{/foreach}