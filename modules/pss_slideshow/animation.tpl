<!-- Block anim module -->
{if $slides|@count>0 && $activated}
<script type="text/javascript">
 $(document).ready(function() {ldelim}
	$('#prestascope_slide_show_container').width({$conf_width});
	$('#prestascope_slide_show_container').height({$conf_height});
	$('#prestascope_slide_show_container').crossSlide({ldelim}
	  sleep: {$conf_sleep},
	  fade: {$conf_fade}
	{rdelim}, [
		{foreach from=$slides item=slide name=slides}
			// avoid to add a comma to the last item in list : IE doesn't like it !
			{ldelim} src: '{$slide.image_name}' {if $slide.href|strlen>0}, href: '{$slide.href}'{/if} {rdelim} {if !$smarty.foreach.slides.last},{/if}
		{/foreach}
	]);
 {rdelim});	
</script>
<div id="prestascope_slide_show_container">
	<!-- First image is displayed by default for low bandwidth browsers -->
	<img src="{$slides[0].image_name}" width="{$conf_width}" height="{$conf_height}">
</div>
{/if}
<!-- /Block anim module -->
