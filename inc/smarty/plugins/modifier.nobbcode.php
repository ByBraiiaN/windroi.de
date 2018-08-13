<?php
/**
 * Smarty plugin
 * @package Smarty
 * @subpackage plugins
 */


/**
 * Smarty NOBBCODE modifier plugin
 *
 * Type:     modifier
 * Name:     nobbcode
 * Date:     August 29, 2017
 * Purpose:  Delete BBCODES from String
 * Input:    BBcode STRING
 * Example:  {$var|nobbcode}
 * @link http://mrdioamdev.blogspot.com
 * @author  MrDioamDev
 * @version 1.0
 * @param string
 * @param string
 * @return string
 */
function smarty_modifier_nobbcode($string){
$string = preg_replace('/\[([^\]]*)\]/', '', $string);
	return $string;
}
?>
