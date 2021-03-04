<div class="dropdown">
  [#if content.title?has_content]
    <h2>${content.title!}</h2>
  [/#if]

  [#if content.options?has_content]
  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
    <#list content.options as item>
      <a class="dropdown-item" href="#">${item}</a>
    </#list>
  </div>
  [/#if]
</div>
