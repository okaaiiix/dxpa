[#assign assetId = content.linkTypedownload!]

[#if assetId?has_content]

    [#assign asset = damfn.getAsset(assetId)!]

    [#if asset?has_content]
        [#assign link = asset.link]
        [#assign extension = cmsfn.fileExtension(asset.fileName)]
        [#if !title?has_content]
            [#-- This is a workaround for the fact that JcrAsset will return an empty string when finding an
            empty property --]
            [#if asset.title?has_content]
                [#assign title = asset.title!]
            [#else]
                [#assign title = asset.fileName!]
            [/#if]
        [/#if]
        [#assign title = "${title!} <em>(${extension?upper_case}, ${cmsfn.readableFileSize(asset.fileSize)})</em>"]
        [#assign linkTarget = " target=\"_blank\""]
    [#else]
        [#assign resolveError = true]
    [/#if]

[#else]
    [#assign resolveError = true]
[/#if]
