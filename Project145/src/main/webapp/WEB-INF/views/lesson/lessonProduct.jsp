<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>lessonProduct.jsp</title>
</head>
<body>
	<section class="container blog-main-content">
		<div class="mayosis-floating-share">
			<div class="theiaStickySidebar"></div>
		</div>
		<div class="row">
			<div class="col-md-8 col-sm-7 col-xs-12">
				<div class="single-post-block single-prime-layout">
					<div class="prime-layout-gallery">
						<img width="750" height="480" src="/images/${lesson.getCImg() }"
							class="attachment-full size-full wp-post-image" alt=""
							loading="lazy" sizes="(max-width: 750px) 100vw, 750px">
					</div>
					<br>
					<hr>
					<h3>${lesson.getCDesc() }</h3>
					<hr>
					<div id="jp-relatedposts" class="jp-relatedposts"
						style="display: block;">
						<h3>강사명</h3>
						<p class="jp-relatedposts-post-excerpt">${lesson.getLecName() }</p>

						<div
							class="jp-relatedposts-items jp-relatedposts-items-visual jp-relatedposts-grid ">
							<div
								class="jp-relatedposts-post jp-relatedposts-post0 jp-relatedposts-post-thumbs">
								<br>
								<hr>
								<br>
								<h4 class="jp-relatedposts-post-title">
									<h3>커리큘럼</h3>
								</h4>
								<p class="jp-relatedposts-post-excerpt">
									${lesson.getCurriCulum() }</p>
							</div>
							<div
								class="jp-relatedposts-post jp-relatedposts-post2 jp-relatedposts-post-thumbs"
								data-post-id="87803" data-post-format="false">
								<hr>
								<br>
								<h4 class="jp-relatedposts-post-title">참여자 목록</h4>
								<br>
								<div class="row">
									<!-- Earnings (Monthly) Card Example -->
									<div class="col-xl-3 col-md-6 mb-4">
										<div class="card border-left-primary shadow h-100 py-2">
											<div class="card-body">
												<div class="row no-gutters align-items-center">
													<div class="col mr-2">
														<div
															class="text-xs font-weight-bold text-primary text-uppercase mb-1">
															참여자 아이디</div>
														<div class="h5 mb-0 font-weight-bold text-gray-800">사진
															넣을수있으면 넣어봐</div>
													</div>
													<div class="col-auto">
														<i class="fas fa-calendar fa-2x text-gray-300"></i>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="heateorSssClear"></div>
					<div
						class="heateor_sss_sharing_container heateor_sss_horizontal_sharing"
						heateor-sss-data-href="https://graygrids.com/templates/classilist-classified-ads-and-listing-website-template/">
						<div class="heateor_sss_sharing_title" style="font-weight: bold"></div>
						<ul class="heateor_sss_sharing_ul">
							<li class="heateorSssSharingRound"><i
								style="width: 40px; height: 40px; border-radius: 999px;"
								alt="Facebook" title="Facebook"
								class="heateorSssSharing heateorSssFacebookBackground"
								onclick="if (!window.__cfRLUnblockHandlers) return false; heateorSssPopup(&quot;https://www.facebook.com/sharer/sharer.php?u=https%3A%2F%2Fgraygrids.com%2Ftemplates%2Fclassilist-classified-ads-and-listing-website-template%2F&quot;)"><ss
										style="display:block;border-radius:999px;"
										class="heateorSssSharingSvg heateorSssFacebookSvg"></ss></i></li>
							<li class="heateorSssSharingRound"><i
								style="width: 40px; height: 40px; border-radius: 999px;"
								alt="Facebook" title="Facebook"
								class="heateorSssSharing heateorSssFacebookBackground"
								onclick="if (!window.__cfRLUnblockHandlers) return false; heateorSssPopup(&quot;https://www.facebook.com/sharer/sharer.php?u=https%3A%2F%2Fgraygrids.com%2Ftemplates%2Fclassilist-classified-ads-and-listing-website-template%2F&quot;)"><ss
										style="display:block;border-radius:999px;"
										class="heateorSssSharingSvg heateorSssFacebookSvg"></ss></i></li>
							<li class="heateorSssSharingRound"><i
								style="width: 40px; height: 40px; border-radius: 999px;"
								alt="Twitter" title="Twitter"
								class="heateorSssSharing heateorSssTwitterBackground"
								onclick="if (!window.__cfRLUnblockHandlers) return false; heateorSssPopup(&quot;http://twitter.com/intent/tweet?text=ClassiList%20-%20Classified%20Ads%20and%20Listing%20Bootstrap%205%20Template&amp;url=https%3A%2F%2Fgraygrids.com%2Ftemplates%2Fclassilist-classified-ads-and-listing-website-template%2F&quot;)"><ss
										style="display:block;border-radius:999px;"
										class="heateorSssSharingSvg heateorSssTwitterSvg"></ss></i></li>
						</ul>
						<div class="heateorSssClear"></div>
					</div>
					<div class="heateorSssClear"></div>
				</div>
				<div class="clearfix"></div>
			</div>
			<div class="col-md-4 col-sm-5 col-xs-12 product-sidebar">
				<div id="digital_download_details_widget-3"
					class="theme--sidebar--widget widget_digital_download_details_widget">
					<div class="sidebar-theme">
						<div class="single-product-widget">
							<h4 class="widget-title" style="margin-bottom: 0px;">
								<i class="zil zi-cart"></i> ${lesson.CTitle }
							</h4>
							<br>
							<hr>
							<br>
							<div class="cart-box row product-purchase-box">
								<div class="clearfix"></div>
								<div class="product_widget_inside">
									<div class="item-buttons">
										<form id="" method="post">
											<div class="edd_purchase_submit_wrapper">
												<a href="#"
													class="edd-add-to-cart button white styleone btn btn-primary btn-lg single_dm_btn edd-has-js"><span
													class="edd-add-to-cart-label">클래스 신청하기</span> </a>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<br>
				<hr>
				<br>
				<div id="product_release_info-3"
					class="theme--sidebar--widget product_release_info">
					<h4 class="widget-title">수강기간</h4>
					<p>${lesson.getCStart() }-${lesson.getCEnd() }</p>
					<br>
					<hr>
					<br>
					<h4 class="widget-title">수강인원</h4>
					<p>수강인원 당겨오기</p>
					<br>
					<hr>
					<br>
					<h4 class="widget-title">수강료</h4>
					<p>${lesson.getCPrice() }원</p>

				</div>
				<br>
				<hr>
				<br>
				<form action="">
					<h4 class="widget-title">문의하기</h4>
					<br>
					<textarea rows="5" cols="20"></textarea>
					<input type="submit" value="등록">
				</form>
			</div>
		</div>
	</section>
</body>
</html>