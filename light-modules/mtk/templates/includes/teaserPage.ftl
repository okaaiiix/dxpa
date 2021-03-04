[#assign target = cmsfn.contentByReference(content, "linkTypepage", "website")!]

[#-- Ensure target node exists and it's not deleted --]
[#if target?has_content && !cmsfn.asJCRNode(target).hasProperty("mgnl:deleted")]

    [#assign link = cmsfn.link(target)!]

    [#if !title?has_content]
        [#assign title = target.title!target.name!]
    [/#if]

    [#if !abstract?has_content]
        [#assign abstract = target.abstract!]
    [/#if]

    [#if !link?has_content || !target?has_content]
        [#assign resolveError = true]
    [/#if]

    [#-- Try to locate the first image available in the target node. TODO consider writing a templating function for this --]
    [#function targetImage t]
        [#if t.image?has_content]
            [#return damfn.getRendition(t.image, "original")]
        [/#if]
        [#list cmsfn.children(t) as node]
            [#if node.@nodeType.name != "mgnl:page"]
                [#assign i = targetImage(node)!]
                [#if i?has_content]
                    [#return i]
                [/#if]
            [/#if]
        [/#list]
        [#-- We should be returning null but freemarker doesn't support this.
        Please make sure to test whether image has content! --]
        [#return ""]
    [/#function]

    [#-- If no overriding image has been defined, try to get the image in the target. --]
    [#if !hideTeaserImage && !image?has_content]
        [#assign image = targetImage(target)!]
    [/#if]

[#else]
    [#assign resolveError = true]
[/#if]
