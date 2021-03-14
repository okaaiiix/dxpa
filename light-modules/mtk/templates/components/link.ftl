[#-------------- ASSIGNMENTS --------------]
[#include "/mtk/templates/includes/init.ftl"]

[#assign title = content.title!]
[#assign linkType = content.linkType!]
[#assign resolveError = false]
[#assign linkTarget = ""]

[#if linkType?has_content]
    [#assign divClass = "${linkType} ${divClass}"]
[/#if]


[#-------------- ASSIGNMENTS FOR EACH TYPE --------------]
[#if linkType=="page"]
    [#include "/mtk/templates/includes/linkPage.ftl"]
[#elseif linkType=="external"]
    [#include "/mtk/templates/includes/linkExternal.ftl"]
[#elseif linkType=="download"]
    [#include "/mtk/templates/includes/linkDownload.ftl"]
[/#if]

[#if resolveError && cmsfn.editMode]
    [#assign divClass = "${divClass} note-for-editor"]
[/#if]


[#-------------- RENDERING --------------]
[#if cmsfn.editMode && resolveError]

    <span class="${divClass!}"${divID}>${i18n["reference.resolveError"]}</span>

[#else]

    <span class="${divClass!}"${divID}><a href="${link}"${linkTarget!}>${title}</a></span>

[/#if]
