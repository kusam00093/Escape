<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>패키지 홈</title>
<style>
:after,
:before,
*{
    box-sizing: border-box;
    
}
.container {
  width:80%;
  padding-right: 15px;
  padding-left: 15px;
  margin-right: auto;
  margin-left: auto;
}
body {
  margin: 0;
  font-family: 'Rajdhani', sans-serif;
}
h2 {
      line-height:1.1;
}
.hero-slider {
  
  width: 68%;
  height: 500px;
  margin : 0 auto;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  position: relative;
  z-index: 0;
  overflow: hidden; /* 넘치는 이미지 숨기기 */
}

@media (max-width: 991px) {
  .hero-slider {
    height: 600px;
  }
}

@media (max-width: 767px) {
  .hero-slider {
    height: 500px;
  }
}

.hero-slider .swiper-slide {
  overflow: hidden;
  color: #fff;
}

.hero-slider .swiper-container {
  width: 100%;
  height: 100%;
  position: absolute;
  left: 0;
  top: 0;
}

.hero-slider .slide-inner {
  width: 100%;
  height: 100%;
  position: absolute;
  left: 0;
  top: 0;
  z-index: 1;
  background-size: cover;
  background-position: center;
  display: flex;
  justify-content: center;
  align-items: center;
  text-align: left;
}

.hero-slider .swiper-button-prev,
.hero-slider .swiper-button-next {
  background: transparent;
  width: 55px;
  height: 55px;
  line-height: 53px;
  margin-top: -30px;
  text-align: center;
  border: 2px solid #d4d3d3;
  border-radius: 55px;
  opacity:0;
  visibility:hidden;
  transition:all .3s ease;
}
.hero-slider:hover .swiper-button-prev,
.hero-slider:hover .swiper-button-next {
  transform:translateX(0);
  opacity:1;
  visibility:visible;
}

@media (max-width: 767px) {
  .hero-slider .swiper-button-prev,
  .hero-slider .swiper-button-next {
    display: none;
  }
}

.hero-slider .swiper-button-prev {
  left: 25px;
  transform:translateX(50px);
}

.hero-slider .swiper-button-prev:before {
  font-family: "Font Awesome 5 Free";
  content: "\f060";
  font-size: 15px;
  color: #d4d3d3;
  font-style: normal;
  display: inline-block
  vertical-align: middle;
  font-weight: 900;
}

.hero-slider .swiper-button-next {
  right: 25px;
  transform:translateX(-50px);
}

.hero-slider .swiper-button-next:before {
  font-family: "Font Awesome 5 Free";
  content: "\f061";
  font-size: 15px;
  color: #d4d3d3;
  font-style: normal;
  display: inline-block
  vertical-align: middle;
  font-weight: 900;
}

.hero-slider .swiper-pagination-bullet {
  width: 12px;
  height: 12px;
  text-align: left;
  line-height: 12px;
  font-size: 12px;
  color: #000;
  opacity: 0.3;
  background:#fff;
  transition:all .2s ease;
}

.hero-slider .swiper-pagination-bullet-active {
  opacity:1;
}

.hero-slider .swiper-container-horizontal > .swiper-pagination-bullets,
.hero-slider .swiper-pagination-custom,
.hero-slider .swiper-pagination-fraction {
  bottom: 30px;
}

@media screen and (min-width: 992px) {
  .hero-slider .swiper-container-horizontal > .swiper-pagination-bullets,
  .hero-slider .swiper-pagination-custom,
  .hero-slider .swiper-pagination-fraction {
/*     display: none; */
  }
}
.swiper-pagination {
  text-align:left;
}

.hero-slider .swiper-container-horizontal > .swiper-pagination-bullets{
  bottom:50px;
    max-width: 1200px;
    padding: 0 15px;
    margin: 0 auto;
    left: 50%;
    transform: translateX(-50%);
}
}
@media (min-width: 767px) {
  .hero-slider .swiper-container-horizontal > .swiper-pagination-bullets{
  bottom:30px;
 
}
}
/*--------------------------------------------------------------
  #hero-style
--------------------------------------------------------------*/
.hero-style {
  height: 850px;
  transition:all .4s ease;
}

@media (max-width: 991px) {
  .hero-style {
    height: 600px;
  }
}

@media (max-width: 767px) {
  .hero-style{
    height: 500px;
  }
}

@media screen and (min-width: 992px) {
  .hero-style .container {
    padding-top: 95px;
  }
}

.hero-style .slide-title,
.hero-style .slide-text,
.hero-style .slide-btns {
  max-width: 690px;
}

.hero-style .slide-title h2 {
  font-size: 100px;
  font-weight: 600;
  line-height: 1;
  color: #ffffff;
  margin: 0 0 40px;
  text-transform: capitalize;
  transition:all .4s ease;
}

@media (max-width: 1199px) {
  .hero-style .slide-title h2 {
    font-size: 75px;
  }
}

@media (max-width: 991px) {
  .hero-style .slide-title h2 {
    font-size: 50px;
    margin: 0 0 35px;
  }
}

@media (max-width: 767px) {
  .hero-style .slide-title h2 {
    font-size: 35px;
    margin: 0 0 30px;
  }
}

.hero-style .slide-text p {
  opacity: 0.8;
  font-family: Rajdhani;
  font-size: 32px;
  font-weight: 500;
  line-height: 1.25;
  letter-spacing: normal;
  color: #ffffff;
  margin: 0 0 40px;
  transition:all .4s ease;
}

@media (max-width: 767px) {
  .hero-style .slide-text p {
    font-size: 16px;
    font-size: 1rem;
    font-weight: normal;
    margin: 0 0 30px;
  }
}

.hero-style .slide-btns > a:first-child {
  margin-right: 10px;
}


/*--------------------------------------------------------------
  #button-style
--------------------------------------------------------------*/
.theme-btn, .theme-btn-s2{
    background-color: #ffffff;
    font-size: 20px;
  font-weight: 500;
  line-height: 1.4;
  text-align: center;
  color:#2b3b95;
    padding: 9px 32px;
    border: 0; 
  border-radius: 3px;
    text-transform: uppercase;
    display: inline-block;
    line-height: initial;
  transition:all .4s ease;
}
a {
    text-decoration: none;
    transition: all 0.2s ease;
}
.theme-btn-s2{
    background-color: rgba(255, 255, 255, 0.9);
    color: #131e4a;
}
.theme-btn:hover, .theme-btn-s2:hover, .theme-btn:focus, .theme-btn-s2:focus, .theme-btn:active, .theme-btn-s2:active {
    background-color:#2b3b95 ;
    color: #fff;
}
.theme-btn-s3{
  font-size: 16px;
  font-weight: 500;
  line-height: 1.5;
  color: #ffffff;
  text-transform: uppercase;
}
i.fa-chevron-circle-right{
  height:22px;
  width:22px;
}
a:hover {
    text-decoration: none;
}
@media (max-width: 991px){
  .theme-btn, .theme-btn-s2, .theme-btn-s3 {
    font-size: 13px;
    padding: 15px 25px;
  }
}
@media (max-width: 767px){
  .theme-btn, .theme-btn-s2{
    padding: 13px 20px;
    font-size: 13px;
  }
}


#sortbox{
	width : 84%;
	margin: 20px 0px;
	text-align: right;
}

  


  .container2 {
    width : 80%;
    margin : 0 auto;
    margin-left : 300px;
    display: flex;
    flex-wrap: wrap;
    justify-content: flex-start; ;
    gap: 30px;
  }
  .card {
    width: 300px;
    border-radius: 8px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    overflow: hidden;
    transition: transform 0.3s ease;
  }

  .card:hover {
    transform: translateY(-5px);
  }

  .card img {
    width: 100%;
    height: auto;
    border-radius: 8px 8px 0 0;
  }

  .card-content {
    padding: 20px;
    background-color: #f9f9f9;
  }

  .card-title {
    font-size: 18px;
    font-weight: bold;
    margin-bottom: 10px;
  }

  .card-description {
    font-size: 14px;
    color: #666;
  }


</style> 
<link rel="stylesheet" type="text/css" href="https://s3-us-west-2.amazonaws.com/s.cdpn.io/t-97/variables.css">
<link rel="stylesheet" type="text/css" href="https://s3-us-west-2.amazonaws.com/s.cdpn.io/169963/mixins.css">
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link rel="stylesheet" href="/css/common.css" />
<link rel="stylesheet" href="/css/header.css" />
<link href="https://fonts.googleapis.com/css?family=Rajdhani&display=swap" rel="stylesheet">

</head>
	<%@include file="/WEB-INF/include/header.jsp"%>

	<%@include file="/WEB-INF/include/nav.jsp"%>
<body>


<!-- start of hero -->
<section class="hero-slider hero-style">
  <div class="swiper-container">
    <div class="swiper-wrapper">
      <div class="swiper-slide">
        <div class="slide-inner slide-bg-image" data-background="/package_image/package_paris.jpg">
          <div class="container">
            <div data-swiper-parallax="300" class="slide-title">
              <h2>GUITAR CLASSESFOR KIDS</h2>
            </div>
            <div data-swiper-parallax="400" class="slide-text">
              <p>Want to see your kid become more expressive?</p>
            </div>
            <div class="clearfix"></div>
            <div data-swiper-parallax="500" class="slide-btns">
              <a href="#" class="theme-btn-s2">Register now</a>
              <a href="#" class="theme-btn-s3"><i class="fas fa-chevron-circle-right"></i> Get Info</a>
            </div>
          </div>
        </div>
        <!-- end slide-inner -->
      </div>
      <!-- end swiper-slide -->

      <div class="swiper-slide">
        <div class="slide-inner slide-bg-image" data-background="/package_image/package_epl.jpg">
          <div class="container">
            <div data-swiper-parallax="300" class="slide-title">
              <h2>GUITAR CLASSESFOR KIDS</h2>
            </div>
            <div data-swiper-parallax="400" class="slide-text">
              <p>Want to see your kid become more expressive?</p>
            </div>
            <div class="clearfix"></div>
            <div data-swiper-parallax="500" class="slide-btns">
              <a href="#" class="theme-btn-s2">Register now</a>
              <a href="#" class="theme-btn-s3"><i class="fas fa-chevron-circle-right"></i>Get Info</a>
            </div>
          </div>
        </div>
        <!-- end slide-inner -->
      </div>
      <!-- end swiper-slide -->
    </div>
    <!-- end swiper-wrapper -->

    <!-- swipper controls -->
    <div class="swiper-pagination"></div>
    <div class="swiper-button-next"></div>
    <div class="swiper-button-prev"></div>
  </div>
</section>
<!-- end of hero slider -->
<div id="sortbox">
  <label for="sortOption">정렬선택</label>
  <select id="sortOption" name="sortOption">
    <option value="recommendation">Recommendation</option>
    <option value="views">Views</option>
  </select>
</div>
<div class="container2">
 <a href="/Package/Detail">
  <div class="card">
    <img src="https://via.placeholder.com/300x200" alt="Placeholder Image">
    <div class="card-content">
      <h3 class="card-title">Card Title</h3>
      <p class="card-description">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam in ligula ac lacus varius vehicula eget at ipsum.</p>
    </div>
  </div>
 </a>
 <a href="Package/Detail">
  <div class="card">
    <img src="https://via.placeholder.com/300x200" alt="Placeholder Image">
    <div class="card-content">
      <h3 class="card-title">Card Title</h3>
      <p class="card-description">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam in ligula ac lacus varius vehicula eget at ipsum.</p>
    </div>
  </div>
 </a>
 <a href="Package/Detail">
  <div class="card">
    <img src="https://via.placeholder.com/300x200" alt="Placeholder Image">
    <div class="card-content">
      <h3 class="card-title">Card Title</h3>
      <p class="card-description">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam in ligula ac lacus varius vehicula eget at ipsum.</p>
    </div>
  </div>
 </a>
 <a href="Package/Detail">
  <div class="card">
    <img src="https://via.placeholder.com/300x200" alt="Placeholder Image">
    <div class="card-content">
      <h3 class="card-title">Card Title</h3>
      <p class="card-description">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam in ligula ac lacus varius vehicula eget at ipsum.</p>
    </div>
  </div>
 </a>
 <a href="Package/Detail">
  <div class="card">
    <img src="https://via.placeholder.com/300x200" alt="Placeholder Image">
    <div class="card-content">
      <h3 class="card-title">Card Title</h3>
      <p class="card-description">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam in ligula ac lacus varius vehicula eget at ipsum.</p>
    </div>
  </div>
 </a>
 <a href="Package/Detail">
  <div class="card">
    <img src="https://via.placeholder.com/300x200" alt="Placeholder Image">
    <div class="card-content">
      <h3 class="card-title">Card Title</h3>
      <p class="card-description">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam in ligula ac lacus varius vehicula eget at ipsum.</p>
    </div>
  </div>
 </a>
 <a href="Package/Detail">
  <div class="card">
    <img src="https://via.placeholder.com/300x200" alt="Placeholder Image">
    <div class="card-content">
      <h3 class="card-title">Card Title</h3>
      <p class="card-description">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam in ligula ac lacus varius vehicula eget at ipsum.</p>
    </div>
  </div>
 </a>
 <a href="Package/Detail">
  <div class="card">
    <img src="https://via.placeholder.com/300x200" alt="Placeholder Image">
    <div class="card-content">
      <h3 class="card-title">Card Title</h3>
      <p class="card-description">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam in ligula ac lacus varius vehicula eget at ipsum.</p>
    </div>
  </div>
 </a>
 <a href="Package/Detail">
  <div class="card">
    <img src="https://via.placeholder.com/300x200" alt="Placeholder Image">
    <div class="card-content">
      <h3 class="card-title">Card Title</h3>
      <p class="card-description">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam in ligula ac lacus varius vehicula eget at ipsum.</p>
    </div>
  </div>
 </a>
 <a href="Package/Detail">
  <div class="card">
    <img src="https://via.placeholder.com/300x200" alt="Placeholder Image">
    <div class="card-content">
      <h3 class="card-title">Card Title</h3>
      <p class="card-description">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam in ligula ac lacus varius vehicula eget at ipsum.</p>
    </div>
  </div>
 </a>
 <a href="Package/Detail">
  <div class="card">
    <img src="https://via.placeholder.com/300x200" alt="Placeholder Image">
    <div class="card-content">
      <h3 class="card-title">Card Title</h3>
      <p class="card-description">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam in ligula ac lacus varius vehicula eget at ipsum.</p>
    </div>
  </div>
 </a>
 <a href="Package/Detail">
  <div class="card">
    <img src="https://via.placeholder.com/300x200" alt="Placeholder Image">
    <div class="card-content">
      <h3 class="card-title">Card Title</h3>
      <p class="card-description">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam in ligula ac lacus varius vehicula eget at ipsum.</p>
    </div>
  </div>
 </a>
 <a href="Package/Detail">
  <div class="card">
    <img src="https://via.placeholder.com/300x200" alt="Placeholder Image">
    <div class="card-content">
      <h3 class="card-title">Card Title</h3>
      <p class="card-description">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam in ligula ac lacus varius vehicula eget at ipsum.</p>
    </div>
  </div>
 </a>
 <a href="Package/Detail">
  <div class="card">
    <img src="https://via.placeholder.com/300x200" alt="Placeholder Image">
    <div class="card-content">
      <h3 class="card-title">Card Title</h3>
      <p class="card-description">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam in ligula ac lacus varius vehicula eget at ipsum.</p>
    </div>
  </div>
 </a>
 <a href="Package/Detail">
  <div class="card">
    <img src="https://via.placeholder.com/300x200" alt="Placeholder Image">
    <div class="card-content">
      <h3 class="card-title">Card Title</h3>
      <p class="card-description">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam in ligula ac lacus varius vehicula eget at ipsum.</p>
    </div>
  </div>
 </a>
 <a href="Package/Detail">
  <div class="card">
    <img src="https://via.placeholder.com/300x200" alt="Placeholder Image">
    <div class="card-content">
      <h3 class="card-title">Card Title</h3>
      <p class="card-description">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam in ligula ac lacus varius vehicula eget at ipsum.</p>
    </div>
  </div>
 </a>
 <a href="Package/Detail">
  <div class="card">
    <img src="https://via.placeholder.com/300x200" alt="Placeholder Image">
    <div class="card-content">
      <h3 class="card-title">Card Title</h3>
      <p class="card-description">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam in ligula ac lacus varius vehicula eget at ipsum.</p>
    </div>
  </div>
 </a>
 <a href="Package/Detail">
  <div class="card">
    <img src="https://via.placeholder.com/300x200" alt="Placeholder Image">
    <div class="card-content">
      <h3 class="card-title">Card Title</h3>
      <p class="card-description">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam in ligula ac lacus varius vehicula eget at ipsum.</p>
    </div>
  </div>
 </a>

</div>





  

<div>&nbsp;</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<%@include file="/WEB-INF/include/footer.jsp"%>

<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script>
//HERO SLIDER
var menu = [];
document.querySelectorAll('.swiper-slide').forEach(function(slide) {
    var dataText = slide.querySelector('.slide-inner').getAttribute("data-text");
    menu.push(dataText);
});

var interleaveOffset = 0.5;

var swiperOptions = {
    loop: true,
    speed: 1000,
    parallax: true,
    autoplay: {
        delay: 6500,
        disableOnInteraction: false,
    },
    watchSlidesProgress: true,
    pagination: {
        el: '.swiper-pagination',
        clickable: true,
    },
    navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
    },
    on: {
        progress: function() {
            var swiper = this;
            for (var i = 0; i < swiper.slides.length; i++) {
                var slideProgress = swiper.slides[i].progress;
                var innerOffset = swiper.width * interleaveOffset;
                var innerTranslate = slideProgress * innerOffset;
                swiper.slides[i].querySelector(".slide-inner").style.transform =
                "translate3d(" + innerTranslate + "px, 0, 0)";
            }      
        },
        touchStart: function() {
            var swiper = this;
            for (var i = 0; i < swiper.slides.length; i++) {
                swiper.slides[i].style.transition = "";
            }
        },
        setTransition: function(speed) {
            var swiper = this;
            for (var i = 0; i < swiper.slides.length; i++) {
                swiper.slides[i].style.transition = speed + "ms";
                swiper.slides[i].querySelector(".slide-inner").style.transition =
                speed + "ms";
            }
        }
    }
};

var swiper = new Swiper(".swiper-container", swiperOptions);

// DATA BACKGROUND IMAGE
document.addEventListener('DOMContentLoaded', function () {
    var sliderBgSetting = document.querySelectorAll(".slide-bg-image");
    sliderBgSetting.forEach(function(element) {
        var background = element.getAttribute("data-background");
        if (background) {
            element.style.backgroundImage = "url(" + background + ")";
        }
    });
});
</script>

</body>

</html>
