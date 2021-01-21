<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>recipeMain</title>
<style>
.single-product {
	height: 500px;
}
</style>
<script>
function moveurl(category) { 
    location.href = category;
} 
</script>


</head>
<body>
	<!--====== LATEST PRODUCT PART START ======-->
	<section class="latest-product-area pt-130 pb-110">
		<div class="container">
			<div class="row">
				<div class="mx-auto col-xl-6 col-lg-7 col-md-10">
					<div class="text-center section-title mb-60">
						<h1>🥪Recipes for RactoOvo🥪</h1>
						<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr sed
							diam nonumy eirmod tempor invidunt dolore magna.</p>
					</div>
				</div>
			</div>
			<div class="search-area">
					<div class="container">
						<div class="search-wrapper">
							<form action="#">
								<div class="row justify-content-center">
									<div class="col-lg-3 col-sm-5 col-10">
										<div class="search-input">
											<label for="keyword"><i
												class="lni lni-search-alt theme-color"></i></label> <input
												type="text" name="keyword" id="keyword"
												placeholder="Product keyword">
										</div>
									</div>

									<div class="col-lg-3 col-sm-5 col-10">
										<div class="search-input" style="margin-bottom: 5%">
											<label for="category"><i
												class="lni lni-grid-alt theme-color"></i></label> <select
												name="category" onchange="moveurl(this.value);"
												id="category">
												<form name=move method=post>
													<option value="/recipeBegan.do">비건</option>
													<option value="/recipeRacto.do">락토</option>
													<option value="/recipeOvo.do">오보</option>
													<option value="/recipeRactoOvo.do" selected style="font-weight:bold">락토오보</option>
											</select>
											
										</div>
									</div>
									
								</div>
							</form>
						</div>
					</div>
				</div>
			<p />
			<div class="row">

				<div class="col-xl-3 col-lg-6 col-md-6">
					<div class="single-product">
						<div class="product-img">
							<a href="/recipeDesc.do"> <img src="images/salad.jpg"
								alt="">
							</a>
							<div class="product-action">
								<a href="javascript:void(0)"><i class="lni lni-heart"></i></a>

							</div>
						</div>

						<div class="product-content">
							<div class="namediv">
								<h3 class="name">
									<a href="/recipeDesc.do">Apple iPhone x</a>
								</h3>
							</div>
							<ul class="address">
								<li><a href="javascript:void(0)"><i
										class="lni lni-calendar"></i> 20 June, 2023</a></li>
								<li><a href="javascript:void(0)"><i
										class="lni lni-user"></i> Stifen Jon</a></li>
								<li><a href="javascript:void(0)"><i
										class="lni lni-package"></i> Used</a></li>
							</ul>
							<div class="product-bottom">
								<h3 class="price">$120.99</h3>
							</div>
						</div>
					</div>
				</div>

				<div class="col-xl-3 col-lg-6 col-md-6">
					<div class="single-product">
						<div class="product-img">
							<a href="/recipeDesc.do"> <img src="images/salad.jpg"
								alt="">
							</a>
							<div class="product-action">
								<a href="javascript:void(0)"><i class="lni lni-heart"></i></a>

							</div>
						</div>

						<div class="product-content">
							<div class="namediv">
								<h3 class="name">
									<a href="/recipeDesc.do">Apple MacBook Air</a>
								</h3>
							</div>
							<ul class="address">
								<li><a href="javascript:void(0)"><i
										class="lni lni-calendar"></i> 20 June, 2023</a></li>
								<li><a href="javascript:void(0)"><i
										class="lni lni-user"></i> Stifen Jon</a></li>
								<li><a href="javascript:void(0)"><i
										class="lni lni-package"></i> Used</a></li>
							</ul>
							<div class="product-bottom">
								<h3 class="price">$420.99</h3>

							</div>
						</div>
					</div>
				</div>

				<div class="col-xl-3 col-lg-6 col-md-6">
					<div class="single-product">
						<div class="product-img">
							<a href="/recipeDesc.do"> <img src="images/salad.jpg"
								alt="">
							</a>
							<div class="product-action">
								<a href="javascript:void(0)"><i class="lni lni-heart"></i></a>

							</div>
						</div>

						<div class="product-content">
							<div class="namediv">
								<h3 class="name">
									<a href="/recipeDesc.do">Cctv camera</a>
								</h3>
							</div>
							<ul class="address">
								<li><a href="javascript:void(0)"><i
										class="lni lni-calendar"></i> 20 June, 2023</a></li>
								<li><a href="javascript:void(0)"><i
										class="lni lni-user"></i> Stifen Jon</a></li>
								<li><a href="javascript:void(0)"><i
										class="lni lni-package"></i> Used</a></li>
							</ul>
							<div class="product-bottom">
								<h3 class="price">$80.99</h3>
							</div>
						</div>
					</div>
				</div>

				<div class="col-xl-3 col-lg-6 col-md-6">
					<div class="single-product">
						<div class="product-img">
							<a href="/recipeDesc.do"> <img src="images/salad.jpg"
								alt="">
							</a>
							<div class="product-action">
								<a href="javascript:void(0)"><i class="lni lni-heart"></i></a>

							</div>
						</div>

						<div class="product-content">
							<div class="namediv">
								<h3 class="name">
									<a href="/recipeDesc.do">Apple's new iMac</a>
								</h3>
							</div>
							<ul class="address">
								<li><a href="javascript:void(0)"><i
										class="lni lni-calendar"></i> 20 June, 2023</a></li>
								<li><a href="javascript:void(0)"><i
										class="lni lni-user"></i> Stifen Jon</a></li>
								<li><a href="javascript:void(0)"><i
										class="lni lni-package"></i> Used</a></li>
							</ul>
							<div class="product-bottom">
								<h3 class="price">$3000.99</h3>

							</div>
						</div>
					</div>
				</div>

				<div class="col-xl-3 col-lg-6 col-md-6">
					<div class="single-product">
						<div class="product-img">
							<a href="/recipeDesc.do"> <img src="images/salad.jpg"
								alt="">
							</a>
							<div class="product-action">
								<a href="javascript:void(0)"><i class="lni lni-heart"></i></a>

							</div>
						</div>

						<div class="product-content">
							<div class="namediv">
								<h3 class="name">
									<a href="/recipeDesc.do">Best Compact DSLR</a>
								</h3>
							</div>
							<ul class="address">
								<li><a href="javascript:void(0)"><i
										class="lni lni-calendar"></i> 20 June, 2023</a></li>
								<li><a href="javascript:void(0)"><i
										class="lni lni-user"></i> Stifen Jon</a></li>
								<li><a href="javascript:void(0)"><i
										class="lni lni-package"></i> Used</a></li>
							</ul>
							<div class="product-bottom">
								<h3 class="price">$290.99</h3>
							</div>
						</div>
					</div>
				</div>

				<div class="col-xl-3 col-lg-6 col-md-6">
					<div class="single-product">
						<div class="product-img">
							<a href="/recipeDesc.do"> <img src="images/salad.jpg"
								alt="">
							</a>
							<div class="product-action">
								<a href="javascript:void(0)"><i class="lni lni-heart"></i></a>
							</div>
						</div>

						<div class="product-content">
							<div class="namediv">
								<h3 class="name">
									<a href="/recipeDesc.do">10 Future Concept Cars</a>
								</h3>
							</div>
							<ul class="address">
								<li><a href="javascript:void(0)"><i
										class="lni lni-calendar"></i> 20 June, 2023</a></li>
								<li><a href="javascript:void(0)"><i
										class="lni lni-user"></i> Stifen Jon</a></li>
								<li><a href="javascript:void(0)"><i
										class="lni lni-package"></i> Used</a></li>
							</ul>
							<div class="product-bottom">
								<h3 class="price">$4520.99</h3>

							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</section>
	<!--====== LATEST PRODUCT PART ENDS ======-->

</body>
</html>