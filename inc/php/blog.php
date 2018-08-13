<?php 
	$tsPage = "blog";	// tsPage.tpl -> PLANTILLA PARA MOSTRAR CON ESTE ARCHIVO.
	$tsLevel = 0;		// NIVEL DE ACCESO A ESTA PAGINA. => VER FAQs
	$tsAjax = empty($_GET['ajax']) ? 0 : 1; // LA RESPUESTA SERA AJAX?	
	$tsContinue = true;	// CONTINUAR EL SCRIPT
	
	include "../../header.php"; // INCLUIR EL HEADER
	$tsTitle = $tsCore->settings['titulo'].' | Comunidad sobre Tecnología e Informática '; 	// TITULO DE LA PAGINA ACTUAL

	// VERIFICAMOS EL NIVEL DE ACCSESO ANTES CONFIGURADO
	$tsLevelMsg = $tsCore->setLevel($tsLevel, true);
	if($tsLevelMsg != 1){	
		$tsPage = 'aviso';
		$tsAjax = 0;
		$smarty->assign("tsAviso",$tsLevelMsg);
		$tsContinue = false;
	}

	if($tsContinue){
	include("../class/c.blog.php");
	@$tsBlog =& tsBlog::getInstance();

    switch($action){
        case '':
            $smarty->assign("tsPostsBlog",$tsBlog->act_postsblog());
			$smarty->assign("tsComBlog",$tsBlog->act_comblog());
			$smarty->assign("tsCPostsBlog",$tsBlog->act_cpostblog());
			$smarty->assign("tsCComBlog",$tsBlog->act_comentblog());
        break;
    }

    $smarty->assign("tsAction",$action);	
}

if(empty($tsAjax)) {	// SI LA PETICION SE HIZO POR AJAX DETENER EL SCRIPT Y NO MOSTRAR PLANTILLA, SI NO ENTONCES MOSTRARLA.
	$smarty->assign("tsTitle",$tsTitle);	// AGREGAR EL TITULO DE LA PAGINA ACTUAL
	/*++++++++ = ++++++++*/
	include("../../footer.php");
	/*++++++++ = ++++++++*/
}