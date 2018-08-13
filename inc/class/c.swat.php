<?php if ( ! defined('TS_HEADER')) exit('No se permite el acceso directo al script');
/**
 * Modelo para el control denuncias
 *
 * @name    c.swat.php
 * @author  PHPost Team
 */
class tsSwat{

	// INSTANCIA DE LA CLASE
	public static function &getInstance(){
		static $instance;
		
		if( is_null($instance) ){
			$instance = new tsSwat();
    	}
		return $instance;
	}
	
	/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*\
								METODOS
	/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
    /*
        setDenuncia()
    */
    function setDenuncia($obj_id, $type = 'posts'){
        global $tsCore, $tsUser;
        // VARS
        $razon = $tsCore->setSecure($_POST['razon']);
        $extras = $tsCore->setSecure($_POST['extras']);
        $date = time();
        // QUE?
        switch($type){
            case 'posts':
            // ¿ES MI POST O ESTÁ EN STICKY?
          $query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT `post_id`, `post_user`, `post_sticky` FROM `p_posts` WHERE `post_id` = \''.(int)$obj_id.'\' LIMIT 1') or exit( show_error('Error al ejecutar la consulta de la l&iacute;nea '.__LINE__.' de '.__FILE__.'.', 'db') );
          $my_post = db_exec('fetch_assoc', $query);
            
			if(empty($my_post['post_id'])) return '0: No puedes denunciar un post que no existe.';
            if($my_post['post_user'] == $tsUser->uid) return '0: No puedes denunciar tus propios post.';			
			if($my_post['post_sticky'] == '1') return '0: No puedes denunciar posts en sticky.';
            if($tsUser->is_admod == 1) return '0: No puedes denunciar siendo moderador, pero puedes atender las denuncias de los usuarios.';
            // YA HA REPORTADO?
            $query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT `did` FROM `w_denuncias` WHERE `obj_id` = \''.(int)$obj_id.'\' AND `d_user` = '.$tsUser->uid.' AND `d_type` = \'1\'');
            $denuncio = db_exec('num_rows', $query);
            
            if(!empty($denuncio)) return '0: Ya hab&iacute;as denunciado este post.';
            // CUANTAS DENUNCIAS LLEVA?
            $denuncias = db_exec('num_rows', db_exec(array(__FILE__, __LINE__), 'query', 'SELECT did FROM w_denuncias WHERE obj_id = \''.(int)$obj_id.'\' && d_type = \'1\''));
            // OCULTAMOS EL POST SI YA LLEVA MAS DE 3 DENUNCIAS
            if($denuncias >= 2){
                db_exec(array(__FILE__, __LINE__), 'query', 'UPDATE `p_posts` SET `post_status` = \'1\' WHERE `post_id` = \''.(int)$obj_id.'\'');
                db_exec(array(__FILE__, __LINE__), 'query', 'UPDATE `w_stats` SET `stats_posts` = stats_posts - \'1\' WHERE `stats_no` = \'1\'');
            }
            // INSERTAR NUEVA DENUNCIA
            if(db_exec(array(__FILE__, __LINE__), 'query', 'INSERT INTO `w_denuncias` (`obj_id`, `d_user`, `d_razon`, `d_extra`, `d_type`, `d_date`) VALUES (\''.(int)$obj_id.'\', \''.$tsUser->uid.'\', \''.$razon.'\', \''.$extras.'\', \'1\', \''.$date.'\')')){
				return '1: La denuncia fue enviada.';
            } else return '0: Error, int&eacute;ntalo m&aacute;s tarde.';

            break;
            // MENSAJES
            case 'mensaje':
                // YA HA REPORTADO?
                $query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT `did` FROM `w_denuncias` WHERE `obj_id` = \''.(int)$obj_id.'\' AND d_user = \''.$tsUser->uid.'\' AND `d_type` = \'2\'');
                $denuncio = db_exec('num_rows', $query);
                
                if(!empty($denuncio)) return '0: Ya hab&iacute;as denunciado este mensaje. Nuestros moderadores ya lo analizan.';
                // DONDE LO BORRAREMOS?
                $query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT `mp_id`, `mp_to`, `mp_from` FROM `u_mensajes` WHERE `mp_id` = \''.(int)$obj_id.'\' LIMIT 1');
                $where = db_exec('fetch_assoc', $query);
                
                if(empty($where['mp_id'])) return '0: Opps... Este mensaje no existe.';
                //
                if($where['mp_to'] == $tsUser->uid) $del_table = 'mp_del_to';
                elseif($where['mp_from'] == $tsUser->uid) $del_table = 'mp_del_from';
                // INSERTAR NUEVA DENUNCIA
				if(db_exec(array(__FILE__, __LINE__), 'query', 'INSERT INTO w_denuncias (obj_id, d_user, d_razon, d_extra, d_type, d_date) VALUES (\''.(int)$obj_id.'\', \''.$tsUser->uid.'\', \'0\', \'\', \'2\', \''.$date.'\') ')){
                   // BORRAMOS
                    db_exec(array(__FILE__, __LINE__), 'query', 'UPDATE `u_mensajes` SET '.$del_table.' = \'1\' WHERE `mp_id` = \''.(int)$obj_id.'\'');
                    return '1: Has denunciado un mensaje como correo no deseado. <script>setTimeout(function(){document.location.href = global_data.url + "/mensajes/";}, 1500);</script>';
                } else return '0: Error! Int&eacute;ntalo m&aacute;s tarde.';
            break;
			// COMUNIDADES
			case 'comunidad':
				// ¿ES MI COMUNIDAD O ESTÁ OCULTA?
				$query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT c_id, c_autor, c_estado FROM c_comunidades WHERE c_id = \''.(int)$obj_id.'\' LIMIT 1') or exit( show_error('Error al ejecutar la consulta de la l&iacute;nea '.__LINE__.' de '.__FILE__.'.', 'db') );
				$my_comu = db_exec('fetch_assoc', $query);
				
				if(empty($my_comu['c_id'])) return '0: Esta comunidad no existe';	
				if($my_comu['c_autor'] == $tsUser->uid) return '0: No puedes denunciar tus propias comunidades.';			
				if($my_comu['c_estado'] == '1') return '0: No puedes denunciar comunidades ocultas.';
				// YA HA REPORTADO?
				$query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT `did` FROM `w_denuncias` WHERE `obj_id` = \''.(int)$obj_id.'\' AND `d_user` = '.$tsUser->uid.' AND `d_type` = \'5\'');
				$denuncio = db_exec('num_rows', $query);
				
				if(!empty($denuncio)) return '0: Ya hab&iacute;as denunciado esta comunidad.';
				// INSERTAR NUEVA DENUNCIA
				if(db_exec(array(__FILE__, __LINE__), 'query', 'INSERT INTO `w_denuncias` (`obj_id`, `d_user`, `d_razon`, `d_extra`, `d_type`, `d_date`) VALUES (\''.(int)$obj_id.'\', \''.$tsUser->uid.'\', \''.$razon.'\', \''.$extras.'\', \'5\', \''.$date.'\')')){
				return '1: La denuncia fue enviada.';
				} else return '0: Error, int&eacute;ntalo m&aacute;s tarde.';
            break;
			// TEMAS
			case 'tema':
				// ¿ES MI TEMA O ESTÁ OCULTO?
				$query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT t_id, t_autor, t_estado FROM c_temas WHERE t_id = \''.(int)$obj_id.'\' LIMIT 1') or exit( show_error('Error al ejecutar la consulta de la l&iacute;nea '.__LINE__.' de '.__FILE__.'.', 'db') );
				$my_tema = db_exec('fetch_assoc', $query);
				
				if(empty($my_tema['t_id'])) return '0: Este tema no existe';	
				if($my_tema['t_autor'] == $tsUser->uid) return '0: No puedes denunciar tus propios temas.';			
				if($my_tema['t_estado'] == '1') return '0: No puedes denunciar temas ocultos.';
				// YA HA REPORTADO?
				$query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT `did` FROM `w_denuncias` WHERE `obj_id` = \''.(int)$obj_id.'\' AND `d_user` = '.$tsUser->uid.' AND `d_type` = \'6\'');
				$denuncio = db_exec('num_rows', $query);			
				if(!empty($denuncio)) return '0: Ya hab&iacute;as denunciado este tema.';
				// CUANTAS DENUNCIAS LLEVA?
				$denuncias = db_exec('num_rows', db_exec(array(__FILE__, __LINE__), 'query', 'SELECT `did` FROM `w_denuncias` WHERE `obj_id` = \''.(int)$obj_id.'\' AND `d_type` = \'6\''));
				// OCULTAMOS EL COMENTARIO SI YA LLEVA MÁS DE 3 DENUNCIAS
				if($denuncias >= 2){
					db_exec(array(__FILE__, __LINE__), 'query', 'UPDATE c_temas SET t_estado = \'2\' WHERE t_id = \''.(int)$obj_id.'\'') or exit( show_error('Error al ejecutar la consulta de la l&iacute;nea '.__LINE__.' de '.__FILE__.'.', 'db') );
				}
				// INSERTAR NUEVA DENUNCIA
				if(db_exec(array(__FILE__, __LINE__), 'query', 'INSERT INTO `w_denuncias` (`obj_id`, `d_user`, `d_razon`, `d_extra`, `d_type`, `d_date`) VALUES (\''.(int)$obj_id.'\', \''.$tsUser->uid.'\', \''.$razon.'\', \''.$extras.'\', \'6\', \''.$date.'\')')){
				return '1: La denuncia fue enviada.';
				} else return '0: Error, int&eacute;ntalo m&aacute;s tarde.';
			break;
            // USUARIOS
            case 'usuario':
                // YA HA REPORTADO?
				$query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT did FROM w_denuncias WHERE obj_id = \''.(int)$obj_id.'\' AND d_user = \''.$tsUser->uid.'\' AND d_type = \'3\'');
                $denuncio = db_exec('num_rows', $query);
                
                if(!empty($denuncio)) return '0: Ya hab&iacute;as denunciado a este usario.';
                $username = $tsUser->getUserName($obj_id);
                if(empty($username)) return '0: Opps... Este usuario no existe.';
                // LO REPORTAMOS...
				if(db_exec(array(__FILE__, __LINE__), 'query', 'INSERT INTO w_denuncias (obj_id, d_user, d_razon, d_extra, d_type, d_date) VALUES (\''.(int)$obj_id.'\', \''.$tsUser->uid.'\', \''.$tsCore->setSecure($razon).'\', \''.$tsCore->setSecure($extras).'\', \'3\', \''.$date.'\')')){
				 // SUMAMOS
                    db_exec(array(__FILE__, __LINE__), 'query', 'UPDATE `u_miembros` SET `user_bad_hits` = user_bad_hits + 1 WHERE `user_id` = \''.(int)$obj_id.'\'');
                    return '1: Este usuario ha sido denunciado.';
                } else return '0: Error! Int&eacute;ntalo m&aacute;s tarde.';
            break;
        }
    }
}