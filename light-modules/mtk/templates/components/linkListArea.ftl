[#-------------- ASSIGNMENTS --------------]
[#assign listStyle = ctx.listStyle!"ul"]

[#-------------- RENDERING  --------------]
<${listStyle}>
    [#list components as component ]
        <li>[@cms.component content=component /]</li>
    [/#list]
    [#if cmsfn.editMode]
        <li cms:add="bar"></li>
    [/#if]
</${listStyle}>
