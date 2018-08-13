<?php 
/**
 * @name    comunidades.php
 * @author  Kmario19
**/
/**********************************\

*	(VARIABLES POR DEFAULT)		*

\*********************************/

	$tsPage = "comunidades";	// tsPage.tpl -> PLANTILLA PARA MOSTRAR CON ESTE ARCHIVO.

	$tsLevel = 0;		// NIVEL DE ACCESO A ESTA PAGINA. => VER FAQs

	$tsAjax = empty($_GET['ajax']) ? 0 : 1; // LA RESPUESTA SERA AJAX?
	
	$tsContinue = true;	// CONTINUAR EL SCRIPT
	
/*++++++++ = ++++++++*/

	include "../../header.php"; // INCLUIR EL HEADER

	$tsTitle = 'Comunidades de ' . $tsCore->settings['titulo']; 	// TITULO DE LA PAGINA ACTUAL

/*++++++++ = ++++++++*/
    $action = htmlspecialchars($_GET['action']);
	$act = htmlspecialchars($_GET['act']);	
	// VERIFICAMOS EL NIVEL DE ACCSESO ANTES CONFIGURADO
	$tsLevelMsg = $tsCore->setLevel($tsLevel, true);
	if($tsLevelMsg != 1){	
		$tsPage = 'aviso';
		$tsAjax = 0;
		$smarty->assign("tsAviso",$tsLevelMsg);
		//
		$tsContinue = false;
	}
	//
	if($tsContinue){
		
/**********************************\

* (VARIABLES LOCALES ESTE ARCHIVO)	*

\*********************************/

	include("../class/c.comunidades.php");
	$tsCom =& tsCom::getInstance();	

/**********************************\

*	(INSTRUCCIONES DE CODIGO)		*

\*********************************/
		
	if($action == '' || $action == 'home') {
		$temas = $tsCom->getLastTemas($act);
		// ULTIMOS TEMAS
		$smarty->assign("tsLastTemas",$temas);
		// PAGINAS
		$smarty->assign("tsPages",$temas['pages']);
		// CATEGORIAS
		$smarty->assign('tsCats',$tsCom->getCats());
		// ESTADISTICAS
		$smarty->assign("tsStats",$tsCom->getStats());
		// COMENTARIOS RECIENTES
    	$smarty->assign("tsRespuestas",$tsCom->getComensRecent());
		// POPULARES
    	$smarty->assign("tsPopulares",$tsCom->getPopulares());
		// COMUNIDADES RECIENTES
		$smarty->assign('tsRecientes',$tsCom->getComRecentHome());
	} elseif($action == 'crear') {
		if($tsUser->is_member) {
			if(isset($_POST['nombre'])) {
				$new_com = $tsCom->nueva_comunidad();
				if($new_com > 0) {
					$tsPage = 'aviso';
					$smarty->assign("tsAviso",array('titulo' => 'YEAH!', 'mensaje' => 'El mundo entero est&aacute; ante la presencia de una nueva comunidad. Felicitaciones!', 'but' => 'Ir a mi nueva comunidad!', 'link' => "{$tsCore->settings['url']}/comunidades/".$tsCore->setSeo($_POST['ncorto'])."/"));
				} else $tsError = $new_com;
			}
		} else return 'Debes ser miembro para poder crear comunidades.';
		// CATEGORIAS
		$smarty->assign('tsCats',$tsCom->getCats());
		// PAISES
		include('../ext/datos.php');
		$smarty->assign("tsPaises",$tsPaises);
	} elseif($action == 'buscar') {
		// Nuevo titulo
		$tsTitle = 'Busqueda en comunidades - '.$tsCore->settings['titulo'];
		// CATEGORIAS
		$smarty->assign('tsCats',$tsCom->getCats());
		$smarty->assign('tipo',$_GET['tipo']);
		$smarty->assign('q',$_GET['q']);
		$smarty->assign('cat',$_GET['cat']);
		$smarty->assign('ord',$_GET['ord']);
		$smarty->assign('comid',$_GET['comid']);
		if(!empty($_GET['q']) && strlen($_GET['q']) > 3) {
			if(!empty($_GET['tipo'])) $smarty->assign('tsQuery',$tsCom->getQueryTipo($_GET['tipo']));
			else $smarty->assign('tsQuery',$tsCom->getQuery());
		}
	} elseif($action == 'dir') {
		// Nuevo titulo
		$tsTitle = 'Directorio de Comunidades - '.$tsCore->settings['titulo'];
    	$smarty->assign('tsDir',$tsCom->getDirectorio());
		$smarty->assign('tsPaises',$tsCom->getDirPaises());		 
	} elseif($action == 'mis-comunidades') {
		// Nuevo titulo
		$tsTitle = 'Mis comunidades - '.$tsCore->settings['titulo'];
		$smarty->assign('tsMisComus',$tsCom->getMisComunidades());
	} elseif($action == 'mod-history') {
		// Nuevo titulo
		$tsTitle = 'Historial de moderaci&oacute;n - '.$tsCore->settings['titulo'];
		$smarty->assign('tsHistorial',$tsCom->getHistorial());
	} elseif($action == 'favoritos') {
		if($tsUser->is_member) {
			// Nuevo titulo
			$tsTitle = 'Mis temas favoritos - '.$tsCore->settings['titulo'];
			$smarty->assign('tsFavoritos',$tsCom->getFavoritos());
		} else $tsError = 'Solo los usuarios registrados pueden acceder.';
	} elseif($action == 'borradores') {
		if($tsUser->is_member) {
			// Nuevo titulo
			$tsTitle = 'Borradores - '.$tsCore->settings['titulo'];
			$smarty->assign('tsBorradores',$tsCom->getBorradores());
		} else $tsError = 'Solo los usuarios registrados pueden acceder.';
	} else {
		$get_com = $tsCom->get_comunidad($action);
		$smarty->assign("tsCom",$get_com['com']);
		if(is_array($get_com)) {
			if($act == 'editar') {
				if(isset($_POST['nombre'])) {
					$edit_com = $tsCom->editar_comunidad($get_com['com']['c_id']);
					if($edit_com > 0) {
						$tsCore->redirectTo("{$tsCore->settings['url']}/comunidades/".$action."/?edit=ok");
					} else $tsError = $edit_com;
				} else {
					$datos = $tsCom->datosCom($get_com['com']['c_id']);
					if(is_array($datos)) {
						$smarty->assign("tsDato",$datos);
						// CATEGORIAS
						$smarty->assign('tsCats',$tsCom->getCats());
						// SUBCATEGORIAS
						$sub = $tsCom->getSubcats($datos['c_categoria']);
						$smarty->assign('tsSubcats',$sub);
						// PAISES
						include('../ext/datos.php');
						$smarty->assign("tsPaises",$tsPaises);
						// AHORA LA ACCION ES "EDITAR"			
						$action = 'editar';
					} else $tsError = $datos;
				}
			} elseif($act == 'agregar') {
				$nombre = $action;
				$action = 'agregar';
				if(!$tsCom->es_miembro($get_com['com']['c_id'])) {$tsError = 'Tienes que ser miembro para realizar esta operaci&oacute;n.';};
				if(!$tsCom->verify_permisos($get_com['com']['c_id'])) {$tsError = 'Tu rango no te permite realizar esta operaci&oacute;n.';};
				if(isset($_GET['bid'])) {
					$bid = $tsCore->setSecure($_GET['bid']);
					$datos = $tsCom->datosBorrador($get_com['com']['c_id'], $bid);
					$smarty->assign("tsTema",$datos);
				} else {
					if(isset($_POST['titulo'])) {
						$new_tema = $tsCom->nuevo_tema($get_com['com']['c_id']);
						if($new_tema > 0) {
							$tsPage = 'aviso';
							$smarty->assign("tsAviso",array('titulo' => 'Exito', 'mensaje' => 'El tema <strong>'.$_POST['titulo'].'</strong> ha sido creado con &eacute;xito', 'but' => 'Ir al tema', 'link' => "{$tsCore->settings['url']}/comunidades/".$nombre."/".$new_tema."/".$tsCore->setSeo($_POST['titulo']).".html"));
						} else $tsError = $new_tema;
					}
				}
			} elseif($act == 'tema') {
				$action = 'tema';
				$tema = $tsCom->getTema();
				if(is_array($tema)) {
					// Nuevo titulo
					$tsTitle = $tema['tema']['t_titulo'].' - '.$tsCore->settings['titulo'];
					$smarty->assign("tsTema",$tema['tema']);
					$smarty->assign("tsAutor",$tema['autor']);
					$smarty->assign("tsRespuestas",$tsCom->getRespuestas());
					$smarty->assign("tsLastRespuestas",$get_com['respuestas']);
				} else $tsError = $tema;
			}elseif($act == 'editar-tema') {
				$temaid = $tsCore->setSecure($_GET['temaid']);
				if(isset($_POST['titulo'])) {
					$edit_tema = $tsCom->editar_tema($get_com['com']['c_id'], $temaid);
					if($edit_tema) {
						$tsCore->redirectTo("{$tsCore->settings['url']}/comunidades/".$action."/".$_POST['temaid']."/".$tsCore->setSeo($_POST['titulo']).".html");
					} else $tsError = $edit_tema;
				} else {
					$datos = $tsCom->datosTema($get_com['com']['c_id'], $temaid);
					$smarty->assign("tsTema",$datos);		
					$action = 'editar-tema';
				}
			} elseif($act == 'miembros') {
				$action = 'miembros';
				$smarty->assign("tsMiembros",$tsCom->getMiembros($get_com['com']['c_id']));
				$smarty->assign("tsUltimos",$get_com['miembros']);
			} elseif($act == 'mod-history') {
				$action = 'com-mod-history';
				$smarty->assign("tsModHistory",$tsCom->getComModHistory($get_com['com']['c_id']));
			} else {
				// Nuevo titulo
				$tsTitle = $get_com['com']['c_nombre'].' - '.$tsCore->settings['titulo'];
				$smarty->assign("tsTemas",$get_com['temas']);
				$smarty->assign("tsRespuestas",$get_com['respuestas']);
				$smarty->assign("tsMiembros",$get_com['miembros']);
				$smarty->assign("tsStaff",$get_com['staff']);
				$smarty->assign("tsTop",$get_com['top']);
			}
		} else $tsError = $get_com;
	}
	// HAY ERROR?
	if(!empty($tsError)) {
		$tsPage = 'aviso';
		$smarty->assign("tsAviso",array('titulo' => 'Error', 'mensaje' => $tsError, 'but' => 'Volver', 'link' => "javascript:history.back();"));	
	}
		
/**********************************\

* (AGREGAR DATOS GENERADOS | SMARTY) *

\*********************************/

	$smarty->assign("tsAction",$action); 
	$smarty->assign("tsAct",$act);
}

if(empty($tsAjax)) {	// SI LA PETICION SE HIZO POR AJAX DETENER EL SCRIPT Y NO MOSTRAR PLANTILLA, SI NO ENTONCES MOSTRARLA.

	$smarty->assign("tsTitle",$tsTitle);	// AGREGAR EL TITULO DE LA PAGINA ACTUAL

	/*++++++++ = ++++++++*/
	include("../../footer.php");
	/*++++++++ = ++++++++*/
}