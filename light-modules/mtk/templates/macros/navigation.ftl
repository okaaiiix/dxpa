[#-- Basic navigation macro which generates simple navigation. You can adjust it to fulfil your needs. --]
[#macro navigation navParentItem depth=1 expandAll=false navClass="nav"]

    [#if navParentItem?has_content && depth > 0]
    <ul class="${navClass}">

        [#assign navItems = navfn.navItems(navParentItem)]
        [#list navItems as navItem]
            [#-- This is an example of how to resolve navigation from items in content apps. Uncomment and adjust to your needs.
            [#if navfn.hasTemplate(navItem, "mtk:pages/contactsOverview") || navfn.hasTemplateSubtype(navItem, "contactsOverview")]
                <li>
                    [#if navfn.isHiddenInNav(navItem)]
                        <a href="#">${navItem.navigationTitle!navItem.title!navItem.@name}</a>
                    [#else]
                        <a href="${cmsfn.link(navItem)!"#"}">${navItem.navigationTitle!navItem.title!navItem.@name}</a>
                    [/#if]
                    <ul>
                        [#assign navContentItems = navfn.navItemsFromApp("contacts", "/", "mgnl:contact")]
                        [#list navContentItems as navContentItem]
                            <li><a href="${navfn.linkWithSelector(navItem, navContentItem)!"#"}">${navContentItem.lastName!navContentItem.@name}</a></li>
                        [/#list]
                    </ul>
                </li>
            [#else]
            --]
                [#assign activeNavItem = navfn.isActive(content, navItem)] [#-- Active navigation item is the one which is same as current page--]
                [#assign openNavItem = navfn.isOpen(content, navItem)] [#-- Open navigation item is the one which is ancestor of current page--]
                [#if activeNavItem]
                    <li class="active">
                [#elseif openNavItem]
                    <li class="open">
                [#else]
                    <li>
                [/#if]
                        <a href="${navfn.link(navItem)!"#"}">${navItem.navigationTitle!navItem.title!navItem.@name}</a>
                        [#if expandAll || activeNavItem || openNavItem]
                            [@navigation navItem depth-1 /]
                        [/#if]
                    </li>
            [#-- End 'if' for navigation from the content apps]
            [/#if]
            --]
        [/#list]
    </ul>
    [/#if]
[/#macro]
