
window.onload = function() {
    var c=document.getElementById("viewport");
    var ctx=c.getContext("2d");
    var img=document.getElementById("scream");
    ctx.drawImage(img,10,10);
};









// var canvas = document.getElementById('viewport');
// var context = canvas.getContext('2d');

// make_base();
// function make_base() {
//   base_image = new Image();
//   base_image.src = "/assets/images/Wrigley_Field.gif";
//   base_image.onload = function() { 
//   context.drawImage(base_image, 100, 100);
// };
// }


// <!DOCTYPE html>
// <html>
// <body>

// <p>Image to use:</p>
// <img id="scream" width="220" height="277" src="img_the_scream.jpg" alt="The Scream">

// <p>Canvas:</p>
// <canvas id="myCanvas" width="240" height="297" style="border:1px solid #d3d3d3;">
// Your browser does not support the HTML5 canvas tag.
// </canvas>

// <script>
// window.onload = function() {
//     var c = document.getElementById("myCanvas");
//     var ctx = c.getContext("2d");
//     var img = document.getElementById("scream");
//     ctx.drawImage(img, 10, 10);
// }
// </script>

// <p><strong>Note:</strong> The canvas tag is not supported in Internet
// // Explorer 8 and earlier versions.</p>

// // </body>
// </html>