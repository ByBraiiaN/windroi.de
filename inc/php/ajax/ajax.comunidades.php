<?php if ( ! defined('TS_HEADER')) exit('No se permite el acceso directo al script');
/**
 * Controlador AJAX
 *
 * @name    ajax.files.php
 * @author  Kmario19 - PHPost Team
*/
/**********************************\

*	(VARIABLES POR DEFAULT)		*

\*********************************/

	// NIVELES DE ACCESO Y PLANTILLAS DE CADA ACCIÓN
	$files = array(
		'comunidades-subcategorias' => array('n' => 2, 'p' => 'sub_categorias'),
		'comunidades-preview_tema' => array('n' => 2, 'p' => 'preview_tema'),
		'comunidades-responder' => array('n' => 2, 'p' => 'tema_respuesta'),
		'comunidades-pages_temas' => array('n' => 0, 'p' => 'pages_temas'),
		'comunidades-pages_respuestas' => array('n' => 0, 'p' => 'pages_respuestas'),
		'comunidades-member_admin' => array('n' => 2, 'p' => 'member_admin'),
		'comunidades-load_members' => array('n' => 2, 'p' => 'com_members'),
	);

/**********************************\

* (VARIABLES LOCALES ESTE ARCHIVO)	*

\*********************************/

	// REDEFINIR VARIABLES
	$tsPage = 'comus_ajax/c.'.$files[$action]['p'];
	$tsLevel = isset($files[$action]['n']) ? $files[$action]['n'] : 2;
	$tsAjax = empty($files[$action]['p']) ? 1 : 0;

/**********************************\

*	(INSTRUCCIONES DE CODIGO)		*

\*********************************/
	
	// DEPENDE EL NIVEL
	$tsLevelMsg = $tsCore->setLevel($tsLevel, true);
	if($tsLevelMsg != 1) { echo '0: '.$tsLevelMsg['mensaje']; die();}
	// CLASE
	include('../class/c.comunidades.php');
  	$tsCom =& tsCom::getInstance();	
	// CODIGO
	switch($action){
		case 'comunidades-subcategorias':
			//<--
				$cid = intval($_POST['cid']);
				if($cid) {
					$subs = $tsCom->getSubcats($cid);
					$smarty->assign("tsSubcats", $subs);
				} else die('Error');
			//-->
		break;
		case 'comunidades-preview_tema':
			//<--
				$smarty->assign("tsPreview",$tsCom->getPreview());
			//-->
		break;		
		case 'comunidades-responder':
			//<--
				$res = $tsCom->nueva_respuesta();
				if(is_array($res)) $smarty->assign("newCom",$res);
    			else die($res);
			//-->
		break;
		case 'comunidades-unirme':
			//<--
				echo $tsCom->unirme_comunidad();
			//-->
		break;
		case 'comunidades-abandonar':
			//<--
				echo $tsCom->abandonar_comunidad();
			//-->
		break;
		case 'comunidades-seguir_com':
			//<--
				echo $tsCom->seguir_comunidad();
			//-->
		break;
		case 'comunidades-seguir_tema':
			//<--
				echo $tsCom->seguir_tema();
			//-->
		break;
		case 'comunidades-edit_imagen':
			//<--
				$result = $tsCom->uploadImagen($_FILES['imagen'], $_GET['comid'], 1);
            	echo $tsCore->setJSON($result);
			//-->
		break;
		case 'comunidades-edit_fondo':
			//<--
				$result = $tsCom->uploadImagen($_FILES['background'], $_GET['comid'], 3);
            	echo $tsCore->setJSON($result);
			//-->
		break;
		case 'comunidades-votar_tema':
			//<--
            	echo $tsCom->votar_tema();
			//-->
		break;
		case 'comunidades-votar_respuesta':
			//<--
            	echo $tsCom->votar_respuesta();
			//-->
		break;
		case 'comunidades-add_favorito':
			//<--
            	echo $tsCom->add_favorito();
			//-->
		break;
		case 'comunidades-reco_tema':
			//<--
            	echo $tsCom->reco_tema();
			//-->
		break;
		case 'comunidades-del_tema':
			//<--
            	echo $tsCom->del_tema();
			//-->
		break;
		case 'comunidades-reactivar_tema':
			//<--
            	echo $tsCom->reactivar_tema();
			//-->
		break;
		case 'comunidades-del_respuesta':
			//<--
            	echo $tsCom->del_respuesta();
			//-->
		break;
		case 'comunidades-pages_temas':
			//<--
            	$tsTemas = $tsCom->getComTemas($_POST['comid']);
				$smarty->assign("tsTemas",$tsTemas);
			//-->
		break;
		case 'comunidades-pages_respuestas':
			//<--
            	$tsRespuestas = $tsCom->getRespuestas(true);
				$smarty->assign("tsRespuestas",$tsRespuestas);
			//-->
		break;
		case 'comunidades-member_admin':
			//<--
            	$result = $tsCom->member_admin();
				if(is_array($result)) $smarty->assign("tsAdmin",$result);
				else echo $result;
			//-->
		break;
		case 'comunidades-member_admin_submit':
			//<--
            	echo $tsCom->member_admin_submit();
			//-->
		break;
		case 'comunidades-member_reactivar':
			//<--
            	echo $tsCom->member_reactivar();
			//-->
		break;
		case 'comunidades-load_members':
			//<--
				if(isset($_POST['search'])) {
					$result = $tsCom->buscar_miembro();
				} else {
            		$result = $tsCom->getMiembros($_POST['comid'], $_POST['type']);
				}
				$smarty->assign("tsMiembros",$result);
			//-->
		break;
		case 'comunidades-borrar_com':
			//<--
            	echo $tsCom->delComunidad();
			//-->
		break;
		case 'comunidades-save_borrador':
			//<--
            	echo $tsCom->saveBorrador();
			//-->
		break;
		case 'comunidades-del_favorito':
			//<--
            	echo $tsCom->del_favorito();
			//-->
		break;
		case 'comunidades-del_borrador':
			//<--
            	echo $tsCom->del_borrador();
			//-->
		break;

	}