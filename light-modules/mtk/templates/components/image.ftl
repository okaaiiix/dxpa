[#-------------- ASSIGNMENTS --------------]
[#include "/mtk/templates/includes/init.ftl"]

[#if !divClass?has_content]
    [#assign divClass = "image-section"]
[/#if]

[#assign imageClass = "content-image"]
[#if def.parameters.imgClass?has_content]
    [#assign imageClass = def.parameters.imgClass]
[/#if]

[#if content.image?has_content]
    [#assign rendition = damfn.getRendition(content.image, "original")]
    [#include "/mtk/templates/macros/image.ftl"]
[/#if]


[#-------------- RENDERING  --------------]
[#--If no image is selected - nothing will be rendered--]
[#if content.image?has_content]
    [#compress]
    <!-- ${divClass} -->
    <div class="${divClass!}"${divID!}>
        [@image rendition content imageClass false def.parameters /]
    </div>
    <!-- end ${divClass} -->
    [/#compress]
[#else]
    [#if cmsfn.isEditMode()]
        <p>${i18n["templates.components.image.isEmpty.notification"]}</p>
    [/#if]
[/#if]
