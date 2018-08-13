{include file='sections/main_header.tpl'}
	{if $tsAction == ''}
		{include file='modules/monitor/m.monitor_content.tpl'}
		{include file='modules/monitor/m.monitor_sidebar.tpl'}
	{else}
		{include file='modules/monitor/m.monitor_menu.tpl'}
		{include file='modules/monitor/m.monitor_listado.tpl'}
	{/if}
{include file='sections/main_footer.tpl'}