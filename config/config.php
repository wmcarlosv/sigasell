<?php

 //path

 require_once('path.php');

 /*
 |--------------------------------------------------------------------------
 | debug status / session timeout
 |--------------------------------------------------------------------------
 |
 | If you are developer and want to change status of ini to show errors
 | change debug to true, For stop showing errors just change it to false.
 |
 | Set up session timeout in seconds
 */

 define('debug',false);
 define('SESSION_TIME','3600');

 /*
 |--------------------------------------------------------------------------
 | Date Form
 |--------------------------------------------------------------------------
 |
 | Define time to hundle all time calls.
 | You can change time zone to your prefrred location by changing TimeZone.
 | You can change date time format by changing Format.
 |
 */

 define('TimeZone', 'UTC');
 define('Format', "d M Y");
 define('Now',time());
 define('Year',date("Y"));

 $dateTime = new DateTime('now', new DateTimeZone(TimeZone));
 $dateForm = $dateTime->format(Format);
 $current_month = date("m/y");
 $current_day = date("d/m/y");
 
 /*
 |--------------------------------------------------------------------------
 | Files 
 |--------------------------------------------------------------------------
 |
 | Define file name.
 | Define folder access by visit.
 | Define installtion file.
 |
 */

 define('FILE',basename(basename($_SERVER['SCRIPT_FILENAME'])));
 define('ACCESS',$_SERVER['REQUEST_URI']);
 define('INSTALL_FILE',DS.'installer'.DS.'index');
 define('LICENSE_FILE',DS.'installer'.DS.'license');
 define('DATABASE_FILE',DS.'installer'.DS.'database');
 define('BUILD_FILE',DS.'installer'.DS.'build');
 define('ADMIN_FILE',DS.'installer'.DS.'admin');

 /*
 |--------------------------------------------------------------------------
 | Load Files
 |--------------------------------------------------------------------------
 |
 | Load app info
 | Load Smarty
 | Load sessions
 | Load ini files
 | Load Mailer files
 |
 */
 
 require_once (INI.'Ini_set.php');
 require_once (MODELS.'sessionModel.php');
 require_once (CONFIG.'app.php');
 require_once (CONFIG.'urls.php');
 require_once (MODELS.'dataModel.php');
 require_once (SMARTY.'Smarty.class.php');
 require_once (INI.'Errors.php');
 require_once (MAILER.'PHPMailer.php');
 require_once (MAILER.'POP3.php');
 require_once (MAILER.'OAuth.php');
 require_once (MAILER.'SMTP.php');
 require_once (MAILER.'CONFIG.php');

 /*
 |--------------------------------------------------------------------------
 | Smarty
 |--------------------------------------------------------------------------
 |
 | Smarty is what we need to load our templates & make it esier for designers
 | debugging is false ,You can change it to true for developing prupose only!
 | Caching is false , Change it to true with lifetime in secondes if you need it
 |
 */
 
 $smarty = new Smarty;
 $smarty->debugging = false;
 $smarty->caching = false;
 $smarty->cache_lifetime = 120;