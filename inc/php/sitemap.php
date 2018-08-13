<?php
include ("../../header.php");
	/* CONFIGURACION DE LA WEB */
	$config = $tsCore->settings; 

	/* HACEMOS LA CONSULTA */
	$sql = "SELECT * FROM p_posts LEFT JOIN p_categorias ON cid = post_category WHERE post_status = 0 ORDER BY post_id DESC LIMIT 50";
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
header("Content-Type: text/xml"); 
echo'<?xml version="1.0" encoding="UTF-8"?>';
?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">

<?php while($rss = db_exec('fetch_array', $query)){ ?>
<url>       <loc><?php echo $config['url'];?>/posts/<?php echo $rss['c_seo'];?>/<?php echo $rss['post_id'];?>/<?php echo $tsCore->setSEO($rss['post_title']);?>.html</loc>      <changefreq>daily</changefreq>       <priority>0.8</priority>    </url>

<?php } ?>

</urlset>