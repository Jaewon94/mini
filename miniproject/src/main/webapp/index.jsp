<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="nav.jsp"%>

<div class="carousel-wrapper">
      <div class="carousel">
        <img
          src="img/1.jpeg"
          alt="img1"
          width="1200px" height="600px"
        />
       <img
          src="img/2.jpeg"
          alt="img2"
          width="1200px" height="600px"
        />
        <img
          src="img/3.jpeg"
          alt="img3"
          width="1200px" height="600px"
        />
      </div>
    </div>
    <button class="prev" type="button">prev</button>
    <button class="next" type="button">next</button>
<script>
	const prevButton = document.querySelector('.prev');
	const nextButton = document.querySelector('.next');
	const carousel = document.querySelector('.carousel');
	let index = 0;

	prevButton.addEventListener('click', () => {
	   if (index === 0) {
		   index =2;
	   } else{
		   index -= 1;
	   }
	   
	   
	   carousel.style.transform = 'translate3d(-'+(1200 * index)+'px, 0, 0)';
	});

	nextButton.addEventListener('click', () => {
	   if (index === 2) {
		   index = 0;
	   } else {
		   index += 1;
	   }
	  
	   
	   carousel.style.transform = 'translate3d(-' + (1200 * index) + 'px, 0, 0)';
	});
	
</script>
</body>
</html>