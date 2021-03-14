[#-- Renders a video with an HTML5 tag or by embedding a video service code--]
[#macro video content]
    [#if content.type?has_content]
        [#assign videoCaption = content.videoCaption!]
        [#assign videoCredit = content.videoCredit!]

        [#if content.scale?boolean]
            [#assign scaleClass = "scalable-video"]
        [#else]
            [#assign scaleClass = "non-scalable-video"]
        [/#if]

        [#if content.type == "asset"]
            [#assign video = damfn.getAsset(content.assetsource)]

            [#assign videoTitle = ""]
            [#if video.title?has_content]
                [#assign videoTitle = video.title]
            [/#if]

            [#assign assetType = video.mimeType]
            [#assign videoSrc = video.link]

            [#-- Video caption / credit; Falls back to asset's properties --]
            [#if !videoCaption?has_content]
                [#assign videoCaption =video.caption!videoTitle!]
            [/#if]

            [#if !videoCredit?has_content]
                [#assign videoCredit = video.copyright!]
            [/#if]

            [#if content.assetposter?has_content]
                [#assign assetPoster = damfn.getAsset(content.assetposter)!]
                [#if assetPoster?has_content]
                    [#assign poster = 'poster="${assetPoster.link}"']
                [/#if]
            [/#if]

            [#if content.assetpreload?has_content]
                [#assign preload = 'preload="${content.assetpreload}"']
            [/#if]
        [/#if]

        [#-------------- RENDERING  --------------]
        <div class="${scaleClass}">
            <div class="video-wrapper">
                [#if content.type == "asset"]
                    <video ${content.assetautoplay?string("autoplay","")} ${content.assetloop?string("loop","")} ${content.assetmuted?string("muted","")} ${content.assetcontrols?string("controls","")} ${preload!} ${poster!}>
                        <source src="${videoSrc}" type="${assetType}">
                    </video>
                [#else]
                    ${cmsfn.decode(content).embed}
                [/#if]
            </div>

            [#if videoCaption?has_content || videoCredit?has_content]
                <div class="video-captions">
                    [#if videoCaption?has_content]
                        <span class="video-caption">${videoCaption}</span>
                    [/#if]
                    [#if videoCredit?has_content]
                        <span class="video-credit">${videoCredit}</span>
                    [/#if]
                </div>
            [/#if]
        </div>
    [/#if]
[/#macro]
