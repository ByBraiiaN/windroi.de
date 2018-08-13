<?php
/**
 * Smarty plugin
 * @package Smarty
 * @subpackage plugins
 */


/**
 * Smarty cat modifier plugin
 *
 * Type:     modifier
 * Name:     seo
 * Date:     Oct 14, 2010
 * Purpose:  catenate a value to a variable
 * Input:    string to catenate
 * Example:  {$var|seo}
 * @link http://smarty.php.net/manual/en/language.modifier.cat.php cat
 *          (Smarty online manual)
 * @author   Ivan Molina Pavana
 * @version 1.0
 * @param string
 * @param string
 * @return string
 */
function smarty_modifier_seo($string){
	// Convertimos caracteres hispanos a inglés
$string = htmlentities($string, ENT_QUOTES, 'UTF-8');   
$string = preg_replace("/&([a-zA-Z])(acute|tilde|grave|circ|uml);/", '$1', $string);
// Conservamos sólo los caracteres alfanuméricos y espacios
$string = html_entity_decode($string);
$string = preg_replace('~[^a-zA-Z0-9\s]++~i', '$1', $string);
// Removemos texto sobrante de HTML jubilado
$string = str_replace(array('039', 'amp'), '', $string);
// Removemos los posibles espacios iniciales/finales
$string = trim($string);
	$string = preg_replace("/[ \t\n\r]+/", "-", $string);
	$string = str_replace(" ", "-", $string);
	$string = preg_replace("/[ -]+/", "-", $string);
	//
	return $string;
}

/* vim: set expandtab: */

?>
