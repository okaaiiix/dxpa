[#-- Shared setup for all components. --]
[#assign divIDPrefix = def.parameters.divIDPrefix!""]
[#assign divClass = def.parameters.divClass!""]

[#assign divID = ""]

[#if divIDPrefix?has_content]
    [#assign divID = ' id="${divIDPrefix}-${content.@id}"']
[/#if]

[#assign headlineLevels = {"big":"h2", "medium":"h3", "small":"h4"}]
[#assign headlineLevel = headlineLevels[content.headlineLevel!"small"]]

[#if def.parameters.headlineLevel?has_content]
    [#assign headlineLevel = def.parameters.headlineLevel]
[/#if]
