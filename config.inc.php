<?php if ( ! defined('TS_HEADER')) exit('No direct script access allowed'); 
/*
| -------------------------------------------------------------------
| AJUSTES DE BASE DE DATOS
| -------------------------------------------------------------------
| Esta variable contendr� los ajustes necesarios para acceder a su base de datos.
| -------------------------------------------------------------------
| EXPLICACI�N DE VARIABLES
| -------------------------------------------------------------------
|
|	['hostname'] The hostname of your database server.
|	['username'] The username used to connect to the database
|	['password'] The password used to connect to the database
|	['database'] The name of the database you want to connect to
*/
$db['hostname'] = 'localhost';
$db['username'] = '';
$db['password'] = '';
$db['database'] = '';


/*
 * -------------------------------------------------------------------
 *  Constantes
 * -------------------------------------------------------------------
 */
define('TSCookieName','PPCook');
define('RC_PUK',"           "); //public key recaptcha aqui
define('RC_PIK',"           "); //private key recaptcha aqui
    
/*
| -------------------------------------------------------------------
| AJUSTES DE MENSAJES EST�TICOS
| -------------------------------------------------------------------
| Esta variable contendr� los ajustes necesarios para mostrar un mensaje est�tico.
| -------------------------------------------------------------------
| EXPLICACI�N DE VALORES
| -------------------------------------------------------------------
|
|	['msgs'] = false <No mostrar� la p�gina est�tica>
|	['msgs'] = 1 <Mostrar� la p�gina est�tica con descripci�n breve para visitantes/usuarios y detalles para moderadores/administradores>
|	['msgs'] = 2 <Mostrar� la p�gina est�tica con detalles para todos>
*/
$display['msgs'] = 1;