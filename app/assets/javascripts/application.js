//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require jquery-fileupload/basic
//= require cloudinary/jquery.cloudinary
//= require attachinary

/* I removed require_tree because we have active admin now and don't want the JS from that
to interfere with the JS for our user facing pages, if you need to add a new javascript library
please make a specific require like above */




/* Set the width of the side navigation to 250px and the left margin of the page content to 250px and add a black background color to body */
function openNav() {
    document.getElementById("mySidenav").style.width = "280px";
    document.getElementById("main").style.marginLeft = "280px";
    document.body.style.backgroundColor = "rgba(0,0,0,0.4)";
}

/* Set the width of the side navigation to 0 and the left margin of the page content to 0, and the background color of body to white */
function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
    document.getElementById("main").style.marginLeft = "0";
    document.body.style.backgroundColor = "white";
}


// flat shadows

function flattyShadow(){
var bg_size = 130;
var icon_size = 60;
  $('.flatty_shadow').each(function() {
    var bg_color = $(this).attr("data-bg-color") || '#f65034';
    var shadow_color = $(this).attr("data-shadow-color") || '#df3618';
    var icon_color = $(this).attr("data-icon-color") || '#ffffff';
    var angle = $(this).attr("data-angle") || 70;
    var depth = $(this).attr("data-depth") || 160;
    var shape = $(this).attr("data-shape") || 50;
    var bg_transparency = $(this).attr("data-bg-transparency")|| 1;
    var shadow_transparency = $(this).attr("data-shadow-transparency") || 1;
    var icon_transparency = $(this).attr("data-icon-transparency") || 1;
    var icon_pos_x = $(this).attr("data-pos-x") || 0;
    var icon_pos_y = $(this).attr("data-pos-y") || 0;
    bg_size = $(this).attr("data-bg-size") || 130;
    icon_size = $(this).attr("data-icon-size") || 60;

    var selectedIcon = $(this).html();

    $(this).empty();
    $(this).append('<div class="flatty_icon"><div class="centered"><span class="fs_icon">'+selectedIcon+'</span></div></div>')

    bg_color = ' rgba(' + hexToRgb(bg_color).r +', ' + hexToRgb(bg_color).g +', ' + hexToRgb(bg_color).b +', ' + bg_transparency + ')';
    shadow_color = ' rgba(' + hexToRgb(shadow_color).r +', ' + hexToRgb(shadow_color).g +', ' + hexToRgb(shadow_color).b +', ' + shadow_transparency + ')';
    icon_color = ' rgba(' + hexToRgb(icon_color).r +', ' + hexToRgb(icon_color).g +', ' + hexToRgb(icon_color).b +', ' + icon_transparency + ')';

      var x = 1.5 * Math.cos(angle * Math.PI/180);
        var y = 1.5 * Math.sin(angle * Math.PI/180);

        var num_x= x/2;
        var num_y= y/2;

        var long_shadow = "";

        for (var i = 1; i <= (depth*2); i++) {
            long_shadow += ' ' + x + 'px ' + y + 'px '+ 0 + ' '+ shadow_color + ',';
            x+=num_x;
            y+=num_y;
        }

        long_shadow = long_shadow.substr(0, long_shadow.length-1);

      $(this).children( '.flatty_icon' ).css('background-color', bg_color);
      $(this).children('.flatty_icon').find('.fs_icon').css( 'color', icon_color );
        $(this).children('.flatty_icon').find('.fs_icon').css( 'text-shadow', long_shadow );
        $(this).children('.flatty_icon').css({borderRadius:shape+'%'});
        $(this).children('.flatty_icon').find('.centered').css({ marginLeft : (parseInt(icon_pos_x)*2.3)-58+'px', marginTop : (parseInt(icon_pos_y)*1.5)-55+'px' });


  });
  $('.fs_icon').css( 'font-size', icon_size );
  $('.flatty_icon').css( 'width', bg_size );
  $('.flatty_icon').css( 'height', bg_size );
  var icon_pos = parseInt(icon_size.split('px')[0]) * -1;
  $('.centered').css( { marginLeft : icon_pos, marginTop : icon_pos } );
}

function hexToRgb(hex) {
      var result = /^#?([a-f\d]{2})([a-f\d]{2})([a-f\d]{2})$/i.exec(hex);
      return result ? {
          r: parseInt(result[1], 16),
          g: parseInt(result[2], 16),
          b: parseInt(result[3], 16)
      } : null;
  }


// Profile banner gradient
var colors = new Array(
  [202,232,246],
  [151,215,244],
  [103,232,249],
  [51,166,220],
  [28,87,160],
  [52,152,219]);

var step = 0;
//color table indices for:
// current color left
// next color left
// current color right
// next color right
var colorIndices = [0,1,2,3];

//transition speed
var gradientSpeed = 0.002;

function updateGradient()
{

  if ( $===undefined ) return;

var c0_0 = colors[colorIndices[0]];
var c0_1 = colors[colorIndices[1]];
var c1_0 = colors[colorIndices[2]];
var c1_1 = colors[colorIndices[3]];

var istep = 1 - step;
var r1 = Math.round(istep * c0_0[0] + step * c0_1[0]);
var g1 = Math.round(istep * c0_0[1] + step * c0_1[1]);
var b1 = Math.round(istep * c0_0[2] + step * c0_1[2]);
var color1 = "rgb("+r1+","+g1+","+b1+")";

var r2 = Math.round(istep * c1_0[0] + step * c1_1[0]);
var g2 = Math.round(istep * c1_0[1] + step * c1_1[1]);
var b2 = Math.round(istep * c1_0[2] + step * c1_1[2]);
var color2 = "rgb("+r2+","+g2+","+b2+")";

 $('#gradient').css({
   background: "-webkit-gradient(linear, left top, right top, from("+color1+"), to("+color2+"))"}).css({
    background: "-moz-linear-gradient(left, "+color1+" 0%, "+color2+" 100%)"});

  step += gradientSpeed;
  if ( step >= 1 )
  {
    step %= 1;
    colorIndices[0] = colorIndices[1];
    colorIndices[2] = colorIndices[3];

    //pick two new target color indices
    //do not pick the same as the current one
    colorIndices[1] = ( colorIndices[1] + Math.floor( 1 + Math.random() * (colors.length - 1))) % colors.length;
    colorIndices[3] = ( colorIndices[3] + Math.floor( 1 + Math.random() * (colors.length - 1))) % colors.length;

  }
}

setInterval(updateGradient,10);


