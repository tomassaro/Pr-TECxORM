{* Smarty *}
{* debug.tpl, firebug version by Hipska, tweaked by GarrickCheung *}


<script type="text/javascript">
// <![CDATA[
var Smarty_debug = function Smarty_debug(collapsed){literal}{{/literal}

        var group = (collapsed) ? console.groupCollapsed : console.group;

        group("Smarty Debug");

        {if !empty($template_data)}
        group("Included templates & config files");
        {foreach $template_data as $template}       
        console.log("{$template.name}: (compile {$template['compile_time']|string_format:"%.5f"}) (render {$template['render_time']|string_format:"%.5f"}) (cache {$template['cache_time']|string_format:"%.5f"})");
        {/foreach}
        console.groupEnd();
        {/if}

        group("Assigned template variables");
        {foreach $assigned_vars as $vars}
          console.log("${$vars@key|escape:'html'}:", {$vars|@json_encode});
        {/foreach}
        console.groupEnd();

        group("Assigned config file variables (outer template scope)");
        {foreach $config_vars as $vars}
          console.log("{$vars@key|escape:'html'}:", {$vars|@json_encode});
        {/foreach}
        console.groupEnd();


        console.groupEnd();
        return "Smarty version {$smarty.version}";

{literal}};{/literal}
// ]]>
</script>