<!DOCTYPE html>
<html>
<head>
  <link href="https://fonts.googleapis.com/css?family=Roboto&display=swap"
        rel="stylesheet">
  <style type="text/css">
  [#include "footer.css"]
  </style>
  <title>Document</title>
</head>
<body>
  <div class="v2_29">
    <div class="v2_30"></div>
    <div class="v2_31">
      <span class="v2_32">© 2021 ${content.name!} Pte Ltd | All Rights Reserved</span>
      <div class="v2_33">
        <span class="v2_34">${content.title!}</span><span class="v2_35">${cmsfn.decode(content).title1text}</span>
      </div>
      <div class="v2_36">
        <span class="v2_37">${content.title2!}</span><span class="v2_38">${cmsfn.decode(content).title2text}</span>
      </div>
      <div class="v2_48">
        <span class="v2_49">Social</span>
        <div class="v2_50">
          <div class="v2_51">
            <div class="v2_52"></div>
          </div>
          <div class="v2_53">
            <div class="v2_54"></div>
          </div>
          <div class="v2_55">
            ${cmsfn.decode(content).social_text}
            <div class="name"></div>
          </div>
          <div class="v2_60">
            <div class="name"></div>
          </div>
          <div class="v2_64">
            <div class="v2_65"></div>
            <div class="v2_66"></div>
            <div class="v2_67"></div>
          </div>
        </div>
      </div>
      <div class="v2_68"></div>
      <div class="v2_39">
        <span class="v2_40">Contact Us</span>
        <div class="v2_41">
          <div class="v2_42">
            <span class="v2_43">Office Number:</span><span class="v2_44">${cmsfn.decode(content).contactus1}</span>
          </div>
          <div class="v2_45">
            <span class="v2_46">Company Number:</span><span class="v2_47">${cmsfn.decode(content).contactus2}</span>
          </div>
        </div>
      </div>
    </div>
    <div class="v3_3"><img alt=""
         height="120"
         src="${content.imageLink!}"
         width="120"></div>
  </div>
</body>
</html>
