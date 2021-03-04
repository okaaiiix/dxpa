[#-------------- ASSIGNMENTS --------------]
[#assign headingElement = def.parameters.headingElement!"h2"]
[#assign title = content.title!]

[#-------------- RENDERING  --------------]
<div class="featured-cards">
[#if title?has_content]
    <h2 class="featured-cards__title">${title}</h2>
[/#if]
    <div class="featured-cards__grid">
	[@cms.area name="cards" /]
    </div>
</div>