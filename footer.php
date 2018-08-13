<?php if ( ! defined('TS_HEADER')) exit('No se permite el acceso directo al script');
/**
 * El footer permite mostrar la plantilla
 *
 * @name    footer.php
 * @author  PHPost Team
 */

/*
 * -------------------------------------------------------------------
 *  Realizamos tareas para mostrar la plantilla
 * -------------------------------------------------------------------
 */
function CompressDressli($buf){
	    $basura = array("/<!--(.*)-->/Uis","/[[:blank:]]+/","/\>[^\S ]+/s","/[^\S ]+\</s");
		$quitar = array('',' ','>','<');
	    $buf = preg_replace($basura,$quitar,$buf);
        return $buf;
    } 
    ob_start("CompressDressli");
    // Pagina solicitada
    $smarty->assign("tsPage",$tsPage);

    // 
    $smarty_next = false;
    
    // Verificamos si la plantilla existe 
    // Si no existe mostramos la que esta en default
    if(!$smarty->templateExists("t.$tsPage.tpl")){
    	$smarty->setTemplateDir(TS_ROOT.DIRECTORY_SEPARATOR.'themes'.DIRECTORY_SEPARATOR.'default'.DIRECTORY_SEPARATOR.'templates');
    	if($smarty->templateExists("t.$tsPage.tpl")) $smarty_next = true;
    } else $smarty_next = true;
    
    // Mostramos la plantilla
    if($smarty_next == true) $smarty->display("t.$tsPage.tpl");
    else die("0: Lo sentimos, se produjo un error al cargar la plantilla 't.$tsPage.tpl'. Contacte al administrador");
ob_end_flush();
