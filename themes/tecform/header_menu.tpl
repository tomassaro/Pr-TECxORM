<div id="header_nav">
                <span>
                    <a href="{$base_dir}/" class="head"> {l s='Home'}</a>
                </span>


            {foreach from=$blockCategTree.children item=node name=blockCategTree}
                <span>
                    <a href="{$node.link}" class="{if isset($currentCategoryId) && ($node.id == $currentCategoryId)}selected{/if} head" title="{$node.desc|escape:html:'UTF-8'}">{$node.name|escape:html:'UTF-8'}</a>
                </span>
            {/foreach}


    <div id="header_actions">
        <span id="header_login">
           <a href="/" class="head"> {l s='Login'}</a>
        </span>
        <span id="header_chart">
            <a href="/" class="head"> &nbsp;</a> 
        </span>
    </div>
</div>