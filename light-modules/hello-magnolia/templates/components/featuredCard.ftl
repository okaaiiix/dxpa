[#-------------- ASSIGNMENTS --------------]
[#assign targetNode = cmsfn.contentById(content.link)!]

[#assign link = cmsfn.link(targetNode)!]
[#assign title = content.title!targetNode.title!]
[#assign imageItemKey = content.image!targetNode.image!]
[#assign abstract = content.abstract!targetNode.abstract!]

[#assign hasImage = false]
[#if imageItemKey?has_content]
	[#assign asset = damfn.getAsset(imageItemKey)!]
	[#if asset?has_content]
		[#assign image = damfn.getRendition(imageItemKey, def.parameters.imageVariation!"original")]
		[#if image?has_content]
			[#assign hasImage = true]
			[#assign imageAltText = asset.title!]
		[/#if]
	[/#if]
[/#if] 

[#-------------- RENDERING  --------------]
<div class="featured-card">
[#if hasImage]
    <a href="${link}">
		<img class="featured-card__image" src="${image.link!}"[#if imageAltText?has_content] alt="${imageAltText!}"[/#if]>
	</a>
[/#if]
	<h4 class="featured-card__title">${title}</h4>
[#if abstract?has_content]
	<p class="featured-card__abstract">${abstract}</p>
<#--  [/#if]  -->
	[#--<a href="${link}" class="btn btn-primary">${i18n.get("templates.components.featuredCard.readmore.buttonLabel")}</a>--]
</div>