<div id="preview_tema">
	{$tsPreview.cuerpo}
</div>
{literal}
<script type="text/javascript">
$(window).bind(
	'resize',
	function(){
		$('#preview_tema').height((document.documentElement.clientHeight - 250) + 'px');
		mydialog.center();
	}
);
$(window).trigger('resize');
</script>
{/literal}