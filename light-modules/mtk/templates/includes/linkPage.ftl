[#assign target = cmsfn.contentByReference(content, "linkTypepage", "website")!]

[#-- Ensure target node exists and it's not deleted --]
[#if target?has_content && !cmsfn.asJCRNode(target).hasProperty("mgnl:deleted")]

    [#assign link = cmsfn.link(target)!]

    [#if !title?has_content]
        [#assign title = target.title!target.name!]
    [/#if]

    [#if !link?has_content || !target?has_content]
        [#assign resolveError = true]
    [/#if]

[#else]
    [#assign resolveError = true]
[/#if]
