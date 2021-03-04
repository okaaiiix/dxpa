[#-------------- ASSIGNMENTS --------------]
[#include "/mtk/templates/includes/init.ftl"]

[#assign pageContent = cmsfn.page(content)]

[#-- CSS default --]
[#if !divClass?has_content]
    [#assign divClass = "page-intro"]
[/#if]


[#-------------- RENDERING --------------]
<div class="${divClass}">

[#if pageContent?has_content]
    [#if pageContent.title?has_content]
        <${headlineLevel}>${pageContent.title}</${headlineLevel}>
    [/#if]
    [#if pageContent.abstract?has_content]
        <p>${pageContent.abstract}</p>
    [/#if]
[/#if]

</div><!-- end ${divClass} -->
