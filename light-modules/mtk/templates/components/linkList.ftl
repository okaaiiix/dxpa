[#-------------- ASSIGNMENTS --------------]
[#include "/mtk/templates/includes/init.ftl"]

[#-- List style, default is UL --]
[#assign listStyle = "ul"]
[#if content.listStyle?has_content]
    [#if content.listStyle == "ordered"]
        [#assign listStyle = "ol"]
    [/#if]
    [#if content.listStyle == "inline" && !cmsfn.editMode]
        [#assign divClass = "${divClass} inline"]
    [/#if]
[/#if]

[#-------------- RENDERING  --------------]
<div class="${divClass}"${divID}>
    [#if content.subtitle?has_content]
        <${headlineLevel}>${content.subtitle}</${headlineLevel}>
    [/#if]

    [@cms.area name="linkList" contextAttributes={"listStyle":listStyle} /]
</div><!-- end ${divClass} -->
