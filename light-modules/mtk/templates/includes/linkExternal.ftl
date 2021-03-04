[#assign link = cmsfn.externalLink(content, "linkTypeexternal")!]
[#if !title?has_content]
    [#assign title = content.linkTypeexternal!]
[/#if]

[#if !link?starts_with("#")]
    [#assign linkTarget = " target=\"_blank\""]
[/#if]

[#if !link?has_content]
    [#assign resolveError = true]
[/#if]
