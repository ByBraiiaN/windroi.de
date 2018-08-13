<?php
include ("../../header.php");
	/* CONFIGURACION DE LA WEB */
	$config = $tsCore->settings; 
	$get = $tsCore->setSecure($_GET['user']);
$user = (int)$tsUser->getUserId($get);
if(empty($user) && !empty($get))
        die('El usuario no existe');
		
	/* HACEMOS LA CONSULTA */
	if(empty($user))
	$sql = "SELECT * FROM p_posts LEFT JOIN p_categorias ON cid = post_category WHERE post_status = 0 ORDER BY post_id DESC LIMIT 15";
	else{
		$user_text = ' de '.$tsCore->setSecure($get);
	$sql = 'SELECT * FROM p_posts LEFT JOIN p_categorias ON cid = post_category WHERE post_status = 0 && post_user = \''.(int)$user.'\' ORDER BY post_id DESC LIMIT 15';
	}
	$query = db_exec(array(__FILE__, __LINE__), 'query', $sql);

	/*++++++++++++++++++++++++++++++++++ */
	function size_text($string,$length=80){
		$total = strlen($string);
		if($total > $length){
			return substr($string, 0, $length)."...";
		}
		else{
			return $string;
		}
	}
header("Content-Type: application/rss+xml; charset=UTF-8"); 
echo'<?xml version="1.0" encoding="UTF-8"?>';
?>
<rss version="2.0" xmlns:content="https://purl.org/rss/1.0/modules/content/" xmlns:wfw="http://wellformedweb.org/CommentAPI/" xmlns:dc="https://purl.org/dc/elements/1.1/">
	<channel>
		<title><?php echo $config['titulo'];?> - Ultimos posts<?=$user_text?></title>
		<description>Ultimos posts de <?php echo $config['titulo'];?></description>
		<image>
			<title><?php echo $config['titulo'];?></title>
			<link><?php echo $config['url'];?>/</link>

			<url>not found</url>
		</image>
		<generator><?php echo $config['url'];?>/</generator>
		<language>es</language>
		<link><?php echo $config['url'];?>/</link>
<?php while($rss = db_exec('fetch_array', $query)){ ?>
		<item>
			<title><?php echo $rss['post_title'];?></title>
			<link><?php echo $config['url'];?>/posts/<?php echo $rss['c_seo'];?>/<?php echo $rss['post_id'];?>/<?php echo $tsCore->setSEO($rss['post_title']);?>.html</link>
			<pubDate><?php echo strftime("%a, %d %b %Y %H:%M:%S",$rss['post_date']);?> -0300</pubDate>
			<category><![CDATA[<?php echo $rss['c_seo'];?>]]></category>
			<comments><?php echo $config['url'];?>/posts/<?php echo $rss['c_seo'];?>/<?php echo $rss['post_id'];?>/<?php echo $tsCore->setSEO($rss['post_title']);?>.html#comentarios-abajo</comments>
			<description><![CDATA[<?php echo size_text($tsCore->parseBBCode($rss['post_body']),'650');?><p><strong><a href='<?php echo $config['url'];?>/posts/<?php echo $rss['c_seo'];?>/<?php echo $rss['post_id'];?>/<?php echo $tsCore->setSEO($rss['post_title']);?>.html'>Seguir leyendo... >></a></strong></p>]]></description>
		</item>
<?php } ?></channel></rss>