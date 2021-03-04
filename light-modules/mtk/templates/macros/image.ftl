[#-- Renders an image (asset) rendition --]
[#macro image image content imageClass="content-image" useOriginal=false definitionParameters={} alwaysWrap=false]
    [#if image?has_content]
        [#-- Fallback text for alt text --]
        [#assign assetTitle = ""]
        [#if image.asset?? && image.asset.title?has_content]
            [#assign assetTitle = image.asset.title]
        [/#if]

        [#-- Alt text and title --]
        [#assign imageAlt = content.imageAltText!assetTitle]
        [#assign imageTitle = content.imageTitle!""]

        [#assign imageLink = image.link]
        [#-- For PNGs/GIFs it might be useful to use render the original asset and therefore bypassing imaging --]
        [#if useOriginal]
            [#assign imageLink = image.asset.link]
        [/#if]

        [#-- Image caption / credit; Falls back to asset's properties --]
        [#assign imageCaption = content.imageCaption!image.asset.caption!""]
        [#assign dc = damfn.getAssetMap(image.asset).metadata.dc!]
        [#assign imageCredit = content.imageCredit!dc.contributor?first!""]

        [#-- CSS --]
        [#-- Image class is used from def.parameters, otherwise falls back to given parameter --]
        [#assign divWrapperClass = definitionParameters.imageWrapperClass!"content-image-wrapper"]
        [#assign imgClass = imageClass][#-- Using another variable here as the macro parameter cannot be re-assinged --]
        [#if definitionParameters.imageClass?has_content]
            [#-- Adding custom parameters as img class when specified --]
            [#assign imgClass = "${imgClass} ${definitionParameters.imageClass}"]
        [/#if]

        [#-------------- RENDERING  --------------]
        [#-- Using a wrapper to be able to position caption+credit nicely --]
        [#assign wrapImage = imageCaption?has_content || imageCredit?has_content || alwaysWrap]

        [#if wrapImage]
            <!-- image with caption/credit --><div class="${divWrapperClass}">
        [/#if]

        <img src="${imageLink}" alt="${imageAlt}" title="${imageTitle}" class="${imgClass}" style="max-width: 100%" />

        [#if wrapImage]
            [#if imageCaption?has_content]
                <span class="image-caption">${imageCaption}</span>
            [/#if]
            [#if imageCredit?has_content]
                <span class="image-credit">${imageCredit}</span>
            [/#if]
            </div><!-- end image with caption/credit -->
        [/#if]
    [/#if]
[/#macro]
