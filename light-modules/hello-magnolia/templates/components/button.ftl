
<style type="text/css">
  [#include "button.css"]
</style>

<div class="button"  style="text-align:center">
  [#if content.buttonText?has_content]
    <a id="button" class="button" href="${content.linkText}">${content.buttonText!}</a>
  [/#if]
    <script>
        console.log(`${content.css}`);
        switch(`${content.css}`) {
        case `blue`:
            console.log("changing to blue button");
            document.getElementById("button").classList.add('button_blue');
            document.getElementById("button").classList.remove('button_red');   
            break;

        case `red`:
            console.log("changing to red button");
            document.getElementById("button").classList.add('button_red');
            document.getElementById("button").classList.remove('button_blue');   
            break;
        default:
            // code block
        }
        document.querySelector('button').removeAttribute('id');
    </script>
</div>

