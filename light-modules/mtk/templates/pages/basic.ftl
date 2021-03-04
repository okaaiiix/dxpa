[#--
The page template 'basic' is based on  HTML5 Boilerplate v5.3.0., see https://github.com/h5bp/html5-boilerplate /dist.
--]
<!doctype html>
<html lang="${cmsfn.language()}">
<head>
    [@cms.page /]
    [@cms.area name="htmlHeader" contextAttributes={"pageDef": def} /]
</head>
<body>

[@cms.area name="navigation"/]

[@cms.area name="pageIntro"/]

<!--[if lt IE 8]>
<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
<![endif]-->

[@cms.area name="main"/]

[#-- Adding the <footer> tag in here because the footer area doesn't have a custom template set --]
<footer>
[@cms.area name="footer"/]
</footer>

</body>
</html>
