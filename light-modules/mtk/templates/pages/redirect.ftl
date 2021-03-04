[@cms.page /]

[#assign status = content.redirectStatus!301]
[#assign location = '/']
[#assign urlType = content.redirectUrlType!]

[#if urlType?has_content]
    [#if urlType == 'internal' && content.redirectUrlTypeinternal?has_content]
        [#assign pageNode = cmsfn.contentById(content.redirectUrlTypeinternal)!]

        [#if pageNode?has_content]
            [#assign location = cmsfn.link(pageNode)!]
        [/#if]
    [#elseif urlType == 'external' && content.redirectUrlTypeexternal?has_content]
        [#assign location = content.redirectUrlTypeexternal]
    [/#if]
[/#if]

[#if cmsfn.editMode]
  <p>${i18n['templates.pages.redirect.editMode']}</p>
  <b>${status} ${location}</b>
[#else]
  [#if location?has_content]
    ${ctx.getResponse().setStatus(status?number)}
    ${ctx.getResponse().setHeader('Location', location)}
  [/#if]
[/#if]