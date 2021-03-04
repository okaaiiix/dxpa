[#assign pageDef=ctx.pageDef!]
<title>${content.windowTitle!content.title!}</title>

<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="${content.description!""}">
<meta name="keywords" content="${content.keywords!""}">

[#if content.noCache!false]
<meta content="no-cache" http-equiv="cache-control" />
[/#if]

[#-- cssFiles from the page definition --]
[#list pageDef.cssFiles as cssFile]
    [#assign media = ""]
    [#if cssFile.media?has_content]
        [#assign media = ' media="${cssFile.media}"']
    [/#if]
    [#if cssFile.conditionalComment?has_content]
    <!--[if ${cssFile.conditionalComment}]>
    [/#if]
<link rel="stylesheet" type="text/css" href="${cssFile.link}"${media}>
    [#if cssFile.conditionalComment?has_content]
    <![endif]-->
    [/#if]
[/#list]
[#-- jsFiles from the page definition --]
[#list pageDef.jsFiles as jsFile]
<script src="${jsFile.link}"></script>
[/#list]
