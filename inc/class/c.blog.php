<?php if ( ! defined('TS_HEADER')) exit('No se permite el acceso directo al script');
class tsBlog {
	function &getInstance(){
		static $instance;		
		if( is_null($instance) ){
			$instance = new tsBlog();
    	}
		return $instance;
	}
			
/* Posts Crap*/
    function act_postsblog()
     {
      global $tsCore;
      //
      $max = $tsCore->settings['cpost']; // MAXIMO A MOSTRAR
      $limit = $tsCore->setPageLimit($max, true);

      $retorno['data']=result_array(db_exec(array(__FILE__, __LINE__), 'query', 'SELECT p.post_id, p.post_user, p.post_body, p.post_imgport, p.post_date, p.post_category, p.post_title, p.post_puntos, p.post_comments, p.post_hits,  p.post_sponsored, p.post_sticky, p.post_status, u.user_id, u.user_name, c.cid, c.c_seo,c.c_nombre,c.c_img, r.rango_id, r.r_name, r.r_color FROM p_posts AS p LEFT JOIN u_miembros AS u ON p.post_user = u.user_id LEFT JOIN p_categorias AS c ON c.cid = p.post_category  LEFT JOIN u_rangos AS r ON  r.rango_id = u.user_rango  WHERE p.post_status = 0 AND p.post_blogoff = '.'1'.'  ORDER BY p.post_id DESC LIMIT '.$limit));
	  

		$elements = array(
            "/(?i)\[url\=(http|https|ftp|irc|ed2k|gopher|telnet|gopher|telnet)(\:\/\/)([^\<\>[:space:]]+?)\](.+?)(\[\/url\])/i",
            "/(?i)\[quote\=([^\n\r\t\<\>]+?)\]([^\a]+?)\[\/quote\]/i",
            "/(?i)\[img\=([0-9]{1,3})x([0-9]{1,3})\](http|https|ftp|irc|ed2k|gopher|telnet)(\:\/\/)([^\<\>[:space:]]+?)(\[\/img\])/i",
            "/(?i)\[img\=(http|https|ftp|irc|ed2k|gopher|telnet)?(\:\/\/)?([^\<\>[:space:]]+)\]/i",
            "/(?i)\[swf\=(.+?)\]/i",
            "/(?i)\[goear\=(.+?)\]/i",
            "/(?i)\[goear\]([a-z0-9]{7})\[\/goear\]/i"
         );
            
        $size = count( $elements );
            
        while ($row = mysqli_fetch_assoc($query))
        {
            for( $elm = 0; $elm < $size; $elm++ )
            {
                $element = $elements[$elm];
                //
                while( preg_match($element, $row['post_body'] ) )
                {
                    $row['post_body'] = preg_replace( $element, '', $row['post_body'] );
                }
            }
            //
            $row['post_body'] = strip_tags(substr($tsCore->parseBBCode($row['post_body']), 0, 150)).'...';
            //
            $lastPosts['data'][] = $row;
        }
		
	  
	  
      // PAGINAS
        $query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT COUNT(post_id) FROM p_posts WHERE post_blogoff = '.'1'.'');
        list($total) = db_exec('fetch_row', $query);

      $retorno['pages'] = $tsCore->pageIndex($tsCore->settings['url'] .
            '/blog/pages?', $_GET['s'], $total, $max);

      return $retorno;
     }
	 
	 
/* Comentarios Crap*/
	function act_comblog(){
	global $tsCore, $tsUser;
	$query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT c.cid, c.c_post_id, c.c_user, c.c_date, c.c_votos, u.user_id, u.user_name, u.user_rango, u.user_activo, u.user_baneado, p.post_id, p.post_title, p.post_user, p.post_category, p.post_status, r.rango_id, r.r_color, cat.cid, cat.c_seo FROM p_comentarios AS c LEFT JOIN u_miembros AS u ON c.c_user = u.user_id LEFT JOIN p_posts AS p ON p.post_id = c.c_post_id LEFT JOIN u_rangos AS r ON r.rango_id = u.user_rango LEFT JOIN p_categorias AS cat ON cat.cid = p.post_category WHERE u.user_activo = 1 AND u.user_baneado = 0  AND p.post_blogoff = '.'1'.' ORDER BY c.cid DESC LIMIT '.$tsCore->settings['c_max_com'].'');
	$data = result_array($query);

	//
	return $data;
	}
	/* Estadisticas Posts Crap*/
	function act_cpostblog(){
	global $tsCore, $tsUser;
	$query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT COUNT(p.post_id) AS total, p.post_category FROM p_posts AS p  WHERE  p.post_status = 0 AND p.post_blogoff = '.'1'.' ');
	$data = result_array($query);

	//
	return $data;
	}
	/* Estadisticas Comentarios Crap*/
	function act_comentblog(){
	global $tsCore, $tsUser;
	$query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT COUNT(c.cid) AS total, c.c_post_id, p.post_id, p.post_category FROM p_comentarios AS c LEFT JOIN p_posts AS p ON c.c_post_id = p.post_id  WHERE  post_status = 0 AND p.post_blogoff = '.'1'.' ');
	$data = result_array($query);

	//
	return $data;
	}

	
	
}

