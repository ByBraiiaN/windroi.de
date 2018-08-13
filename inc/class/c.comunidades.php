<?php if ( ! defined('TS_HEADER')) exit('No se permite el acceso directo al script');
/*
 * @name    c.comunidades.php
 * @author  Kmario19 - Vellenger
 */

class tsCom {
	// INSTANCIA DE LA CLASE
	public static function &getInstance(){
		static $instance;
		
		if( is_null($instance) ){
			$instance = new tsCom();
    	}
		return $instance;
	}
	
	/******************************************************************************************************/
	/***********************************************FUNCIONES**********************************************/
	/******************************************************************************************************/
	
	// Verificar si existe la comunidad desde su nombre corto. Retorna su ID
	function comExiste($nombre) {
		global $tsCore, $tsUser;
		$dato = db_exec('fetch_assoc', db_exec(array(__FILE__, __LINE__), 'query', 'SELECT c_id, c_nombre FROM c_comunidades LEFT JOIN u_miembros ON user_id = c_autor WHERE c_nombre_corto = \''.$tsCore->setSecure($nombre).'\' '.($tsUser->is_admod == 1 ? '' : 'AND user_activo = \'1\' AND user_baneado = \'0\' AND c_estado = \'0\'').' LIMIT 1'));
		if($dato['c_nombre']) {
			return $dato['c_id'];
		} else {
			return false;
		}
	}
	
	// Es miembro de la comunidad?
	function es_miembro($comid) {
		global $tsUser;
		$dato = db_exec('fetch_assoc', db_exec(array(__FILE__, __LINE__), 'query', 'SELECT m_user FROM c_miembros WHERE m_comunidad = \''.(int)$comid.'\' AND m_user =\''.(int)$tsUser->uid.'\' AND m_permisos > \'0\' LIMIT 1'));
		if(isset($dato['m_user'])) {
			return true;
		} else {
			return false;
		}
	}
	
	// Verificar si tiene permisos segun la comunidad
	function verify_permisos($comid) {
		global $tsUser;
		$dato = db_exec('fetch_assoc', db_exec(array(__FILE__, __LINE__), 'query', 'SELECT c_permisos FROM c_comunidades WHERE c_id = \''.(int)$comid.'\' LIMIT 1'));
		$permitido = $dato['c_permisos'];
		$dato = db_exec('fetch_assoc', db_exec(array(__FILE__, __LINE__), 'query', 'SELECT m_permisos FROM c_miembros WHERE m_comunidad = \''.(int)$comid.'\' AND m_user = \''.$tsUser->uid.'\' AND m_permisos > \'0\' LIMIT 1'));
		$permisos = $dato['m_permisos'];
		if($permisos >= $permitido) return true;
		else return false;
	}
	
	// Mis permisos para la comunidad
	function my_permiso($comid) {
		global $tsUser;
		$dato = db_exec('fetch_assoc', db_exec(array(__FILE__, __LINE__), 'query', 'SELECT m_permisos FROM c_miembros WHERE m_comunidad = \''.(int)$comid.'\' AND m_user = \''.$tsUser->uid.'\' AND m_permisos > \'0\' LIMIT 1'));
		if(!empty($dato['m_permisos']) && $tsUser->is_member) return $dato['m_permisos'];
		else return 0;
	}
	
	// Es seguidor de la comunidad?
	function es_seguidor_com($comid) {
		global $tsUser;
		$dato = db_exec('fetch_row', db_exec(array(__FILE__, __LINE__), 'query', 'SELECT COUNT(follow_id) AS total FROM u_follows WHERE f_id= \''.(int)$comid.'\' AND f_type = \'4\' AND f_user =\''.(int)$tsUser->uid.'\''));
		if($dato[0] != 0) {
			return true;
		} else {
			return false;
		}
	}
	
	// Es seguidor del tema?
	function es_seguidor_tema($temaid) {
		global $tsUser;
		$dato = db_exec('fetch_row', db_exec(array(__FILE__, __LINE__), 'query', 'SELECT COUNT(follow_id) AS total FROM u_follows WHERE f_id= \''.(int)$temaid.'\' AND f_type = \'5\' AND f_user =\''.(int)$tsUser->uid.'\''));
		if($dato[0] != 0) {
			return true;
		} else {
			return false;
		}
	}
	
	// Subir imagen de comunidad
	function uploadImagen($file, $comid, $type = 1) {
		global $tsCore;		
		$error = $this->validImagen($file);
        if(!empty($error)){
            return $error;
        } else {
			// Para el avatar de la comunidad
			if($type == 1) {
				$this->mod_history($comid, 4, $comid);
				// Datos
				$source = $file['tmp_name'];	
				$nuevo_ancho = 120;
				$nuevo_alto = 120;
				// Dimensiones originales
				list($ancho, $alto) = getimagesize($source);
				// Creamos la imagen
				$thumb = imagecreatetruecolor($nuevo_ancho, $nuevo_alto);
				$tipo = getimagesize($source);
				switch ($tipo['mime']) {
					case "image/jpeg":
						$img = imagecreatefromjpeg($source);
						break;
					case "image/png":
						$img = imagecreatefrompng($source);
						break;
					case "image/gif":
						$img = imagecreatefromgif($source);
						break;
				}
				imagecopyresized($thumb, $img, 0, 0, 0, 0, $nuevo_ancho, $nuevo_alto, $ancho, $alto);
				// Guardamos en el servidor
				$name = $name = 'c_'.(int)$comid.'.jpg';
				$root = TS_FILES.'uploads/'.$name;
				if(imagejpeg($thumb,$root,100)) return '1: '.$tsCore->settings['url'].'/files/uploads/'.$name;
				else return '0: No se pudo subir la imagen';
				// Limpiamos
				imagedestroy($img);
				imagedestroy($thumb);				
			// Para el fondo
			} elseif($type == 2) {
				$name = 'c_'.(int)$comid.'.jpg';
				$root = TS_FILES.'uploads/'.$name;
				copy($file,$root);
			} elseif($type == 3) {
				$this->mod_history($comid, 5, $comid);
				$name = 'cf_'.(int)$comid.'.jpg';
				$root = TS_FILES.'uploads/'.$name;
				if(copy($file['tmp_name'],$root)) return '1: '.$tsCore->settings['url'].'/files/uploads/'.$name;
				else return '0: No se pudo subir la imagen';
			}
		}
	}
	function validImagen($file){
		// Permitido
		$max = 2097152;
		$types = array('png','gif','jpeg');
		// Se encontro el archivo?
		if(empty($file['name'])) return '0: No has seleccionado una imagen.';
		// Tipo de imagen permitida
		$type = explode('/',$file['type']);
		// Peso maximo
		if($file['size'] > $max) return '0: La imagen pesa mas de 2Mb';
		elseif(!in_array($type[1], $types)) return '0: No es una imagen.';
		// Todo bien
		return false;
    }
	
	// Notificar a los seguidores  de la comunidad, tema
	function setFollowNotificacion($notType, $f_type, $user_id, $obj_uno, $obj_dos = 0, $excluir){
		global $tsCore, $tsMonitor;
		# A todos los seguidores
		if($f_type == 1) $obj_uno = $user_id;
		# Quienes sigan la comunidad/tema		
		$query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT f_user FROM u_follows WHERE f_id = \''.(int)$obj_uno.'\' AND f_type = \''.(int)$f_type.'\'');
		$data = result_array($query);		
		//
		foreach($data as $key => $val){
			if(!in_array($val['f_user'],$excluir)){
        		$tsMonitor->setNotificacion($notType, $val['f_user'], $user_id, $obj_dos);
			}
		}
		//
		return true;
	}
	
	// Notificar al autor del tema, citados y seguidores del tema
	function quoteNoti($temaid, $t_user, $cid, $comentario){
        global $tsCore, $tsUser, $tsMonitor;
        $ids = array();
        $total = 0;
        //
        preg_match_all("/\[quote=(.*?)\]/is",$comentario,$users);
        //
        if(!empty($users[1])) {
            foreach($users[1] as $user){
                # DATOS
                $udata = explode('|',$user);
                if(!is_array($udata)) {
                    $user = $user;   
                    $lcid = $cid;
                }
                else {
                    $user = $udata[0];
                    $lcid = (int) $udata[1];
                }
                # COMPROBAR
                if($user != $tsUser->nick){
                    $uid = $tsUser->getUserID($tsCore->setSecure($user));
                    if(!empty($uid) && $uid != $tsUser->uid && !in_array($uid, $ids)){
                        $ids[] = $uid;
                        $tsMonitor->setNotificacion(53, $uid, $tsUser->uid, $temaid, $lcid, $cid);
                    }
                    ++$total;
                }
            }
        }
	  	// AGREGAR AL MONITOR DEL DUEÑO DEL POST SI NO FUE CITADO
        if(!in_array($post_user, $ids)){
	  	    $tsMonitor->setNotificacion(51, $t_user, $tsUser->uid, $temaid);
        }
        // ENVIAR NOTIFICAIONES A LOS Q SIGUEN EL POST :D
        // PERO NO A LOS QUE CITARON :)
        $this->setFollowNotificacion(52, 5, $tsUser->uid, $temaid, $temaid, $ids);
        // 
        return true;
    }
	
	// Historial de moderacion
	function mod_history($h_for, $h_type, $h_comid, $h_razon = '-') {
		global $tsCore, $tsUser;
		
		// Tipos de moderacion
		#1 Editar tema
		#2 Eliminar tema
		#3 Reactivar tema
		#4 Cambio de avatar comunidad
		#5 Cambio de fondo comunidad
		#6 Editar comunidad
		#7 Suspension de usuario de comunidad
		#8 Reactivacion de usuario de comunidad
		
		// Segun el tipo de moderacion, sacar el autor
		switch($h_type) {
			case 1:
			case 2:
			case 3:
				$dato = db_exec('fetch_assoc', db_exec(array(__FILE__, __LINE__), 'query', 'SELECT t_autor FROM c_temas WHERE t_id = \''.(int)$h_for.'\' LIMIT 1'));
				$autor = $dato['t_autor'];
				break;
			case 4:
			case 5:
			case 6:
				$dato = db_exec('fetch_assoc', db_exec(array(__FILE__, __LINE__), 'query', 'SELECT c_autor FROM c_comunidades WHERE c_id = \''.(int)$h_comid.'\' LIMIT 1'));
				$autor = $dato['c_autor'];
				break;
			default:
				$autor = 0;
				break;
		}
		
		// Solo es moderacion si el autor es diferente del mod :nomedigas:
		if($autor != $tsUser->uid) {
			db_exec(array(__FILE__, __LINE__), 'query', 'INSERT INTO c_historial (h_for, h_mod, h_type, h_comid, h_razon, h_date) VALUES (\''.(int)$h_for.'\', \''.$tsUser->uid.'\', \''.$h_type.'\', \''.(int)$h_comid.'\', \''.$h_razon.'\', \''.time().'\')');
		}
		return true;
	}
	
	// El usuario está baneado?
	function is_banned($userid, $comid) {
		$dato = db_exec('fetch_assoc', db_exec(array(__FILE__, __LINE__), 'query', 'SELECT ban_id FROM c_baneados WHERE ban_user = \''.(int)$userid.'\' AND ban_comunidad = \''.(int)$comid.'\''));
		if(empty($dato['ban_id'])) return false;
		else return true;
	}
	
	/******************************************************************************************************/
	/**********************************************COMUNIDADES*********************************************/
	/******************************************************************************************************/
	
	// Obtener categorías
	function getCats() {
	   $array = result_array(db_exec(array(__FILE__, __LINE__), 'query', 'SELECT cid, c_nombre, c_seo FROM c_categorias ORDER BY c_nombre ASC'));
	   return $array;
	}
	
	// Obtener subcategorias de la categoria
	function getSubcats($cat_id) { 
		$array = result_array(db_exec(array(__FILE__, __LINE__), 'query', 'SELECT sid, s_nombre FROM c_subcategorias WHERE s_type = \''.(int)$cat_id.'\' ORDER BY sid ASC'));
		if(count($array) > 0) return $array;
		else return 'No hay subcategor&iacute;as.';
	}
	
	// Agregar nueva comunidad
	function nueva_comunidad() {
		global $tsCore, $tsUser, $tsActividad;
		if($tsUser->is_member) {
			// ANTI FLOOD
			$tsCore->antiFlood();
			$dato = array (
				'fecha' => time(),
				'nombre' => $tsCore->setSecure($tsCore->parseBadWords($_POST['nombre']), true),
				'ncorto' => $tsCore->setSeo($tsCore->setSecure($_POST['ncorto'], true)),
				'cat' => intval($_POST['categoria']),
				'subcat' => intval($_POST['subcategoria']),
				'pais' => $tsCore->setSecure($_POST['pais']),	
				'desc' => $tsCore->setSecure($_POST['descripcion']),			
				'acceso' => empty($_POST['acceso']) ? 0 : intval($_POST['acceso']),
				'permisos' => empty($_POST['permisos']) ? 0 : intval($_POST['permisos']),
			);
			// Vacios
			if(empty($dato['nombre'])) return 'Debes colocar un nombre.';
			if(empty($dato['ncorto'])) return 'Debes colocar un nombre corto.';
			if(empty($dato['cat'])) return 'Debes seleccionar una categor&iacute;a.';
			if(empty($dato['subcat'])) return 'Debes seleccionar una subcategor&iacute;a.';
			if(empty($dato['pais'])) return 'Debes seleccionar un pa&iacute;s.';
			if(empty($dato['desc'])) return 'Debes colocar una descripción.';
			// Existe la categoria?
			$cat = db_exec('fetch_assoc', db_exec(array(__FILE__, __LINE__), 'query', 'SELECT cid FROM c_categorias WHERE cid = \''.(int)$dato['cat'].'\' LIMIT 1'));
			if(empty($cat['cid'])) return 'La categor&iacute;a especificada no existe.';
			// Existe la subcategoria?
			$scat = db_exec('fetch_assoc', db_exec(array(__FILE__, __LINE__), 'query', 'SELECT sid FROM c_subcategorias WHERE sid = \''.(int)$dato['subcat'].'\' LIMIT 1'));
			if(empty($scat['sid'])) return 'La sub-categor&iacute;a especificada no existe.';
			// Nombre corto muy corto? xD
			if(strlen($dato['ncorto']) < 5) return 'El nombre corto debe ser mayor a 5 caracteres.';
			// Nombre corto en uso?
			$corto = db_exec('fetch_assoc', db_exec(array(__FILE__, __LINE__), 'query', 'SELECT c_id FROM c_comunidades WHERE c_nombre_corto = \''.$dato['ncorto'].'\''));
			if(!empty($corto['c_id']) || $dato['ncorto'] == 'mis-comunidades' || $dato['ncorto'] == 'mod-history' || $dato['buscar'] || $dato['favoritos'] || $dato['borradores']) return 'Nombre corto en uso o no disponible, prueba con otro.';
			// Validamos IP
			$_SERVER['REMOTE_ADDR'] = $_SERVER['X_FORWARDED_FOR'] ? $_SERVER['X_FORWARDED_FOR'] : $_SERVER['REMOTE_ADDR'];
			if(!filter_var($_SERVER['REMOTE_ADDR'], FILTER_VALIDATE_IP)) return 'Su ip no se pudo validar.';
			// Insertamos
			if(db_exec(array(__FILE__, __LINE__), 'query', 'INSERT INTO c_comunidades (c_autor, c_nombre, c_nombre_corto, c_categoria, c_sub_categoria, c_pais, c_descripcion, c_acceso, c_permisos, c_estado, c_miembros, c_fecha, c_ip)
				VALUES (
					\''.$tsUser->uid.'\',
					\''.$dato['nombre'].'\',
					\''.$dato['ncorto'].'\',
					\''.(int)$dato['cat'].'\',
					\''.$dato['subcat'].'\',
					\''.$dato['pais'].'\',
					\''.$dato['desc'].'\',
					\''.(int)$dato['acceso'].'\',
					\''.$dato['permisos'].'\',
					\'0\',
					\'1\',
					\''.$dato['fecha'].'\',
					\''.$_SERVER['REMOTE_ADDR'].'\'
				)')) {
				$comid = db_exec('insert_id');
				// Agregamos el miembro y propietario de la comu
				db_exec(array(__FILE__, __LINE__), 'query', 'INSERT INTO c_miembros (m_user, m_permisos, m_comunidad, m_fecha) VALUES (\''.$tsUser->uid.'\', \'5\', \''.(int)$comid.'\', \''.time().'\')');
				// Añadimos imagen default
				$c_seo = db_exec('fetch_assoc', db_exec(array(__FILE__, __LINE__), 'query', 'SELECT c_seo FROM c_categorias WHERE cid = \''.(int)$dato['cat'].'\' LIMIT 1'));
				$img = $tsCore->settings['images']."/com/c_".$c_seo['c_seo'].".png";
				$name = 'c_'.(int)$comid.'.jpg';
				$root = TS_FILES.'uploads/'.$name;
				copy($img,$root);
				// Actividad
				$tsActividad->setActividad(12, $comid);
				return $comid;
			} else return 'Ocurri&oacute; un error al crear la comunidad, int&eacute;ntalo m&aacute;s tarde';
		} else return 'Debes ser miembro para poder crear comunidades.';
	}
	
	// Editar comunidad
	function editar_comunidad($comid) {
		global $tsCore, $tsUser;
		// Existe la comunidad?
		if(!empty($comid)) {
			// Puedo editarla o tengo permisos?
			$permisos = $this->my_permiso($comid);
			$com = db_exec('fetch_assoc', db_exec(array(__FILE__, __LINE__), 'query', 'SELECT c_autor FROM c_comunidades WHERE c_id = \''.(int)$comid.'\' LIMIT 1'));
			if($permisos == 5 || $tsUser->is_admod || $com['c_autor'] == $tsUser->uid) {
				$dato = array (
					'nombre' => $tsCore->setSecure($tsCore->parseBadWords($_POST['nombre']), true),
					'cat' => intval($_POST['categoria']),
					'subcat' => intval($_POST['subcategoria']),
					'pais' => $tsCore->setSecure($_POST['pais']),	
					'desc' => $tsCore->setSecure($_POST['descripcion']),
					'color' => $tsCore->setSecure($_POST['back_color']),
					'repeat' => empty($_POST['back_repeat']) ? 0 : 1,
					'acceso' => empty($_POST['acceso']) ? 0 : intval($_POST['acceso']),
					'permisos' => empty($_POST['permisos']) ? 0 : intval($_POST['permisos']),
					'causa' => $tsCore->setSecure($_POST['causa']),
				);
				// Vacios
				if(empty($dato['nombre'])) return 'Debes colocar un nombre.';
				if(empty($dato['cat'])) return 'Debes seleccionar una categor&iacute;a.';
				if(empty($dato['subcat'])) return 'Debes seleccionar una subcategor&iacute;a.';
				if(empty($dato['pais'])) return 'Debes seleccionar un pa&iacute;s.';
				if(empty($dato['desc'])) return 'Debes colocar una descripción.';
				// Existe la categoria?
				$cat = db_exec('fetch_assoc', db_exec(array(__FILE__, __LINE__), 'query', 'SELECT cid FROM c_categorias WHERE cid = \''.(int)$dato['cat'].'\' LIMIT 1'));
				if(empty($cat['cid'])) return 'La categor&iacute;a especificada no existe.';
				// Existe la subcategoria?
				$scat = db_exec('fetch_assoc', db_exec(array(__FILE__, __LINE__), 'query', 'SELECT sid FROM c_subcategorias WHERE sid = \''.(int)$dato['subcat'].'\' LIMIT 1'));
				if(empty($scat['sid'])) return 'La sub-categor&iacute;a especificada no existe.';
				// Validamos IP
				$_SERVER['REMOTE_ADDR'] = $_SERVER['X_FORWARDED_FOR'] ? $_SERVER['X_FORWARDED_FOR'] : $_SERVER['REMOTE_ADDR'];
				if(!filter_var($_SERVER['REMOTE_ADDR'], FILTER_VALIDATE_IP)) return 'Su ip no se pudo validar.';
				// Actualizamos
				if(db_exec(array(__FILE__, __LINE__), 'query', 'UPDATE c_comunidades SET
					c_nombre = \''.$dato['nombre'].'\',
					c_categoria = \''.(int)$dato['cat'].'\',
					c_sub_categoria = \''.$dato['subcat'].'\',
					c_pais = \''.$dato['pais'].'\',
					c_descripcion = \''.$dato['desc'].'\',
					c_acceso = \''.(int)$dato['acceso'].'\',
					c_permisos = \''.$dato['permisos'].'\',
					c_back_color = \''.$dato['color'].'\',
					c_back_repeat = \''.(int)$dato['repeat'].'\'
					WHERE c_id = \''.(int)$comid.'\'')) {
					// Historial de moderacion
					if($com['c_autor'] != $tsUser->uid) {
						$this->mod_history($comid, 6, $comid, $dato['causa']);
					}
					//
					return $comid;
				} else return 'Ocurri&oacute; un error al editar la comunidad, int&eacute;ntalo m&aacute;s tarde';
			} else return 'Tu rango no te permite realizar esta operaci&oacute;n.';
		} else return 'La comunidad no existe o est&aacute; suspendida';
	}
	
	// Eliminar comunidad
	function delComunidad() {
		global $tsCore, $tsUser;
		// Obtenemos datos
		$comid = isset($_GET['comid']) ? $tsCore->setSecure($_GET['comid']) : $tsCore->setSecure($_POST['comid']);
		$data = db_exec('fetch_assoc', db_exec(array(__FILE__, __LINE__), 'query', 'SELECT c_id, c_autor, c_estado, c_nombre FROM c_comunidades WHERE c_id = \''.(int)$comid.'\' LIMIT 1'));
		if(!empty($data['c_id'])) {
			if(isset($_POST['susp'])) {
				if($tsUser->is_admod) {
					// Moderadores solo pueden ponerla oculta o reactivarla
					db_exec(array(__FILE__, __LINE__), 'query', 'UPDATE c_comunidades SET c_estado = \''.($data["c_estado"] == 0 ? 1 : 0).'\' WHERE c_id = \''.(int)$comid.'\' LIMIT 1');
					return '1: La comunidad <b>'.$data['c_nombre'].'</b> ha sido '.($data["c_estado"] == 0 ? 'suspendida' : 'reactivada').'.';
				} else return '0: Tu rango no te permite realizar esta operaci&oacute;n.';				
			} else {
				// Es autor o tiene permisos?
				if($data['c_autor'] == $tsUser->uid || $tsUser->is_admod == 1) {
					// Consultamos los temas de la comunidad
					$temas = result_array(db_exec(array(__FILE__, __LINE__), 'query', 'SELECT t_id FROM c_temas WHERE t_comunidad = \''.(int)$comid.'\''));
					// Eliminamos registros de los temas de la comunidad
					$i = 0;
					foreach($temas as $dato) {
						db_exec(array(__FILE__, __LINE__), 'query', 'DELETE FROM c_favoritos WHERE f_tema = \''.(int)$dato['t_id'].'\'');
						db_exec(array(__FILE__, __LINE__), 'query', 'DELETE FROM c_votos WHERE v_for = \''.(int)$dato['t_id'].'\'');
						db_exec(array(__FILE__, __LINE__), 'query', 'DELETE FROM c_respuestas WHERE r_tema = \''.(int)$dato['t_id'].'\'');
						$i++;
					}
					// Borramos registros de mas...
					db_exec(array(__FILE__, __LINE__), 'query', 'DELETE FROM c_baneados WHERE ban_comunidad = \''.(int)$comid.'\'');
					db_exec(array(__FILE__, __LINE__), 'query', 'DELETE FROM c_historial WHERE h_comid = \''.(int)$comid.'\'');
					db_exec(array(__FILE__, __LINE__), 'query', 'DELETE FROM c_miembros WHERE m_comunidad = \''.(int)$comid.'\'');
					db_exec(array(__FILE__, __LINE__), 'query', 'DELETE FROM c_temas WHERE t_comunidad = \''.(int)$comid.'\'');
					db_exec(array(__FILE__, __LINE__), 'query', 'DELETE FROM c_comunidades WHERE c_id = \''.(int)$comid.'\' LIMIT 1');
					// Listo
					return '1: La comunidad <b>'.$data['c_nombre'].'</b> ha sido eliminada permanentemente';
				}
			}
		} else return '0: La comunidad que intentas eliminar no existe.';
	}
	
	// Obtener comunidad
	function get_comunidad($nombre) {
		global $tsCore, $tsUser;
		// Existe la comunidad?
		$comid = $this->comExiste($nombre);
		if($comid) {
			// Informacion de la comunidad
			$q1 = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT *, user_name FROM c_comunidades LEFT JOIN u_miembros ON user_id = c_autor WHERE c_id = \''.(int)$comid.'\' LIMIT 1');
			$data['com'] = db_exec('fetch_assoc', $q1);
			// Verificamos el tipo...
			if($data['com']['c_acceso'] == 2 && !$tsUser->is_member) return 'Esta comunidad es privada, solo usuarios registrados pueden acceder a ella.';
			// Categoria y subcategoria
			$q2 = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT s.s_nombre, c.c_nombre, c.c_seo FROM c_subcategorias AS s LEFT JOIN c_categorias AS c ON c.cid = s.s_type WHERE s.sid = \''.$data['com']['c_sub_categoria'].'\' LIMIT 1');
			$data['com']['cat'] = db_exec('fetch_assoc', $q2);			
			// Temas y Stickys
			$data['temas'] = $this->getComTemas($comid);
			// Es miembro?
			if($this->es_miembro($comid)) {
				$data['com']['es_miembro'] = true;
			} else {
				$data['com']['es_miembro'] = false;
			}
			// Es seguidor?
			if($this->es_seguidor_com($comid)) {
				$data['com']['es_seguidor'] = true;
			} else {
				$data['com']['es_seguidor'] = false;
			}
			// Comentarios recientes
			$q5 = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT r.r_id, t.t_id, t.t_titulo, u.user_name FROM c_respuestas AS r LEFT JOIN c_temas AS t ON t.t_id = r.r_tema LEFT JOIN u_miembros AS u ON user_id = r.r_autor WHERE t.t_comunidad = \''.(int)$comid.'\' '.($tsUser->is_admod && $tsCore->settings['c_see_mod'] == 1 ? '' : '&& u.user_activo = \'1\' && u.user_baneado = \'0\' && t.t_estado = \'0\' && r.r_estado = \'0\'').' ORDER BY r.r_fecha DESC LIMIT 10');
			$data['respuestas'] = result_array($q5);
			// Ultimos miembros
			$q6 = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT m_user, user_name FROM c_miembros LEFT JOIN u_miembros ON user_id = m_user WHERE m_comunidad = \''.(int)$comid.'\' AND m_permisos > 0 ORDER BY m_fecha DESC LIMIT 14');
			$data['miembros'] = result_array($q6);
			// Top temas
			include("c.tops.php");
			$tsTops =& tsTops::getInstance();
			// SEMANA
			$data['top']['semana'] = $this->getTopTemas($tsTops->setTime(3), $comid);
			// MES
			$data['top']['mes'] = $this->getTopTemas($tsTops->setTime(4), $comid);
			// HISTÓRICO
			$data['top']['historico'] = $this->getTopTemas($tsTops->setTime(5), $comid);
			// Staff
			$q7 = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT m_user, user_name, m_permisos FROM c_miembros LEFT JOIN u_miembros ON user_id = m_user WHERE m_comunidad = \''.(int)$comid.'\' AND m_permisos > \'3\' ORDER BY m_permisos ASC');			
			$array = result_array($q7);
			// Staff online
			$is_online = (time() - ($tsCore->settings['c_last_active'] * 60));			
			$i = 0;
			foreach($array as $dato) {
				$data['staff'][$i] = $dato;
				$data['staff'][$i]['on'] = db_exec('fetch_assoc', db_exec(array(__FILE__, __LINE__), 'query', 'SELECT user_lastactive FROM u_miembros WHERE user_id = \''.(int)$dato['m_user'].'\''));
				if($data['staff'][$i]['on']['user_lastactive'] > $is_online) {
					$data['staff'][$i]['is_on'] = true;
				} else {
					$data['staff'][$i]['is_on'] = false;
				}
				$i++;
			}
			// Mis permisos
			$data['com']['mi_rango'] = $this->my_permiso($comid);
			//
			return $data;
		} else return 'La comunidad no existe o est&aacute; suspendida.';
	}
	
	// Ultimos temas de la comunidad
	function getComTemas($comid) {
		global $tsCore, $tsUser;
		// Obtenemos variables
		$page = empty($_POST['page']) ? 1 : $_POST['page'];		
		// Total
		$sql = db_exec('fetch_row', db_exec(array(__FILE__, __LINE__), 'query', 'SELECT COUNT(t.t_id) AS total FROM c_temas AS t LEFT JOIN u_miembros AS u ON t.t_autor = u.user_id WHERE t_comunidad = \''.(int)$comid.'\' '.($tsUser->is_admod && $tsCore->settings['c_see_mod'] == 1 ? '' : '&& u.user_activo = \'1\' && u.user_baneado = \'0\' && t.t_estado = \'0\'')));
		$data['total'] = $sql[0];		
		// Maximo a mostrar
		$max = 15;
		$start = empty($_POST['page']) ? 0 : (int)(($_POST['page']-1)*$max);
		// Paginas
		$tsPages = ceil($data['total'] / $max);
		$data['pages'] = array(
			'current' => $page,
			'pages' => $tsPages,
			'section' => $tsPages + 1,
			'prev' => $page - 1,
			'next' => $page + 1,
			'van' => $page * $max,
			'max' => $tsCore->setMaximos($max, $data['total']),
		);
		// Temas
		$q3 = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT t_estado, t_id, t_titulo, t_autor, t_fecha, t_respuestas, t_votos_pos, t_votos_neg, user_name FROM c_temas LEFT JOIN u_miembros ON user_id = t_autor WHERE t_comunidad = \''.(int)$comid.'\' AND t_sticky = \'0\' ORDER BY t_fecha DESC LIMIT '.$start.','.$max);
		$data['data'] = result_array($q3);
		// Stickys
		$q4 = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT t_id, t_titulo, t_autor, t_fecha, t_respuestas, t_votos_pos, t_votos_neg, user_name FROM c_temas LEFT JOIN u_miembros ON user_id = t_autor WHERE t_comunidad = \''.(int)$comid.'\' AND t_sticky = \'1\' ORDER BY t_fecha DESC');
		$data['sticky'] = result_array($q4);
		return $data;
	}
	
	// Obtener datosd de comunidad para editar
	function datosCom($comid) {
		global $tsCore, $tsUser;
		// Existe la comunidad?
		if(!empty($comid)) {
			// Puedo editarla o tengo permisos?
			$permisos = $this->my_permiso($comid);
			if($permisos == 5 || $tsUser->is_admod) {
				$data = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT * FROM c_comunidades WHERE c_id = \''.(int)$comid.'\' LIMIT 1');
				return db_exec('fetch_assoc', $data);
			} else return 'Tu rango no te permite realizar esta operaci&oacute;n.';
		} else return 'La comunidad que intentas editar no existe o fu&eacute; eliminada.';
	}
	
	// Comunidades recientes en la home
	function getComRecentHome() {
		global $tsCore, $tsUser;
		$query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT c_estado, c_nombre, c_nombre_corto, c_estado FROM c_comunidades LEFT JOIN u_miembros ON user_id = c_autor WHERE c_id > \'0\' '.($tsUser->is_admod && $tsCore->settings['c_see_mod'] == 1 ? '' : '&& user_activo = \'1\' && user_baneado = \'0\' && c_estado = \'0\'').' ORDER BY c_fecha DESC LIMIT 10');
		$data = result_array($query);
		return $data;
	}
	
	// Previsualizar tema
	function getPreview(){
		global $tsCore;
		//
		$titulo = $tsCore->setSecure($_POST['titulo'], true);
		$cuerpo = $tsCore->setSecure($_POST['cuerpo'], true);
		//
		return array('titulo' => $titulo, 'cuerpo' => $tsCore->parseBadWords($tsCore->parseBBCode($cuerpo), true));
	}
	
	// Gurdar nuevo tema
	function nuevo_tema($comid) {
		global $tsCore, $tsUser, $tsActividad;
		$permisos = $this->my_permiso($comid);
		if($permisos >= 3 || $tsUser->is_admod) {
			// ANTI FLOOD
			$tsCore->antiFlood();		
			$dato = array (
				'fecha' => time(),
				'titulo' => $tsCore->setSecure($tsCore->parseBadWords($_POST['titulo']), true),
				'cuerpo' => $tsCore->setSecure($tsCore->parseBadWords($_POST['cuerpo']), true),		
				'cerrado' => empty($_POST['cerrado']) ? 0 : 1,
				'sticky' => (!empty($_POST['sticky']) && $permisos > 4) ? 1 : 0,
			);
			// Vacios
			if(empty($dato['titulo'])) return 'Debes colocar un titulo a tu tema.';
			if(empty($dato['cuerpo'])) return 'Debes colocar el contenido de tu tema.';
			// Validamos IP
			$_SERVER['REMOTE_ADDR'] = $_SERVER['X_FORWARDED_FOR'] ? $_SERVER['X_FORWARDED_FOR'] : $_SERVER['REMOTE_ADDR'];
			if(!filter_var($_SERVER['REMOTE_ADDR'], FILTER_VALIDATE_IP)) return 'Su ip no se pudo validar.';
			// Insertamos
			if(db_exec(array(__FILE__, __LINE__), 'query', 'INSERT INTO c_temas (t_titulo, t_cuerpo, t_comunidad, t_autor, t_fecha, t_sticky, t_cerrado, t_estado, t_ip)
				VALUES (
					\''.$dato['titulo'].'\',
					\''.$dato['cuerpo'].'\',
					\''.(int)$comid.'\',
					\''.$tsUser->uid.'\',
					\''.$dato['fecha'].'\',
					\''.$dato['sticky'].'\',
					\''.$dato['cerrado'].'\',
					\'0\',
					\''.$_SERVER['REMOTE_ADDR'].'\'
				)')) {
				$temaid = db_exec('insert_id');
				// Sumar el tema a la comunidad
				db_exec(array(__FILE__, __LINE__), 'query', 'UPDATE c_comunidades SET c_temas = c_temas+1 WHERE c_id = \''.(int)$comid.'\'');
				// Notificar a los seguidores
				$this->setFollowNotificacion(50, 4, $tsUser->uid, $comid, $temaid);
				// Actividad
				$tsActividad->setActividad(13, $temaid);
				return $temaid;
			} else return 'Ocurri&oacute; un error al crear el tema, int&eacute;ntalo m&aacute;s tarde';
		} else return 'Tu rango no te permite realizar esta operaci&oacute;n.';
	}
	
	// Obtener datos de tema para editar
	function datosTema($comid, $temaid) {
		global $tsCore, $tsUser;
		// Existe el tema?
		$tema = db_exec('fetch_assoc', db_exec(array(__FILE__, __LINE__), 'query', 'SELECT t_id, t_autor FROM c_temas WHERE t_id = \''.(int)$temaid.'\' LIMIT 1'));
		if(empty($tema['t_id'])) return 'El tema que intentas editar no existe.';
		$permisos = $this->my_permiso($comid);
		if($tema['t_autor'] == $tsUser->uid || $permisos >= 4 || $tsUser->is_admod) {
			$data = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT t_id, t_titulo, t_cuerpo, t_sticky, t_cerrado, t_autor FROM c_temas WHERE t_id = \''.(int)$temaid.'\' LIMIT 1');
			return db_exec('fetch_assoc', $data);
		} else return 'Tu rango no te permite realizar esta operaci&oacute;n.';
	}
	
	// Editar tema
	function editar_tema($comid, $temaid) {
		global $tsCore, $tsUser;
		$tema = db_exec('fetch_assoc', db_exec(array(__FILE__, __LINE__), 'query', 'SELECT t_id, t_comunidad, t_autor FROM c_temas WHERE t_id = \''.(int)$temaid.'\' LIMIT 1'));
		if(empty($tema['t_id'])) return 'El tema que intentas editar no existe.';
		$permisos = $this->my_permiso($comid);
		if($tema['t_autor'] == $tsUser->uid || $permisos >= 4 || $tsUser->is_admod) {		
			$dato = array (
				'titulo' => $tsCore->setSecure($tsCore->parseBadWords($_POST['titulo']), true),
				'cuerpo' => $tsCore->setSecure($tsCore->parseBadWords($_POST['cuerpo']), true),
				'razon' => $tsCore->setSecure($_POST['razon'], true),	
				'cerrado' => empty($_POST['cerrado']) ? 0 : 1,
				'sticky' => empty($_POST['sticky']) ? 0 : 1,
			);
			// Vacios
			if(empty($dato['titulo'])) return 'Debes colocar un titulo a tu tema.';
			if(empty($dato['cuerpo'])) return 'Debes colocar el contenido de tu tema.';
			// Validamos IP
			$_SERVER['REMOTE_ADDR'] = $_SERVER['X_FORWARDED_FOR'] ? $_SERVER['X_FORWARDED_FOR'] : $_SERVER['REMOTE_ADDR'];
			if(!filter_var($_SERVER['REMOTE_ADDR'], FILTER_VALIDATE_IP)) return 'Su ip no se pudo validar.';
			// Insertamos
			if(db_exec(array(__FILE__, __LINE__), 'query', 'UPDATE c_temas SET
					t_titulo = \''.$dato['titulo'].'\',
					t_cuerpo = \''.$dato['cuerpo'].'\',
					t_sticky = \''.$dato['sticky'].'\',
					t_cerrado = \''.$dato['cerrado'].'\'
				WHERE t_id = \''.$temaid.'\'')) {
				$this->mod_history($temaid, 1, $tema['t_comunidad'], $dato['razon']);
				return '1: Tema editado correctamente.';
			} else return 'Ocurri&oacute; un error al crear el tema, int&eacute;ntalo m&aacute;s tarde';
		} else return 'Tu rango no te permite realizar esta operaci&oacute;n.';
	}
	
	// Estadisticas
	function getStats(){
		global $tsCore, $tsUser;
		$return = db_exec('fetch_assoc', db_exec(array(__FILE__, __LINE__), 'query', 'SELECT stats_comunidades, stats_temas, stats_respuestas FROM w_stats'));
	
		$q1 = db_exec('fetch_row', db_exec(array(__FILE__, __LINE__), 'query', 'SELECT COUNT(c_id) AS total FROM c_comunidades WHERE c_estado = \'0\''));
		$q2 = db_exec('fetch_row', db_exec(array(__FILE__, __LINE__), 'query', 'SELECT COUNT(t_id) AS total FROM c_temas LEFT JOIN c_comunidades ON c_id = t_comunidad WHERE t_estado = \'0\' AND c_estado = \'0\''));
		$q3 = db_exec('fetch_row', db_exec(array(__FILE__, __LINE__), 'query', 'SELECT COUNT(r_id) AS total FROM c_respuestas LEFT JOIN c_temas ON t_id = r_tema LEFT JOIN c_comunidades ON c_id = t_comunidad WHERE r_estado = \'0\' AND t_estado = \'0\' AND c_estado = \'0\''));
		
		$return['stats_comunidades'] = $q1[0];
		$return['stats_temas'] = $q2[0];
		$return['stats_respuestas'] = $q3[0];
		// PARA SABER SI ESTA ONLINE
		$is_online = (time() - ($tsCore->settings['c_last_active'] * 60));
		// USUARIOS ONLINE - COMPROBAMOS SI CONTAMOS A TODOS LOS USUARIOS O SOLO A REGISTRADOS
		if(empty($tsCore->settings['c_count_guests'])){
			$cueri = db_exec('fetch_row', db_exec(array(__FILE__, __LINE__), 'query', 'SELECT COUNT(user_id) AS u FROM `u_miembros` WHERE `user_lastactive` > \''.$is_online.'\''));
		}else{
			$cueri = db_exec('fetch_row', db_exec(array(__FILE__, __LINE__), 'query', 'SELECT COUNT(DISTINCT `session_ip`) AS s FROM `u_sessions` WHERE `session_time` > \''.$is_online.'\''));
		}		
		$return['stats_online'] = $cueri[0];
		// Actualizamos
		db_exec(array(__FILE__, __LINE__), 'query', 'UPDATE w_stats SET stats_comunidades = \''.$return['stats_comunidades'].'\', stats_temas = \''.$return['stats_temas'].'\', stats_respuestas = \''.$return['stats_respuestas'].'\'');
		//
		return $return;
	}
	
	// Ultimos temas en la home
	function getLastTemas($comunidad = NULL) {
		global $tsCore, $tsUser;
		if(!empty($comunidad)) {
			$com = db_exec('fetch_assoc', db_exec(array(__FILE__, __LINE__), 'query', 'SELECT cid FROM c_categorias WHERE c_seo = \''.$tsCore->setSecure($comunidad).'\' LIMIT 1'));
			if($com['cid'] > 0) {
				$c_where = 'AND c.c_categoria = \''.(int)$com['cid'].'\'';
			}
		} else {
			$c_where = '';
		}
		// Total de temas
		$q1 = db_exec('fetch_row', db_exec(array(__FILE__, __LINE__), 'query', 'SELECT COUNT(t.t_id) AS total FROM c_temas AS t LEFT JOIN u_miembros AS u ON t.t_autor = u.user_id WHERE t.t_id > \'0\' '.($tsUser->is_admod && $tsCore->settings['c_see_mod'] == 1 ? '' : 'AND u.user_activo = \'1\' && u.user_baneado = \'0\' && t.t_estado = \'0\'')));
		$data['total'] = $q1[0];
		// Maximo a mostrar
		$max = 20;
		$limit = $tsCore->setPageLimit($max,false,$data['total']);
		$data['pages'] = $tsCore->getPages($data['total'], $max);
		//
		$query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT c.c_nombre, c.c_nombre_corto, c.c_sub_categoria, t.t_estado, t.t_id, t.t_titulo, t.t_autor, u.user_name FROM c_temas AS t LEFT JOIN c_comunidades AS c ON c.c_id = t.t_comunidad LEFT JOIN u_miembros AS u ON u.user_id = t.t_autor WHERE t.t_id > \'0\' '.($tsUser->is_admod && $tsCore->settings['c_see_mod'] == 1 ? '' : 'AND u.user_activo = \'1\' AND u.user_baneado = \'0\' AND t.t_estado = \'0\' AND c.c_estado = \'0\'').' '.$c_where.' ORDER BY t.t_fecha DESC LIMIT '.$limit);
		$array = result_array($query);
		// Para la categoria...
		$i = 0;
		foreach($array as $dato) {
			$data['data'][$i] = $dato;
			$data['data'][$i]['sub_cat'] = db_exec('fetch_assoc', db_exec(array(__FILE__, __LINE__), 'query', 'SELECT c_seo FROM c_subcategorias LEFT JOIN c_categorias ON cid = s_type WHERE sid = \''.$dato['c_sub_categoria'].'\''));
			$i++;
		}
		return $data;		
	}
	
	// Comentarios recientes en la home
	function getComensRecent() {
		global $tsCore, $tsUser;
		$query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT r.r_estado, c.c_estado, t.t_estado, r.r_estado, r.r_id, t.t_id, t.t_titulo, c.c_nombre_corto, u.user_name FROM c_respuestas AS r LEFT JOIN c_temas AS t ON t.t_id = r.r_tema LEFT JOIN c_comunidades AS c ON c.c_id = t.t_comunidad LEFT JOIN u_miembros AS u ON user_id = r.r_autor WHERE r.r_id > \'0\' '.($tsUser->is_admod && $tsCore->settings['c_see_mod'] == 1 ? '' : '&& u.user_activo = \'1\' && u.user_baneado = \'0\' && c.c_estado = \'0\' && r.r_estado = \'0\' && t.t_estado = \'0\'').' ORDER BY r.r_fecha DESC LIMIT 10');
		$array = result_array($query);
		return $array;
	}
	
	//Obtener datos del tema
	function getTema() {
		global $tsCore, $tsUser;
		$temaid = $tsCore->setSecure($_GET['temaid']);
		//
		$query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT t.*, c.c_nombre_corto FROM c_temas AS t LEFT JOIN c_comunidades AS c ON c.c_id = t.t_comunidad WHERE t.t_id = \''.(int)$temaid.'\'');
		$data['tema'] = db_exec('fetch_assoc', $query);
		// Existe?
		if(!empty($data['tema']['t_id'])) {
			if($data['tema']['t_estado'] == 0 || $data['tema']['t_estado'] == 1 && $tsUser->is_admod) {
				$data['tema']['t_cuerpo'] = $tsCore->parseBadWords($tsCore->parseBBCode($data['tema']['t_cuerpo']), true);
				$data['tema']['t_fecha_all'] = strftime("%d/%m/%Y %H:%M",$data['tema']['t_fecha']);
				$this->setVisitaTema($data['tema']['t_id']);
				// Autor
				$data['autor'] = $this->getAutor($data['tema']['t_autor']);
				// Esta en mis favoritos?
				$fav = db_exec('fetch_row', db_exec(array(__FILE__, __LINE__), 'query', 'SELECT COUNT(fav_id) AS total FROM c_favoritos WHERE f_tema = \''.(int)$temaid.'\' AND f_user = \''.$tsUser->uid.'\''));
				if($fav[0] != 0) {
					$data['tema']['mi_fav'] = true;
				} else {
					$data['tema']['mi_fav'] = false;
				}
				// Es seguidor?
				if($this->es_seguidor_tema($temaid)) {
					$data['tema']['es_seguidor'] = true;
				} else {
					$data['tema']['es_seguidor'] = false;
				}
				return $data;
			} else return 'El tema ha sido eliminado.';
		} else return 'El tema no existe o ha sido eliminado.';
	}
	
	// Autor del tema
	function getAutor($user_id){
	   global $tsUser, $tsCore;
        // DATOS DEL AUTOR
        $query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT u.user_id, u.user_name, u.user_rango, u.user_puntos, u.user_lastactive, u.user_last_ip, u.user_activo, u.user_baneado, p.user_pais, p.user_sexo, p.user_firma FROM u_miembros AS u LEFT JOIN u_perfil AS p ON u.user_id = p.user_id WHERE u.user_id = \''.(int)$user_id.'\' LIMIT 1');
        $data = db_exec('fetch_assoc', $query);
        
		$data['user_seguidores'] = db_exec('num_rows', db_exec(array(__FILE__, __LINE__), 'query', 'SELECT follow_id FROM u_follows WHERE f_id = \''.(int)$user_id.'\' && f_type = \'1\''));
		$data['user_comentarios'] = db_exec('num_rows', db_exec(array(__FILE__, __LINE__), 'query', 'SELECT r_id FROM c_respuestas WHERE r_autor = \''.(int)$user_id.'\' && r_estado = \'0\''));
		$data['user_temas'] = db_exec('num_rows', db_exec(array(__FILE__, __LINE__), 'query', 'SELECT t_id FROM c_temas WHERE t_autor = \''.(int)$user_id.'\' && t_estado = \'0\''));
		
		// RANGOS DE ESTE USUARIO
		$query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT r_name, r_color, r_image FROM u_rangos WHERE rango_id = \''.$data['user_rango'].'\' LIMIT 1');
		$data['rango'] = db_exec('fetch_assoc', $query);
		
        // STATUS
        $is_online = (time() - ($tsCore->settings['c_last_active'] * 60));
        $is_inactive = (time() - (($tsCore->settings['c_last_active'] * 60) * 2)); // DOBLE DEL ONLINE
        if($data['user_lastactive'] > $is_online) $data['status'] = array('t' => 'Usuario Online', 'css' => 'online');
        elseif($data['user_lastactive'] > $is_inactive) $data['status'] = array('t' => 'Usuario Inactivo', 'css' => 'inactive');
        else $data['status'] = array('t' => 'Usuario Offline', 'css' => 'offline');
		// PAIS
		include(TS_EXTRA."datos.php"); // Fix 10/06/2013
		$data['pais'] = array('icon' => strtolower($data['user_pais']),'name' => $tsPaises[$data['user_pais']]);
		// FOLLOWS
		if($data['user_seguidores'] > 0){
			$query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT follow_id FROM u_follows WHERE f_id = \''.(int)$user_id.'\' AND f_user = \''.$tsUser->uid.'\' AND f_type = \'1\'');
			$data['follow'] = db_exec('num_rows', $query);
			
		}
		// RETURN
		return $data;
	}
	
	// Obtener respuestas del tema
	function getRespuestas($ispage = false) {
		global $tsCore, $tsUser;
		// Obtenemos variables
		if($ispage) $temaid = $tsCore->setSecure($_POST['temaid']);
		else $temaid = $tsCore->setSecure($_GET['temaid']);
		$page = empty($_POST['page']) ? 1 : $_POST['page'];		
		// Total
		$sql = db_exec('fetch_row', db_exec(array(__FILE__, __LINE__), 'query', 'SELECT COUNT(r.r_id) AS total FROM c_respuestas AS r LEFT JOIN u_miembros AS u ON u.user_id = r.r_autor LEFT JOIN c_temas AS t ON t.t_id = r.r_tema LEFT JOIN c_comunidades AS c ON c.c_id = t.t_comunidad WHERE r_tema = \''.(int)$temaid.'\' '.($tsUser->is_admod && $tsCore->settings['c_see_mod'] == 1 ? '' : '&& u.user_activo = \'1\' && u.user_baneado = \'0\' && c.c_estado = \'0\' && r.r_estado = \'0\' && t.t_estado = \'0\'')));
		$data['total'] = $sql[0];		
		// Maximo a mostrar
		$max = $tsCore->settings['c_max_com'];
		$start = empty($_POST['page']) ? 0 : (int)(($_POST['page']-1)*$max);
		// Paginas
		$tsPages = ceil($data['total'] / $max);
		$data['pages'] = array(
			'current' => $page,
			'pages' => $tsPages,
			'section' => $tsPages + 1,
			'prev' => $page - 1,
			'next' => $page + 1,
			'van' => $page * $max,
			'max' => $tsCore->setMaximos($max, $data['total']),
		);		
		//
		$query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT r.*, u.user_name FROM c_respuestas AS r LEFT JOIN u_miembros AS u ON u.user_id = r.r_autor LEFT JOIN c_temas AS t ON t.t_id = r.r_tema LEFT JOIN c_comunidades AS c ON c.c_id = t.t_comunidad WHERE r_tema = \''.(int)$temaid.'\' '.($tsUser->is_admod && $tsCore->settings['c_see_mod'] == 1 ? '' : '&& u.user_activo = \'1\' && u.user_baneado = \'0\' && c.c_estado = \'0\' && r.r_estado = \'0\' && t.t_estado = \'0\'').' ORDER BY r_id LIMIT '.$start.','.$max);
		$array = result_array($query);
		// Parseamos BBCode
		$i = 0;
		foreach($array as $dato) {
			$data['data'][$i] = $dato;
			$data['data'][$i]['r_source'] = $dato['r_body'];
			$data['data'][$i]['r_body'] = $tsCore->parseBadWords($tsCore->parseBBCode($dato['r_body'], 'normal'), true);
			$i++;
		}
		return $data;
	}
	
	// DIRECTORIO DE LAS COMUNIDADES
	function getDirectorio() {
		global $tsCore, $tsUser;
		// Obtenemos variables via GET
		$pais = $tsCore->setSecure($_GET['pais']);
		$c_seo = $tsCore->setSecure($_GET['c_seo']);
		$s_seo = $tsCore->setSecure($_GET['s_seo']);
		// Filtramos pais
		if(!empty($pais) && $pais != 'Internacional') {
			$where = 'AND c.c_pais = \''.$pais.'\'';
			include('../ext/datos.php');
			$data['global_pais'] = $tsPaises[$pais];
			$data['global_url'] = $pais;
		} else {
			$where = '';
			$data['global_pais'] = 'Internacional';
			$data['global_url'] = 'Internacional';
		}
		// Filtramos categoria
		if(!empty($c_seo)) {
			if(!empty($s_seo)) {				
				$query = db_exec('fetch_assoc', db_exec(array(__FILE__, __LINE__), 'query', 'SELECT sid, s_seo, s_nombre, c_nombre, c_seo FROM c_subcategorias LEFT JOIN c_categorias ON cid = s_type WHERE s_seo = \''.$s_seo.'\''));
				$sid = $query['sid'];
				$data['sub'] = $query;
				// Total
				$sql = db_exec('fetch_row', db_exec(array(__FILE__, __LINE__), 'query', 'SELECT COUNT(c.c_id) AS total FROM c_comunidades AS c LEFT JOIN u_miembros AS u ON u.user_id = c.c_autor WHERE c.c_sub_categoria = \''.(int)$sid.'\' '.$where.' '.($tsUser->is_admod && $tsCore->settings['c_see_mod'] == 1 ? '' : '&& u.user_activo = \'1\' && u.user_baneado = \'0\' && c.c_estado = \'0\'')));
				$data['total'] = $sql[0];
				// Maximo a mostrar
				$max = 20;
				$limit = $tsCore->setPageLimit($max,false,$data['total']);
				$data['pages'] = $tsCore->getPages($data['total'], $max);
				//
				$query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT c.c_nombre, c.c_id, c.c_nombre_corto, c.c_descripcion, c.c_miembros, c.c_temas FROM c_comunidades AS c LEFT JOIN u_miembros AS u ON u.user_id = c.c_autor WHERE c.c_sub_categoria = \''.(int)$sid.'\' '.$where.' '.($tsUser->is_admod && $tsCore->settings['c_see_mod'] == 1 ? '' : '&& u.user_activo = \'1\' && u.user_baneado = \'0\' && c.c_estado = \'0\'').' ORDER BY c.c_miembros LIMIT '.$limit);
				$data['data'] = result_array($query);
			} else {
				$query = db_exec('fetch_assoc', db_exec(array(__FILE__, __LINE__), 'query', 'SELECT cid, c_nombre FROM c_categorias WHERE c_seo = \''.$c_seo.'\''));
				$data['c_seo'] = $c_seo;
				$data['c_nombre'] = $query['c_nombre'];
				$seo = $query['cid'];
				//
				$query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT COUNT(c.c_id) as total, c.c_categoria, sub.s_nombre, sub.s_seo, cat.c_seo FROM c_subcategorias AS sub LEFT JOIN c_comunidades AS c ON c.c_sub_categoria = sub.sid LEFT JOIN c_categorias AS cat ON cat.cid = c.c_categoria LEFT JOIN u_miembros AS u ON u.user_id = c.c_autor WHERE c.c_estado = \'0\' '.$where.' AND c.c_categoria = \''.(int)$seo.'\' '.($tsUser->is_admod && $tsCore->settings['c_see_mod'] == 1 ? '' : '&& u.user_activo = \'1\' && u.user_baneado = \'0\' && c.c_estado = \'0\'').' GROUP BY sub.sid ORDER BY sub.s_nombre ASC');			
				$data['data'] = result_array($query);
			}
		} else {
			$query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT COUNT(c.c_id) as total, c.c_categoria, c.c_estado, cat.cid, cat.c_nombre, cat.c_seo FROM c_categorias AS cat LEFT JOIN c_comunidades AS c ON c.c_categoria = cat.cid LEFT JOIN u_miembros AS u ON u.user_id = c.c_autor WHERE c.c_estado = \'0\' '.$where.' '.($tsUser->is_admod && $tsCore->settings['c_see_mod'] == 1 ? '' : '&& u.user_activo = \'1\' && u.user_baneado = \'0\' && c.c_estado = \'0\'').' GROUP BY cat.cid ORDER BY cat.c_nombre ASC');
			$array = result_array($query);
			$i = 0;
			foreach($array as $dato) {
				$data['data'][$i] = $dato;
				$data['data'][$i]['sub_cat'] = result_array(db_exec(array(__FILE__, __LINE__), 'query', 'SELECT COUNT(c.c_id) AS total, s.s_nombre, s.s_seo FROM c_subcategorias AS s LEFT JOIN c_comunidades AS c ON c.c_sub_categoria = s.sid WHERE c.c_estado = \'0\' AND s.s_type = \''.$dato['cid'].'\' '.$where.' GROUP BY s.sid ORDER BY total DESC LIMIT 3'));
				$i++;
			}
		}
		return $data;
	}
	
	// Filtro por paises- directorio
	function getDirPaises() {
		$query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT COUNT(c.c_pais) AS total, c.c_pais FROM c_comunidades AS c GROUP BY c.c_pais ORDER BY total DESC');
        $array = result_array($query);
		// PAISES
		include('../ext/datos.php');
		$i = 0;
		foreach($array as $dato) {
			$data['data'][$i] = $dato;
			$data['data'][$i]['pais'] = $tsPaises[$dato['c_pais']];
			$i++;
		}
		return $data;
	}
	
	// Comunidades populares en la home
	function getPopulares(){
		// CLASE TOPS
    	include("c.tops.php");
    	$tsTops =& tsTops::getInstance();
		// SEMANA
		$data['semana'] = $this->getHomeTopCom($tsTops->setTime(3));
		// MES
		$data['mes'] = $this->getHomeTopCom($tsTops->setTime(4));
		// HISTÓRICO
		$data['historico'] = $this->getHomeTopCom($tsTops->setTime(5));
		//
		return $data;
	}
	
	// Comunidades populares en la home
	function getHomeTopCom($date){
		global $tsCore, $tsUser;
		$query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT c.c_estado, c.c_id, c.c_nombre, c.c_nombre_corto, c.c_miembros, c.c_temas, c.c_fecha FROM c_comunidades AS c LEFT JOIN u_miembros AS u ON u.user_id = c.c_autor WHERE '.($tsUser->is_admod && $tsCore->settings['c_see_mod'] == 1 ? '' : 'u.user_activo = \'1\' && u.user_baneado = \'0\' && c.c_estado = \'0\' AND').' c.c_fecha BETWEEN \''.$date['start'].'\' AND \''.$date['end'].'\' ORDER BY c.c_miembros DESC LIMIT 10');
		$data = result_array($query);
		return $data;
	}
	
	// Temas populares por comunidad
	function getTopTemas($date, $comid){
		global $tsCore, $tsUser;
		$query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT t.t_id, t.t_estado, t.t_titulo, t.t_votos_pos FROM c_temas AS t LEFT JOIN u_miembros AS u ON u.user_id = t.t_autor WHERE t.t_comunidad = \''.(int)$comid.'\' '.($tsUser->is_admod && $tsCore->settings['c_see_mod'] == 1 ? '' : '&& u.user_activo = \'1\' && u.user_baneado = \'0\' && t.t_estado = \'0\'').' AND t.t_fecha BETWEEN \''.$date['start'].'\' AND \''.$date['end'].'\' ORDER BY t.t_votos_pos DESC LIMIT 10');
		$data = result_array($query);
		return $data;
	}
	
	// NUEVA RESPUESTA EN TEMA
	function nueva_respuesta() {
		global $tsCore, $tsUser, $tsMonitor, $tsActividad;
		// OBTENEMOS DATOS
		$temaid = $tsCore->setSecure($_POST['temaid']);
		$body = substr($_POST['body'],0,1500);
		$query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT t_id, t_estado, t_autor, t_comunidad FROM c_temas WHERE t_id = \''.(int)$temaid.'\' LIMIT 1');
		$data = db_exec('fetch_assoc', $query);
		// EXISTE EL TEMA?
		if(!empty($data['t_id'])) {
			// ESTA DESABILITADO?
			if($data['t_estado'] == 0 || ($data['t_estado'] != 0 && $tsUser->is_admod)) {
				// Es miembro?
				if($this->es_miembro($data['t_comunidad'])) {
					// Esta baneado?
					if($this->is_banned($tsUser->uid, $data['t_comunidad'])) return '0: No puedes comentar en esta comunidad, fu&iacute;ste suspendido de la misma.';
					// ANTI FLOOD
					$tsCore->antiFlood();
					$_SERVER['REMOTE_ADDR'] = $_SERVER['X_FORWARDED_FOR'] ? $_SERVER['X_FORWARDED_FOR'] : $_SERVER['REMOTE_ADDR'];
					if(!filter_var($_SERVER['REMOTE_ADDR'], FILTER_VALIDATE_IP)) { die('0: Su ip no se pudo validar.'); }
					if(db_exec(array(__FILE__, __LINE__), 'query', 'INSERT INTO `c_respuestas` (r_autor, r_body, r_tema, r_fecha, r_ip) VALUES (\''.$tsUser->uid.'\', \''.$tsCore->setSecure($body).'\', \''.(int)$temaid.'\', \''.time().'\', \''.$_SERVER['REMOTE_ADDR'].'\')')) {
						$cid = db_exec('insert_id');	
						// SUMAMOS ESTADISTICAS :D
						db_exec(array(__FILE__, __LINE__), 'query', 'UPDATE c_temas SET t_respuestas = t_respuestas+1 WHERE t_id = \''.(int)$temaid.'\'');
						// Notificar a los seguidores, citados y al dueño
						$this->quoteNoti($temaid, $data['t_autor'], $cid, $body);
						// PARSEAMOS BBCODE
						$body = $tsCore->parseBadWords($tsCore->parseBBCode($body, 'normal'), true);
						// Actividad
						$tsActividad->setActividad(16, $temaid);
						return array($body, $tsUser->uid, $tsUser->nick, time(), (int)$cid, $temaid);
					} else return '0: Ocurri&oacute; un error al al agregar el comentario, intentalo m&aacute;s tarde.';
				} else return '0: Para poder comentar debes ser miembro de la comunidad.';
			} else return '0: El tema est&aacute; en revisi&oacute;n y no puedes comentarlo.';
		} else return '0: El tema no existe o ha sido eliminado.';
	}
	
	// Visitas en el tema
	function setVisitaTema($temaid) {
		global $tsUser, $tsCore;
		$visitado = db_exec('num_rows', db_exec(array(__FILE__, __LINE__), 'query', 'SELECT id FROM `w_visitas` WHERE `for` = \''.(int)$temaid.'\' && `type` = \'5\' && '.($tsUser->is_member ? '(`user` = \''.$tsUser->uid.'\' OR `ip` LIKE \''.$_SERVER['REMOTE_ADDR'].'\')' : '`ip` LIKE \''.$_SERVER['REMOTE_ADDR'].'\'').' LIMIT 1'));
		if($tsUser->is_member && $visitado == 0) {
			db_exec(array(__FILE__, __LINE__), 'query', 'INSERT INTO w_visitas (`user`, `for`, `type`, `date`, `ip`) VALUES (\''.$tsUser->uid.'\', \''.(int)$temaid.'\', \'5\', \''.time().'\', \''.$_SERVER['REMOTE_ADDR'].'\')');
			db_exec(array(__FILE__, __LINE__), 'query', 'UPDATE c_temas SET t_visitas = t_visitas + 1 WHERE t_id = \''.(int)$temaid.'\' AND t_autor != \''.$tsUser->uid.'\'');
		}else{
		db_exec(array(__FILE__, __LINE__), 'query', 'UPDATE `w_visitas` SET `date` = \''.time().'\', ip = \''.$MyIP.'\' WHERE `for` = \''.(int)$temaid.'\' && `type` = \'5\' && `user` = \''.$tsUser->uid.'\' LIMIT 1');
		}
		if($tsCore->settings['c_hits_guest'] == 1 && !$tsUser->is_member && !$visitado) {
			db_exec(array(__FILE__, __LINE__), 'query', 'INSERT INTO w_visitas (`user`, `for`, `type`, `date`, `ip`) VALUES (\''.$tsUser->uid.'\', \''.(int)$$temaid.'\', \'5\', \''.time().'\', \''.$_SERVER['REMOTE_ADDR'].'\')');
			db_exec(array(__FILE__, __LINE__), 'query', 'UPDATE c_temas SET t_visitas = t_visitas + 1 WHERE t_id = \''.(int)$temaid.'\'');
		}
	}
	
	// Unirme comunidad
	function unirme_comunidad() {
		global $tsCore, $tsUser, $tsActividad;
		$comid = $tsCore->setSecure($_POST['comid']);
		// Existe la comunidad?
		$com = db_exec('fetch_assoc', db_exec(array(__FILE__, __LINE__), 'query', 'SELECT c_id, c_permisos, c_estado FROM c_comunidades WHERE c_id = \''.(int)$comid.'\''));
		if(!empty($com['c_id'])) {
			if($com['c_estado'] == 0) {
				// Estoy baneado?
				if($this->is_banned($tsUser->uid, $comid)) return '0: No puedes ser miembro de esta comunidad, fu&iacute;ste suspendido de la misma.';
				// Ya soy miembro?
				$soy = db_exec('fetch_row', db_exec(array(__FILE__, __LINE__), 'query', 'SELECT COUNT(m_id) AS total FROM c_miembros WHERE m_comunidad = \''.(int)$comid.'\' AND m_user = \''.$tsUser->uid.'\''));
				if($soy[0] == 0) {
					if(db_exec(array(__FILE__, __LINE__), 'query', 'INSERT INTO c_miembros (m_user, m_permisos, m_comunidad, m_fecha) VALUES (\''.$tsUser->uid.'\', \''.$com['c_permisos'].'\', \''.(int)$comid.'\', \''.time().'\')')) {
						db_exec(array(__FILE__, __LINE__), 'query', 'UPDATE c_comunidades SET c_miembros = c_miembros +1 WHERE c_id = \''.(int)$comid.'\'');
						// Actividad
						$tsActividad->setActividad(21, $comid);
						return '1: Eres miembro! ahora comentaselo a tus padres :D';
					} else return '0: Ocurri&oacute; un error, intentalo m&aacute;s tarde.';
				} else return '0: Ya eres miembro de esta comunidad.';
			} else return '0: La comunidad ha sido suspendida.';
		} else return '0: La comunidad a la que deseas unirte no existe.';
	}
	
	// Abandonar comunidad
	function abandonar_comunidad() {
		global $tsCore, $tsUser;
		$comid = $tsCore->setSecure($_POST['comid']);
		// Existe la comunidad?
		$com = db_exec('fetch_assoc', db_exec(array(__FILE__, __LINE__), 'query', 'SELECT c_id, c_autor FROM c_comunidades WHERE c_id = \''.(int)$comid.'\''));
		if(isset($com['c_id'])) {
			if($com['c_autor'] != $tsUser->uid) {
				if(db_exec(array(__FILE__, __LINE__), 'query', 'DELETE FROM c_miembros WHERE m_user = \''.$tsUser->uid.'\' AND m_comunidad = \''.(int)$comid.'\'')){
					db_exec(array(__FILE__, __LINE__), 'query', 'UPDATE c_comunidades SET c_miembros = c_miembros -1 WHERE c_id = \''.(int)$comid.'\'');
					return '1: quieres abandonar nuestra comunidad? no lo hagas!!... Bueno ya que ._. Uno menos!';
				} else return '0: Ocurri&oacute; un error, intentalo m&aacute;s tarde.';
			} else return '0: No puedes abandonar tu propia comunidad.<br><br>Si deseas eliminarla ve a Editar > Eliminar comunidad';
		} else return '0: La comunidad no existe.';
	}
	
	// Seguir-Dejar de seguir comunidad
	function seguir_comunidad() {
		global $tsCore, $tsUser, $tsActividad;
		$comid = $tsCore->setSecure($_POST['comid']);
		// Existe la comunidad?
		$com = db_exec('fetch_assoc', db_exec(array(__FILE__, __LINE__), 'query', 'SELECT c_id, c_estado FROM c_comunidades WHERE c_id = \''.(int)$comid.'\''));
		if(isset($com['c_id'])) {
			if($com['c_autor'] != $tsUser->uid) {
				// Si ya la sigues, deja de seguirla, de lo contrario, la sigues :D
				if($this->es_seguidor_com($comid)) {
					if(db_exec(array(__FILE__, __LINE__), 'query', 'DELETE FROM u_follows WHERE f_type = \'4\' AND f_user = \''.$tsUser->uid.'\' AND f_id = \''.(int)$comid.'\'')){
						db_exec(array(__FILE__, __LINE__), 'query', 'UPDATE c_comunidades SET c_seguidores = c_seguidores -1 WHERE c_id = \''.(int)$comid.'\'');
						return '2: Ya no sigues esta comunidad';
					} else return '0: Ocurri&oacute; un error, intentalo m&aacute;s tarde.';
				} else {
					if($this->is_banned($tsUser->uid, $comid)) return '0: No puedes seguir esta comunidad, fu&iacute;ste suspendido de la misma.';
					if(db_exec(array(__FILE__, __LINE__), 'query', 'INSERT INTO u_follows (f_user, f_id, f_type, f_date) VALUES (\''.$tsUser->uid.'\', \''.(int)$comid.'\', \'4\', \''.time().'\')')) {
						db_exec(array(__FILE__, __LINE__), 'query', 'UPDATE c_comunidades SET c_seguidores = c_seguidores +1 WHERE c_id = \''.(int)$comid.'\'');
						// Actividad
						$tsActividad->setActividad(20, $comid);
						return '1: Sigues esta comunidad';
					} else return '0: Ocurri&oacute; un error, intentalo m&aacute;s tarde.';
				}
			} else return '0: La comunidad ha sido suspendida.';
		} else return '0: La comunidad no existe.';
	}
	
	// Obtener miembros de la comunidad
	function getMiembros($comid, $type = 'miembros') {
		global $tsCore, $tsUser;
		switch($type) {
			case 'miembros':
				// Total
				$sql = db_exec('fetch_row', db_exec(array(__FILE__, __LINE__), 'query', 'SELECT COUNT(m_id) AS total FROM c_miembros WHERE m_comunidad = \''.(int)$comid.'\''));
				$data['total'] = $sql[0];
				// Maximo a mostrar
				$max = 10;
				$limit = $tsCore->setPageLimit($max,false,$data['total']);
				$data['pages'] = $tsCore->getPages($data['total'], $max);
				$data['pages']['van'] = $data['pages']['current']*$max;
				//
				$query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT m_user, m_permisos, user_name FROM c_miembros LEFT JOIN u_miembros ON user_id = m_user WHERE m_comunidad = \''.(int)$comid.'\' AND m_permisos > 0 ORDER BY m_fecha DESC LIMIT '.$limit);
				$data['data'] = result_array($query);
				break;				
			case 'suspendidos':
				$permisos = $this->my_permiso($comid);
				if($permisos >= 4 || $tsUser->is_admod) {
					// Total
					$sql = db_exec('fetch_row', db_exec(array(__FILE__, __LINE__), 'query', 'SELECT COUNT(ban_id) AS total FROM c_baneados WHERE ban_comunidad = \''.(int)$comid.'\''));
					$data['total'] = $sql[0];
					if($data['total'] > 0) {
						// Maximo a mostrar
						$max = 10;
						$limit = $tsCore->setPageLimit($max,false,$data['total']);
						$data['pages'] = $tsCore->getPages($data['total'], $max);
						$data['pages']['van'] = $data['pages']['current']*$max;
						//
						$query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT ban_user, ban_causa, ban_termina, ban_mod, ban_fecha, user_name FROM c_baneados LEFT JOIN u_miembros ON user_id = ban_user WHERE ban_comunidad = \''.(int)$comid.'\' ORDER BY ban_fecha DESC LIMIT '.$limit);
						$data['data'] = result_array($query);
					} else return 'No hay usuarios baneados en esta comunidad.';
				} else return 'Tu rango no te permite realizar esta operaci&oacute;n.';
				break;
				
		}
		//
		$data['type'] = $type;
		//
		return $data;
	}
	
	// Mis comunidades
	function getMisComunidades() {
		global $tsUser, $tsCore;
		// Total
		$sql = db_exec('fetch_row', db_exec(array(__FILE__, __LINE__), 'query', 'SELECT COUNT(m_id) AS total FROM c_miembros WHERE m_user = \''.$tsUser->uid.'\''));
		$data['total'] = $sql[0];
		// Maximo a mostrar
		$max = 10;
		$limit = $tsCore->setPageLimit($max,false,$data['total']);
		$data['pages'] = $tsCore->getPages($data['total'], $max);
		$data['pages']['van'] = $data['pages']['current']*$max;
		// Orden
		$data['orden'] = htmlspecialchars($_GET['orden']);
		switch($data['orden']) {
			case 'nombre':
				$orden = 'c.c_nombre ASC';
			break;
			case 'rango':
				$orden = 'a.m_permisos DESC';
			break;
			case 'miembros':
				$orden = 'c.c_miembros DESC';
			break;
			case 'temas':
				$orden = 'c.c_temas DESC';
			break;
			case 'fecha':
				$orden = 'a.m_fecha DESC';
			break;
			default:
				$data['orden'] = 'nombre';
				$orden = 'c.c_nombre ASC';
			break;
		}
		//
		$query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT a.m_permisos, c.c_nombre, c.c_id, c.c_estado, c.c_nombre_corto, c.c_descripcion, c.c_miembros, c.c_temas, cat.c_nombre AS categoria FROM c_miembros AS a LEFT JOIN c_comunidades AS c ON c.c_id = a.m_comunidad LEFT JOIN c_categorias AS cat ON cat.cid = c.c_categoria LEFT JOIN u_miembros AS u ON u.user_id = c.c_autor WHERE a.m_user = \''.$tsUser->uid.'\' '.($tsUser->is_admod && $tsCore->settings['c_see_mod'] == 1 ? '' : '&& u.user_activo = \'1\' && u.user_baneado = \'0\' && c.c_estado = \'0\'').' ORDER BY '.$orden.' LIMIT '.$limit);
		$data['data'] = result_array($query);
		return $data;
	}
	
	// Votar tema
	function votar_tema() {
		global $tsCore, $tsUser, $tsMonitor, $tsActividad;
        // Solo miembros
		if($tsUser->is_member){
			// Votar
			$tid = $tsCore->setSecure($_POST['temaid']);
			$voto = $tsCore->setSecure($_POST['voto']);
			
			if($voto == 'pos'){
			 $voto = 't_votos_pos = t_votos_pos + 1';
             $type = 1;
			}else{
			 $voto = 't_votos_neg = t_votos_neg + 1';
             $type = 0;
			}
            //
			$query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT t_id, t_autor, t_estado FROM c_temas WHERE t_id = \''.(int)$tid.'\' LIMIT 1');
			$data = db_exec('fetch_assoc', $query);
			if($data['t_id'] > 0) {
				// Es mi tema?
				$is_mytema = ($data['t_autor'] == $tsUser->uid) ? true : false;
				// No es mi tema, puedo votar
				if(!$is_mytema){
					if($data['t_estado'] == 0) {
						// Ya lo vote?
						$query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT vid FROM c_votos WHERE v_for = \''.(int)$tid.'\' AND v_user = \''.$tsUser->uid.'\' AND v_obj = \'1\' LIMIT 1');
						$votado = db_exec('num_rows', $query);				
						if(empty($votado)){
							// Sumar voto
							db_exec(array(__FILE__, __LINE__), 'query', 'UPDATE c_temas SET '.$voto.' WHERE t_id = \''.(int)$tid.'\'');
							// Insertar en la tabla
							if(db_exec(array(__FILE__, __LINE__), 'query', 'INSERT INTO `c_votos` (`v_user`, `v_type`, `v_obj`, `v_for`, `v_date`) VALUES (\''.$tsUser->uid.'\', \''.$type.'\', \'1\', \''.(int)$tid.'\', \''.time().'\')')) {
								// Mandar la notificacion
								$tsMonitor->setNotificacion(56, $data['t_autor'], $tsUser->uid, $tid, $type);
								// Actividad
								$tsActividad->setActividad(17, $tid, $type);
								return '1: Tema votado!';
							} else return '0: Ocurri&oacute; un error, intentalo m&aacute;s tarde.';
						} return '0: Ya has votado este tema.';
					} else return '0: El tema ha sido eliminado.';
				} else return '0: No puedes votar tu propio tema.';
			} else return '0: El tema no existe.';
		} else return '0: Lo sentimos, para poder votar debes estar registrado.';
	}
	
	// Votar respuestas
	function votar_respuesta() {
		global $tsCore, $tsUser, $tsMonitor, $tsActividad;
        // Solo miembros
		if($tsUser->is_member){
			// Votar
			$rid = $tsCore->setSecure($_POST['rid']);
			$voto = $tsCore->setSecure($_POST['voto']);
			
			if($voto == 'pos'){
				$voto = 'r_votos_pos = r_votos_pos + 1';
				$type = 1;
			}else{
				$voto = 'r_votos_neg = r_votos_neg + 1';
				$type = 0;
			}
            //
			$query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT r_id, r_autor, r_estado, r_tema FROM c_respuestas WHERE r_id = \''.(int)$rid.'\' LIMIT 1');
			$data = db_exec('fetch_assoc', $query);
			if($data['r_id'] > 0) {
				if($data['r_estado'] == 0) {
					// Es mi tema?
					$is_myans = ($data['r_autor'] == $tsUser->uid) ? true : false;
					// No es mi tema, puedo votar
					if(!$is_myans){
						// Ya lo vote?
						$query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT vid FROM c_votos WHERE v_for = \''.(int)$rid.'\'  AND v_user = \''.$tsUser->uid.'\' AND v_obj = \'2\' LIMIT 1');
						$votado = db_exec('num_rows', $query);				
						if(empty($votado)){
							// Sumar voto
							db_exec(array(__FILE__, __LINE__), 'query', 'UPDATE c_respuestas SET '.$voto.' WHERE r_id = \''.(int)$rid.'\'');
							// Insertar en la tabla
							if(db_exec(array(__FILE__, __LINE__), 'query', 'INSERT INTO `c_votos` (`v_user`, `v_type`, `v_obj`, `v_for`, `v_date`) VALUES (\''.$tsUser->uid.'\', \''.$type.'\', \'2\', \''.(int)$rid.'\', \''.time().'\')')) {
								// Mandar la notificacion
								$tsMonitor->setNotificacion(57, $data['r_autor'], $tsUser->uid, $data['r_tema'], $type, $rid);
								// Actividad
								$tsActividad->setActividad(18, $data['r_tema'], $type);
								return '1: Votado';
							} else return '0: Ocurri&oacute; un error, intentalo m&aacute;s tarde.';
						} return '0: Ya has votado este comentario.';
					} else return '0: No puedes votar tu propio comentario.';
				} else return '0: El comentario est&aacute; en revisi&oacute;n.';
			} else return '0: El comentario ha sido eliminado.';
		} else return '0: Lo sentimos, para poder votar debes estar registrado.';
	}
	
	// Borrar respuesta
	function del_respuesta() {
		global $tsCore, $tsUser;
		$rid = $tsCore->setSecure($_POST['rid']);
		// Existe el comentario?
		$dato = db_exec('fetch_assoc', db_exec(array(__FILE__, __LINE__), 'query', 'SELECT r_tema, r_autor, t_comunidad FROM c_respuestas LEFT JOIN c_temas ON t_id = r_tema WHERE r_id = \''.(int)$rid.'\' LIMIT 1'));
		if(!empty($dato['r_autor'])) {
			// Es mio o tengo permisos?
			$permisos = $this->my_permiso($dato['t_comunidad']);
			if($dato['r_autor'] != $tsUser->uid || $permisos > 4 || $tsUser->is_admod) {
				if(db_exec(array(__FILE__, __LINE__), 'query', 'DELETE FROM c_respuestas WHERE r_id = \''.(int)$rid.'\'')){
					db_exec(array(__FILE__, __LINE__), 'query', 'UPDATE c_temas SET t_respuestas = t_respuestas-1 WHERE t_id = \''.(int)$dato['r_tema'].'\'');
					return '1: Uno menos!';
				} else return '0: Ocurri&oacute; un error, intentalo m&aacute;s tarde.';
			} else return '0: Tu rango no te permite realizar esta operaci&oacute;n.';
		} else return '0: El comentario no existe.';
	}
	
	// Agregar a favoritos
	function add_favorito() {
		global $tsCore, $tsUser, $tsMonitor, $tsActividad;
		$temaid = $tsCore->setSecure($_POST['temaid']);
		//
		$query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT t_id, t_autor, t_estado FROM c_temas WHERE t_id = \''.(int)$temaid.'\'');		
		$data = db_exec('fetch_assoc', $query);
		//
		if(!empty($data['t_id'])) {
			if($data['t_estado'] == 0) {
				if($data['t_autor'] != $tsUser->uid) {
					$q = db_exec('fetch_row', db_exec(array(__FILE__, __LINE__), 'query', 'SELECT COUNT(fav_id) FROM c_favoritos WHERE f_tema = \''.(int)$temaid.'\' AND f_user ='.$tsUser->uid));
					if($q[0] == 0) {
						if(db_exec(array(__FILE__, __LINE__), 'query', 'INSERT INTO `c_favoritos` (f_tema, f_user, f_date) VALUES (\''.$temaid.'\', \''.$tsUser->uid.'\', \''.time().'\')')) {
							// Sumar favorito
							db_exec(array(__FILE__, __LINE__), 'query', 'UPDATE c_temas SET t_favoritos = t_favoritos+1 WHERE t_id = \''.(int)$temaid.'\'');
							// Notificar al autor
							$tsMonitor->setNotificacion(54, $data['t_autor'], $tsUser->uid, $temaid);
							// Actividad
							$tsActividad->setActividad(14, $temaid);
							return '1: tema a&ntilde;adido a tus favoritos correctamente.';				
						} else return '0: Ocurri&oacute; un error al intentar procesar lo solicitado.';
					} else return '0: Ya tienes este tema en tus favoritos.';
				} else return '0: No puedes agregar tu propio tema a favoritos.';
			} else return '0: El tema est&aacute; en revisi&oacute;n.';
		} else return '0: El tema no existe.';
	}
	
	// Borrar favorito
	function del_favorito(){
		global $tsCore, $tsUser;
		//
		$favid = $tsCore->setSecure($_POST['favid']);
		// CONSULTAR
		$query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT fav_id, f_user, f_tema FROM c_favoritos WHERE fav_id = \''.(int)$favid.'\'');
		$data = db_exec('fetch_assoc', $query);
		// ES MIO O TIENE PERMISOS
		if(!empty($data['fav_id'])){
			if($data['f_user'] == $tsUser->uid) {
				if(db_exec(array(__FILE__, __LINE__), 'query', 'DELETE FROM c_favoritos WHERE fav_id = \''.(int)$favid.'\'')) {
					// Restar favorito
					db_exec(array(__FILE__, __LINE__), 'query', 'UPDATE c_temas SET t_favoritos = t_favoritos-1 WHERE t_id = \''.(int)$data['f_tema'].'\'');
					return '1: Favorito removido con exito.';
				} else return '0: Ocurri&oacute; un error al intentar procesar lo solicitado.';
			} else return '0: Lo que intentas hacer no est&aacute; permitido.';
		} else return '0: El favorito no existe o ya lo eliminaste.';
	}
	
	// Seguir-Dejar de seguir tema
	function seguir_tema() {
		global $tsCore, $tsUser, $tsMonitor, $tsActividad;
		$temaid = $tsCore->setSecure($_POST['temaid']);
		// Existe el tema?
		$tema = db_exec('fetch_assoc', db_exec(array(__FILE__, __LINE__), 'query', 'SELECT COUNT(t_id) AS total, t_autor, t_estado FROM c_temas WHERE t_id = \''.(int)$temaid.'\''));
		if($tema['total'] > 0) {
			if($tema['t_estado'] == 0) {
				// Si ya la sigues, deja de seguirla, de lo contrario, la sigues :D
				if($this->es_seguidor_tema($temaid)) {
					if(db_exec(array(__FILE__, __LINE__), 'query', 'DELETE FROM u_follows WHERE f_type = \'5\' AND f_user = \''.$tsUser->uid.'\' AND f_id = \''.(int)$temaid.'\'')){
						db_exec(array(__FILE__, __LINE__), 'query', 'UPDATE c_temas SET t_seguidores = t_seguidores-1 WHERE t_id = \''.(int)$temaid.'\'');
						return '2: Ya no sigues este tema';
					} else return '0: Ocurri&oacute; un error, intentalo m&aacute;s tarde.';
				} else {				
					// Es mi propio tema?
					if($tema['t_autor'] == $tsUser->uid) return '0: Genius, no puedes seguir tu propio tema.';
					if(db_exec(array(__FILE__, __LINE__), 'query', 'INSERT INTO u_follows (f_user, f_id, f_type, f_date) VALUES (\''.$tsUser->uid.'\', \''.(int)$temaid.'\', \'5\', \''.time().'\')')) {
						db_exec(array(__FILE__, __LINE__), 'query', 'UPDATE c_temas SET t_seguidores = t_seguidores+1 WHERE t_id = \''.(int)$temaid.'\'');
						// Notificar al autor
						$tsMonitor->setNotificacion(58, $tema['t_autor'], $tsUser->uid, $temaid);
						// Actividad
						$tsActividad->setActividad(19, $temaid);
						return '1: Sigues este tema';
					} else return '0: Ocurri&oacute; un error, intentalo m&aacute;s tarde.';
				}
			} else return '0: El tema est&aacute; en revisi&oacute;n.';
		} else return '0: El tema no existe.';
	}
	
	// Recomendar tema
	function reco_tema(){
		global $tsCore, $tsUser, $tsActividad;
		//
		$temaid = $_POST['temaid'];
        // TIENE SEGUIDORES?
		$query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT follow_id FROM u_follows WHERE f_id = \''.$tsUser->uid.'\'  AND f_type = \'1\' LIMIT 1');
        $seguidores = db_exec('num_rows', $query);
        // YA LO HA RECOMENDADO?
		$query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT follow_id FROM u_follows WHERE f_id = \''.(int)$temaid.'\' AND f_user = \''.$tsUser->uid.'\' AND f_type = \'6\' LIMIT 1');
        $recomendado = db_exec('num_rows', $query);
        
        if($seguidores < 1) return '0: Debes tener al menos un seguidor';
        if($recomendado > 0) return '0: No puedes recomendar el mismo tema m&aacute;s de una vez.'; 
		//
		$query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT t_autor FROM c_temas WHERE t_id = \''.(int)$temaid.'\' LIMIT 1');
		$data = db_exec('fetch_assoc', $query);
		
		//
		if($tsUser->uid != $data['t_autor']){
            // GUARDAMOS EN FOLLOWS PUES ES LA RECOMENDACION PARA SU SEGUIDORES! xD
			db_exec(array(__FILE__, __LINE__), 'query', 'INSERT INTO u_follows (f_id, f_user, f_type, f_date) VALUES (\''.(int)$temaid.'\', \''.$tsUser->uid.'\', \'6\', \''.time().'\') ');
			// NOTIFICAR
			if($this->setFollowNotificacion(55, 1, $tsUser->uid, 0, $temaid)) {
                //$tsActividad->setActividad(4, $postid);
				db_exec(array(__FILE__, __LINE__), 'query', 'UPDATE c_temas SET t_share = t_share+1 WHERE t_id = \''.(int)$temaid.'\'');
				// Actividad
				$tsActividad->setActividad(15, $temaid);
                return '1: La recomendaci&oacute;n fue enviada.';
			}
		} else return '0: No puedes recomendar tu propio tema.';
	}
	
	// Eliminar tema
	function del_tema() {
		global $tsCore, $tsUser;
		$temaid = $tsCore->setSecure($_POST['temaid']);
		$razon = $tsCore->setSecure($_POST['razon']);
		// Existe el tema?
		$tema = db_exec('fetch_assoc', db_exec(array(__FILE__, __LINE__), 'query', 'SELECT COUNT(t_id) AS total, t_autor, t_comunidad, t_estado FROM c_temas WHERE t_id = \''.(int)$temaid.'\''));
		if($tema['total'] != 0) {
			// quien lo elimina?
			$permisos = $this->my_permiso($tema['t_comunidad']);
			if($tema['t_autor'] == $tsUser->uid) {
				// Eliminamos registros de mas
				db_exec(array(__FILE__, __LINE__), 'query', 'DELETE FROM c_favoritos WHERE f_tema = \''.(int)$dato['t_id'].'\'');
				db_exec(array(__FILE__, __LINE__), 'query', 'DELETE FROM c_borradores WHERE b_tema = \''.(int)$dato['t_id'].'\'');
				db_exec(array(__FILE__, __LINE__), 'query', 'DELETE FROM c_votos WHERE v_for = \''.(int)$dato['t_id'].'\'');
				db_exec(array(__FILE__, __LINE__), 'query', 'DELETE FROM c_respuestas WHERE r_tema = \''.(int)$dato['t_id'].'\'');
				db_exec(array(__FILE__, __LINE__), 'query', 'DELETE FROM c_temas WHERE t_id = \''.(int)$temaid.'\' LIMIT 1');
				return '1: El tema se ha eliminado correctamente.';
			} elseif($permisos > 3 || $tsUser->is_admod) {				
				if($tema['t_estado'] == 0) {
					if(db_exec(array(__FILE__, __LINE__), 'query', 'UPDATE c_temas SET t_estado = \'1\' WHERE t_id = \''.(int)$temaid.'\'')) {
						$this->mod_history($temaid, 2, $tema['t_comunidad'], $razon);
						return '1: El tema est&aacute; inactivo.';
					}
				} else return '0: El tema ya ha sido desabilitado anteriormente.';
			} else return '0: Tu rango no te permite realizar esta operaci&oacute;n.';
		} else return '0: El tema no existe.';
		
	}
	
	// Reactivar tema
	function reactivar_tema() {
		global $tsCore, $tsUser;
		$temaid = $tsCore->setSecure($_POST['temaid']);
		// Existe el tema?
		$tema = db_exec('fetch_assoc', db_exec(array(__FILE__, __LINE__), 'query', 'SELECT COUNT(t_id) AS total, t_autor, t_comunidad FROM c_temas WHERE t_id = \''.(int)$temaid.'\''));
		if($tema['total'] != 0) {
			//
			$permisos = $this->my_permiso($tema['t_comunidad']);
			if($permisos > 3 || $tsUser->is_admod) {
				if(db_exec(array(__FILE__, __LINE__), 'query', 'UPDATE c_temas SET t_estado = \'0\' WHERE t_id = \''.(int)$temaid.'\'')) {
					$this->mod_history($temaid, 3, $tema['t_comunidad']);
					return '1: El tema ha sido reactivado correctamente.';
				} else return '0: Ocurri&oacute; un error, int&eacute;ntalo m&aacute;s tarde';
			} else return '0: Tu rango no te permite realizar esta operaci&oacute;n.';
		} else return '0: El tema no existe.';
		
	}
	
	// Historial de moderacion
	function getHistorial() {
		global $tsCore;
		// Todo el historial
		$query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT h.h_razon, h.h_type, u.user_id, u.user_name, t.t_titulo, t.t_id, c.c_nombre, c.c_nombre_corto FROM c_historial AS h LEFT JOIN u_miembros AS u ON u.user_id = h.h_mod LEFT JOIN c_temas AS t ON t.t_id = h.h_for LEFT JOIN c_comunidades AS c ON c.c_id = h.h_comid ORDER BY h.h_date DESC LIMIT 20');
		$data = result_array($query);
		return $data;
	}
	
	// Historial de moderacion por comunidad
	function getComModHistory($comid) {
		global $tsCore;
		$query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT h.h_razon, h.h_type, u.user_id, u.user_name, t.t_titulo, t.t_id, c.c_nombre, c.c_nombre_corto FROM c_historial AS h LEFT JOIN u_miembros AS u ON u.user_id = h.h_mod LEFT JOIN c_temas AS t ON t.t_id = h.h_for LEFT JOIN c_comunidades AS c ON c.c_id = h.h_comid WHERE h.h_comid = \''.(int)$comid.'\' ORDER BY h.h_date DESC LIMIT 20');
		$data = result_array($query);
		return $data;
	}
	
	// Buscar miembros de la comunidad
	function buscar_miembro() {
		global $tsCore, $tsUser;
		// Obtenemos datos
		$comid = $tsCore->setSecure($_POST['comid']);
		$search = $tsCore->setSecure($_POST['search']);
		$query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT m_user, m_permisos, user_name FROM c_miembros LEFT JOIN u_miembros ON user_id = m_user WHERE m_comunidad = \''.(int)$comid.'\' AND m_permisos > 0 AND MATCH(user_name) AGAINST(\''.$search.'\' IN BOOLEAN MODE) ORDER BY m_fecha DESC');
		$data['data'] = result_array($query);
		$data['total'] = count($data['data']);
		$data['type'] = 'miembros';
		if(empty($data['total'])) return 'No se encontraron usuarios';
		else return $data;
	}
	
	// Datos para administrar usuario
	function member_admin() {
		global $tsCore, $tsUser;
		// Obtenemos datos
		$comid = $tsCore->setSecure($_POST['comid']);
		$userid = $tsCore->setSecure($_POST['userid']);
		// Yo mismo? ._.
		if($userid != $tsUser->uid) {
			// Es miembro de la comunidad?
			if($this->my_permiso($comid) == 5 || $tsUser->is_admod) {
				$dato = db_exec('fetch_assoc', db_exec(array(__FILE__, __LINE__), 'query', 'SELECT m_id, m_permisos, m_user, user_name FROM c_miembros LEFT JOIN u_miembros ON user_id = m_user WHERE m_user = \''.(int)$userid.'\' AND m_comunidad = \''.(int)$comid.'\' LIMIT 1'));
				if(!empty($dato['m_id'])) {
					if($this->is_banned($userid, $comid)) return '0: El usuario est&aacute; suspendido.';
					return $dato;
				} else return '0: El usuario no pertenece a esta comunidad.';
			} else return '0: Tu rango no te permite realizar esta operaci&oacute;n.';
		} else return '0: No te puedes autoadministrar.';
	}
	
	// Administrar usuario
	function member_admin_submit() {
		global $tsCore, $tsUser, $tsMonitor;
		// Obtenemos datos
		$comid = $tsCore->setSecure($_POST['comid']);
		$userid = $tsCore->setSecure($_POST['userid']);
		// Mas datos
		$dato = array(
			'type' => $tsCore->setSecure($_POST['type']),
			'rango' => $tsCore->setSecure($_POST['rango']),
			'tiempo' => empty($_POST['tiempo']) ? 0 : 1,
			'causa' => $tsCore->setSecure($_POST['causa']),
			'dias' => empty($_POST['tiempo']) ? 0 : time()+($_POST['dias']*86400)			
		);
		if(empty($_POST['tiempo'])) $tiempo = 'Permanente';
		else $tiempo = $_POST['dias'].' d&iacute;as, <b>Hasta: </b>'.strftime("%d/%m/%Y a las %H:%M:%S hs",$dato['dias']);
		// Yo mismo? ._.
		if($userid != $tsUser->uid) {
			// Es miembro de la comunidad?
			$data = db_exec('fetch_assoc', db_exec(array(__FILE__, __LINE__), 'query', 'SELECT m_id, m_permisos, m_user, user_name, c_nombre, c_nombre_corto, c_autor FROM c_miembros LEFT JOIN u_miembros ON user_id = m_user LEFT JOIN c_comunidades ON c_id = m_comunidad WHERE m_user = \''.(int)$userid.'\' AND m_comunidad = \''.(int)$comid.'\' LIMIT 1'));
			if(!empty($data['m_id'])) {
				if($this->is_banned($tsUser->uid, $comid)) { return '0: EL usuario est&aacute; suspendido.'; }
				if($data['c_autor'] == $userid) { return '0: No puedes banear al creador de la comunidad, si deseas continuar, opta por suspender la comunidad.'; }
				// Modificar rango
				if($dato['type'] == 1) {
					if($dato['rango'] != $data['m_permisos']) {
						if(db_exec(array(__FILE__, __LINE__), 'query', 'UPDATE c_miembros SET m_permisos = \''.(int)$dato['rango'].'\' WHERE m_user = \''.(int)$userid.'\' AND m_comunidad = \''.(int)$comid.'\' LIMIT 1')) {
							return '1: El rango fue modificado correctamente';
						} else return '0: Ocurri&oacute; un error, int&eacute;ntalo m&aacute;s tarde';
					} else return '0: Selecciona un rango diferente para modificar';
				// Banear
				} elseif($dato['type'] == 2) {
					if(db_exec(array(__FILE__, __LINE__), 'query', 'UPDATE c_miembros SET m_permisos = \'0\' WHERE m_user = \''.(int)$userid.'\' AND m_comunidad = \''.(int)$comid.'\' LIMIT 1')) {
						// MANDAR AVISO AL USUARIO
						$aviso = 'Hola <b>'.$data['user_name'].'</b><br /><br /> Lamento informarte que has sido baneado de la comunidad: <a href="'.$tsCore->settings['url'].'/comunidades/'.$data['c_nombre_corto'].'/"><b>'.
						$data['c_nombre'].'</b></a><br /><br />por <a href="'.$tsCore->settings['url'].'/'.$tsUser->nick.'/" class="hovercard" uid="'.$tsUser->uid.'">'.$tsUser->nick.'</a></ br><b> Causa: </b>'.$dato['causa'].'<br /><br /><b>Tiempo:</b> '.$tiempo.'</ br><br />Te recomendamos estar al tanto del protocolo para no tener este inconveniente de nuevo.<br /><br /> Muchas gracias por entender!';
						$tsMonitor->setAviso($data['m_user'], 'Has sido suspendido', $aviso, 3);
						// Insertamos baneado a la bd para que no tenga acceso a la comunidad
						db_exec(array(__FILE__, __LINE__), 'query', 'INSERT INTO c_baneados (ban_user, ban_comunidad, ban_causa, ban_fecha, ban_termina, ban_mod) VALUES (\''.$data['m_user'].'\', \''.(int)$comid.'\', \''.$dato['causa'].'\',
						\''.time().'\', \''.(int)$dato['dias'].'\', \''.$tsUser->uid.'\')');
						// Marcamos como suspendido en la lista de miembros
						db_exec(array(__FILE__, __LINE__), 'query', 'UPDATE c_miembros SET m_permisos = \'0\' WHERE m_user = \''.$data['m_user'].'\' AND m_comunidad = \''.(int)$comid.'\' LIMIT 1');
						// Descontamos el miembro
						db_exec(array(__FILE__, __LINE__), 'query', 'UPDATE c_comunidades SET c_miembros = c_miembros -1 WHERE c_id = \''.(int)$comid.'\'');
						// Ya no seguirá la comunidad
						db_exec(array(__FILE__, __LINE__), 'query', 'DELETE FROM u_follows WHERE f_type = \'4\' AND f_user = \''.$data['m_user'].'\' AND f_id = \''.(int)$comid.'\'');
						return '1: Usuario suspendido satisfactoriamente';
					} else return '0: Ocurri&oacute; un error, int&eacute;ntalo m&aacute;s tarde';
				} else return '0: Selecciona una opcion de administraci&oacute;n.';
			} else return '0: El usuario no pertenece a esta comunidad.';
		} else return '0: No te puedes autoadministrar.';
	}
	
	// Reactivar usuario suspendido
	function member_reactivar() {
		global $tsCore, $tsUser, $tsMonitor;
		// Obtenemos datos
		$comid = $tsCore->setSecure($_POST['comid']);
		$userid = $tsCore->setSecure($_POST['userid']);
		$causa = $tsCore->setSecure($_POST['razon']);
		// Existe el ban?
		$query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT ban_user, user_name, c_nombre, c_nombre_corto FROM c_baneados LEFT JOIN u_miembros ON user_id = ban_user LEFT JOIN c_comunidades ON c_id = ban_comunidad WHERE ban_user = \''.(int)$userid.'\' AND ban_comunidad = \''.(int)$comid.'\' LIMIT 1');
		$data = db_exec('fetch_assoc', $query);
		if(!empty($data['ban_user'])) {
			if(db_exec(array(__FILE__, __LINE__), 'query', 'DELETE FROM c_baneados WHERE ban_user = \''.(int)$userid.'\' AND ban_comunidad = \''.(int)$comid.'\' LIMIT 1')) {
				db_exec(array(__FILE__, __LINE__), 'query', 'UPDATE c_miembros SET m_permisos = \'3\' WHERE m_user = \''.(int)$userid.'\' AND m_comunidad = \''.(int)$comid.'\' LIMIT 1');
				// Sumamos de nuevo al miembro
				db_exec(array(__FILE__, __LINE__), 'query', 'UPDATE c_comunidades SET c_miembros = c_miembros + 1 WHERE c_id = \''.(int)$comid.'\'');
				// MANDAR AVISO AL USUARIO
				$aviso = 'Hola <b>'.$data['user_name'].'</b><br /><br /> Te informo que has sido reactivado de la comunidad: <a href="'.$tsCore->settings['url'].'/comunidades/'.$data['c_nombre_corto'].'/"><b>'.
				$data['c_nombre'].'</b></a><br /><br />por <a href="'.$tsCore->settings['url'].'/'.$tsUser->nick.'/" class="hovercard" uid="'.$tsUser->uid.'">'.$tsUser->nick.'</a></ br><b> Causa: </b>'.$causa.'<br /><br /> Perdone las molestias, muchas gracias por entender!';
				$tsMonitor->setAviso($data['ban_user'], 'Has sido reactivado', $aviso, 2);
				return '1: Usuario rehabilitado con &eacute;xito.';
			} else return '0: Ocurri&oacute; un error, int&eacute;ntalo m&aacute;s tarde';
		} else return '0: El usuario a rehabilitar no est&aacute; suspendido.';
	}
	
	// Obtener datos del borrador de un tema
	function datosBorrador($comid, $bid) {
		global $tsCore, $tsUser;
		// Existe el borrador?
		$bor = db_exec('fetch_assoc', db_exec(array(__FILE__, __LINE__), 'query', 'SELECT b_id, b_autor FROM c_borradores WHERE b_id = \''.(int)$bid.'\' AND b_autor = \''.$tsUser->uid.'\' AND b_comunidad = \''.(int)$comid.'\' LIMIT 1'));
		if(!empty($bor['b_id'])) {
			$query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT * FROM c_borradores WHERE b_id = \''.(int)$bid.'\' AND b_autor = \''.$tsUser->uid.'\' LIMIT 1');
			$data = db_exec('fetch_assoc', $query);
			$dato = array(
				'b_id' => $data['b_id'],
				't_titulo' => $data['b_titulo'],
				't_cuerpo' => $data['b_cuerpo'],
				't_cerrado' => $data['b_cerrado'],
				't_sticky' => $data['b_esticky']					
			);
			return $dato;
		}
	}
	
	// Guardar borrador
	function saveBorrador() {
		global $tsCore, $tsUser;
		$bid = false;
		$dato = array(
			'bid' => $tsCore->setSecure($_POST['bid']),
			'comid' => $tsCore->setSecure($_POST['comid']),
			'titulo' => $tsCore->setSecure($_POST['titulo']),
			'cuerpo' => $tsCore->setSecure($_POST['cuerpo']),
			'cerrado' => empty($_POST['cerrado']) ? 0 : 1,
			'sticky' => empty($_POST['sticky']) ? 0 : 1
		);
		if(!empty($dato['bid'])) {
			$bor = db_exec('fetch_assoc', db_exec(array(__FILE__, __LINE__), 'query', 'SELECT b_id, b_comunidad FROM c_borradores WHERE b_id = \''.(int)$dato['bid'].'\''));
			$bid = $bor['b_id'];
		}
		// Vacios
		if(empty($dato['titulo'])) return '0: El campo <b>T&iacute;tulo</b> es requerido.';
		if(empty($dato['cuerpo'])) return '0: El campo <b>Cuerpo</b> es requerido.';
		// Si ya existe actualizamos
		if(!empty($bid)) {
			if(db_exec(array(__FILE__, __LINE__), 'query', 'UPDATE c_borradores SET b_comunidad = \''.(int)$dato['comid'].'\', b_autor = \''.$tsUser->uid.'\', b_titulo = \''.$dato['titulo'].'\', b_cuerpo = \''.$dato['cuerpo'].'\', b_cerrado = \''.$dato['cerrado'].'\', b_sticky = \''.$dato['sticky'].'\', b_fecha = \''.time().'\' WHERE b_id = \''.(int)$bid.'\' LIMIT 1')) return '1: '.$bid;
			else return '0: Ocurri&oacute; un error, int&eacute;ntalo m&aacute;s tarde';
		} else {
			if(db_exec(array(__FILE__, __LINE__), 'query', 'INSERT INTO c_borradores (b_comunidad, b_autor, b_titulo, b_cuerpo, b_cerrado, b_sticky, b_fecha) VALUES (\''.(int)$dato['comid'].'\', \''.$tsUser->uid.'\', \''.$dato['titulo'].'\', \''.$dato['cuerpo'].'\', \''.$dato['cerrado'].'\', \''.$dato['sticky'].'\', \''.time().'\')')) return '1: '.db_exec('insert_id');
			else return '0: Ocurri&oacute; un error, int&eacute;ntalo m&aacute;s tarde';
		}
	}
	
	// Buscador general
    function getQuery() {
        global $tsCore, $tsUser;
        //
        $q = $tsCore->setSecure($_GET['q']);
        $c = intval($_GET['cat']);
        $o = $_GET['ord'];
        // ESTABLECER FILTROS
        if($c > 0) $where_cat = 'AND c.c_categoria = \''.(int)$c.'\'';
        // TEMAS
		$query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT COUNT(t.t_id) AS total FROM c_temas AS t LEFT JOIN c_comunidades AS c ON c.c_id = t.t_comunidad LEFT JOIN u_miembros AS u ON u.user_id = t.t_autor WHERE u.user_activo = \'1\' AND u.user_baneado = \'0\' AND t.t_estado = \'0\' AND c.c_estado = \'0\' AND t.t_titulo LIKE \'%'.$q.'%\'');
		$total = db_exec('fetch_assoc', $query);
		$data['temas']['total'] = $total['total'];
		$query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT c.c_nombre, c.c_nombre_corto, c.c_sub_categoria, t.t_id, t.t_titulo, t.t_respuestas, t.t_autor, t.t_fecha, t.t_votos_pos, t.t_votos_neg, u.user_name FROM c_temas AS t LEFT JOIN c_comunidades AS c ON c.c_id = t.t_comunidad LEFT JOIN u_miembros AS u ON u.user_id = t.t_autor WHERE u.user_activo = \'1\' AND u.user_baneado = \'0\' AND t.t_estado = \'0\' AND c.c_estado = \'0\' '.$where_cat.' AND t.t_titulo LIKE \'%'.$q.'%\' ORDER BY t.t_fecha DESC LIMIT 10');
		$array = result_array($query);
		// Para la categoria...
		$i = 0;
		foreach($array as $dato) {
			$data['temas']['data'][$i] = $dato;
			$data['temas']['data'][$i]['sub_cat'] = db_exec('fetch_assoc', db_exec(array(__FILE__, __LINE__), 'query', 'SELECT c_seo FROM c_subcategorias LEFT JOIN c_categorias ON cid = s_type WHERE sid = \''.$dato['c_sub_categoria'].'\''));
			$i++;
		}
		
		// COMUNIDADES
		$query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT COUNT(c.c_id) AS total FROM c_comunidades AS c LEFT JOIN u_miembros AS u ON u.user_id = c.c_autor LEFT JOIN c_subcategorias AS sub ON sub.sid = c.c_sub_categoria LEFT JOIN c_categorias AS cat ON cat.cid = sub.s_type WHERE u.user_activo = \'1\' AND u.user_baneado = \'0\' AND c.c_estado = \'0\' AND c.c_nombre LIKE \'%'.$q.'%\'');
		$total = db_exec('fetch_assoc', $query);
		$data['comus']['total'] = $total['total'];
		$query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT c.c_id, c.c_nombre, c.c_nombre_corto, c.c_miembros, c.c_temas, c.c_sub_categoria, u.user_name, cat.c_nombre AS categoria, sub.s_nombre AS subcategoria FROM c_comunidades AS c LEFT JOIN u_miembros AS u ON u.user_id = c.c_autor LEFT JOIN c_subcategorias AS sub ON sub.sid = c.c_sub_categoria LEFT JOIN c_categorias AS cat ON cat.cid = sub.s_type WHERE u.user_activo = \'1\' AND u.user_baneado = \'0\' AND c.c_estado = \'0\' '.$where_cat.' AND c.c_nombre LIKE \'%'.$q.'%\' ORDER BY c.c_fecha DESC LIMIT 10');
		$data['comus']['data'] = result_array($query);
        
        //
        return $data;
    }
	
	// Buscador por tipo
    function getQueryTipo($tipo) {
        global $tsCore, $tsUser;
        //
        $q = $tsCore->setSecure($_GET['q']);
        $c = intval($_GET['cat']);
        $o = $_GET['ord'];
		$comid = intval($_GET['comid']);
        // ESTABLECER FILTROS
		
		# Categoria
        if($c > 0) $where_cat = 'AND c.c_categoria = \''.(int)$c.'\'';
		# Comunidad
		if($comid > 0) $w_comid = 'AND c.c_id = \''.(int)$comid.'\'';
		
		// Tipo
        if($tipo == 'temas') $search_on = 't.t_titulo';
        else $search_on = 'c.c_nombre';
        // BUSQUEDA
        $w_search = 'AND '.$search_on.' LIKE \'%'.$q.'%\'';
        // PAGINAS POR TIPO DE BUSQUEDA
		$max = 20;
		if($tipo == 'temas') {
			// Orden
			if($o == 'titulo') $order = 't.t_titulo';
			if($o == 'fecha') $order = 't.t_fecha';
			if($o == 'votos') $order = 't.v_votos_pos';
			elseif($o == 'respuestas') $order = 't.t_respuestas';
			else $order = 't.t_fecha';
			// Total
			$query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT COUNT(t.t_id) AS total FROM c_temas AS t LEFT JOIN c_comunidades AS c ON c.c_id = t.t_comunidad LEFT JOIN u_miembros AS u ON u.user_id = t.t_autor WHERE u.user_activo = \'1\' AND u.user_baneado = \'0\' AND t.t_estado = \'0\' AND c.c_estado = \'0\' '.$w_comid.' '.$w_search.'');
			$total = db_exec('fetch_assoc', $query);
			$data['temas']['total'] = $total['total'];
			
			$limit = $tsCore->setPageLimit($max,false,$data['temas']['total']);
			$data['pages'] = $tsCore->getPages($data['temas']['total'], $max);
			//
			$query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT c.c_nombre, c.c_nombre_corto, c.c_sub_categoria, t.t_id, t.t_titulo, t.t_respuestas, t.t_autor, t.t_fecha, t.t_votos_pos, t.t_votos_neg, u.user_name FROM c_temas AS t LEFT JOIN c_comunidades AS c ON c.c_id = t.t_comunidad LEFT JOIN u_miembros AS u ON u.user_id = t.t_autor WHERE u.user_activo = \'1\' AND u.user_baneado = \'0\' AND t.t_estado = \'0\' AND c.c_estado = \'0\' '.$w_comid.' '.$w_search.' ORDER BY '.$order.' DESC LIMIT '.$limit);
			$array = result_array($query);
			// Para la categoria...
			$i = 0;
			foreach($array as $dato) {
				$data['temas']['data'][$i] = $dato;
				$data['temas']['data'][$i]['sub_cat'] = db_exec('fetch_assoc', db_exec(array(__FILE__, __LINE__), 'query', 'SELECT c_seo FROM c_subcategorias LEFT JOIN c_categorias ON cid = s_type WHERE sid = \''.$dato['c_sub_categoria'].'\''));
				$i++;
			}
		} else {
			// Orden
			if($o == 'titulo') $order = 'c.c_nombre';
			if($o == 'fecha') $order = 'c.c_fecha';
			if($o == 'miembros') $order = 'c.c_miembros';
			elseif($o == 'temas') $order = 'c.c_temas';
			else $order = 'c.c_fecha';
			// Total
			$query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT COUNT(c.c_id) AS total FROM c_comunidades AS c LEFT JOIN u_miembros AS u ON u.user_id = c.c_autor LEFT JOIN c_subcategorias AS sub ON sub.sid = c.c_sub_categoria LEFT JOIN c_categorias AS cat ON cat.cid = sub.s_type WHERE u.user_activo = \'1\' AND u.user_baneado = \'0\' AND c.c_estado = \'0\' '.$where_cat.' '.$w_search.'');
			$total = db_exec('fetch_assoc', $query);
			$data['comus']['total'] = $total['total'];
			
			$limit = $tsCore->setPageLimit($max,false,$data['comus']['total']);
			$data['pages'] = $tsCore->getPages($data['comus']['total'], $max);
			//
			$query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT c.c_id, c.c_nombre, c.c_nombre_corto, c.c_miembros, c.c_temas, c.c_sub_categoria, u.user_name, cat.c_nombre AS categoria, sub.s_nombre AS subcategoria FROM c_comunidades AS c LEFT JOIN u_miembros AS u ON u.user_id = c.c_autor LEFT JOIN c_subcategorias AS sub ON sub.sid = c.c_sub_categoria LEFT JOIN c_categorias AS cat ON cat.cid = sub.s_type WHERE u.user_activo = \'1\' AND u.user_baneado = \'0\' AND c.c_estado = \'0\' '.$where_cat.' '.$w_search.' ORDER BY '.$order.' DESC LIMIT '.$limit);
        	$data['comus']['data'] = result_array($query);
		}
        //
        return $data;
	}
	
	// Favoritos
	function getFavoritos() {
		global $tsCore, $tsUser;
		//
		$query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT f.fav_id, f.f_date, c.c_nombre, c.c_nombre_corto, c.c_sub_categoria, t.t_id, t.t_titulo, t.t_respuestas, t.t_fecha FROM c_favoritos AS f LEFT JOIN c_temas AS t ON t.t_id = f.f_tema LEFT JOIN c_comunidades AS c ON c.c_id = t.t_comunidad LEFT JOIN u_miembros AS u ON u.user_id = t.t_autor WHERE f.f_user = \''.$tsUser->uid.'\' AND u.user_activo = \'1\' AND u.user_baneado = \'0\' AND t.t_estado = \'0\' AND c.c_estado = \'0\' ORDER BY f.f_date DESC');
		$array = result_array($query);
		// Para la categoria...
		$i = 0;
		foreach($array as $dato) {
			$data['data'][$i] = $dato;
			$data['data'][$i]['sub_cat'] = db_exec('fetch_assoc', db_exec(array(__FILE__, __LINE__), 'query', 'SELECT c_seo FROM c_subcategorias LEFT JOIN c_categorias ON cid = s_type WHERE sid = \''.$dato['c_sub_categoria'].'\''));
			$i++;
		}
		// Total
		$data['total'] = count($array);
		// Categorias
		$query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT COUNT(c.c_id) AS total, cat.c_nombre, cat.c_seo FROM c_favoritos AS f LEFT JOIN c_temas AS t ON t.t_id = f.f_tema LEFT JOIN c_comunidades AS c ON c.c_id = t.t_comunidad LEFT JOIN u_miembros AS u ON u.user_id = t.t_autor LEFT JOIN c_categorias AS cat ON cat.cid = c.c_categoria WHERE f.f_user = \''.$tsUser->uid.'\' AND u.user_activo = \'1\' AND u.user_baneado = \'0\' AND t.t_estado = \'0\' AND c.c_estado = \'0\' GROUP BY c.c_categoria ORDER BY total ASC');
		$data['cat'] = result_array($query);
		//
		return $data;
	}
	
	// Borradores
	function getBorradores() {
		global $tsCore, $tsUser;
		//
		$query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT b.b_id, b.b_fecha, b.b_titulo, c.c_id, c.c_nombre, c.c_nombre_corto FROM c_borradores AS b LEFT JOIN c_comunidades AS c ON c.c_id = b.b_comunidad WHERE b.b_autor = \''.$tsUser->uid.'\' AND c.c_estado = \'0\' ORDER BY b.b_fecha DESC');
		$data['data'] = result_array($query);
		// Total
		$data['total'] = count($data['data']);
		// Counidades
		$query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT COUNT(c.c_id) AS total, c.c_nombre, c.c_id FROM c_borradores AS b LEFT JOIN c_comunidades AS c ON c.c_id = b.b_comunidad WHERE b.b_autor = \''.$tsUser->uid.'\' AND c.c_estado = \'0\' GROUP BY b.b_comunidad ORDER BY total ASC');
		$data['comus'] = result_array($query);
		//
		return $data;
	}
	
	// Borrar borrador
	function del_borrador(){
		global $tsCore, $tsUser;
		//
		$bid = $tsCore->setSecure($_POST['bid']);
		// CONSULTAR
		$query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT b_id, b_autor FROM c_borradores WHERE b_id = \''.(int)$bid.'\'');
		$data = db_exec('fetch_assoc', $query);
		// ES MIO O TIENE PERMISOS
		if(!empty($data['b_id'])){
			if($data['b_autor'] == $tsUser->uid) {
				if(db_exec(array(__FILE__, __LINE__), 'query', 'DELETE FROM c_borradores WHERE b_id = \''.(int)$bid.'\'')) {
					return '1: Borrador removido con exito.';
				} else return '0: Ocurri&oacute; un error al intentar procesar lo solicitado.';
			} else return '0: Lo que intentas hacer no est&aacute; permitido.';
		} else return '0: El borrador no existe o ya lo eliminaste.';
	}
}