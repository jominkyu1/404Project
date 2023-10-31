<%@ page contentType="text/html; charset=UTF-8"%><link
	href="/css/bootstrap.min.css" rel="stylesheet">
<style>
#footerjs {
	background-color: rgba(211, 211, 211, 0.38);
	padding-top: 20px;
	padding-bottom: 20px;
}

.col-md-3 {
	display: inline-block;
	vertical-align: top;
	font-size: 16px; /* 모든 텍스트 크기를 16px로 설정 */
}

ul {
	list-style: none;
	text-align: left;
	font-size: 16px; /* 모든 텍스트 크기를 16px로 설정 */
}

h4 {
	text-align: center;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	font-size: 25px; /* 모든 텍스트 크기를 16px로 설정 */
}

a {
	text-decoration: none;
	color: inherit;
	font-size: 16px; /* 모든 텍스트 크기를 16px로 설정 */
}

.cs_info {
	display: flex;
}

.sns a {
	text-decoration: none; /* 링크 텍스트 밑줄 제거 */
	border: none; /* 테두리 제거 */
	outline: none; /* 포커스 테두리 제거 (접근성 고려) */
}
</style>

<footer class="py-5" id="footerjs">
	<div class="cs_info widget widget_links clearfix">
		<div class="col-md-3">
			<h4>CS Center</h4>
			<ul>
				<li class="hb_footer_tel">Tel: 070-1234-5678</li>
				<li><span>평일</span> 09:00am - 06:00pm</li>
				<li><span>점심</span> 12:00pm - 01:00pm</li>
				<li><span>휴무</span> 토 / 일 / 공휴일 휴무</li>
			</ul>
		</div>
		<div class="col-md-3">
			<h4>Bank Info</h4>
			<ul>
				<li><span>국민은행</span>1234-567-890123</li>
				<li><span>우리은행</span>1234-567-890123</li>
				<li><span>농협은행</span>1234-567-890123</li>
				<li><span>예금주 :</span> 홍길동</li>
			</ul>
		</div>
		<div class="col-md-3">
			<h4>SNS Link</h4>
			<nav class="sns" style="text-align: center;">
				<a target="_blank" href="https://www.instagram.com/"
					rel="noreferrer"> <img
					src="https://s-lol-web.op.gg/images/icon/icon-logo-instagram.svg?v=1698201580448"
					width="40" alt="instagram account" height="40" loading="lazy">
				</a> <a target="_blank" href="https://www.youtube.com/" rel="noreferrer">
					<img
					src="https://s-lol-web.op.gg/images/icon/icon-logo-youtube.svg?v=1698201580448"
					width="40" alt="youtube account" height="40" loading="lazy">
				</a> <br> <a target="_blank" href="https://twitter.com/"
					rel="noreferrer"> <img
					src="https://s-lol-web.op.gg/images/icon/icon-logo-x.svg?v=1698201580448"
					width="40" alt="twitter account" height="40" loading="lazy">
				</a> <a target="_blank" href="https://www.facebook.com/"
					rel="noreferrer"> <img
					src="https://s-lol-web.op.gg/images/icon/icon-logo-facebook.svg?v=1698201580448"
					width="40" alt="facebook account" height="40" loading="lazy">
				</a>
			</nav>
		</div>
		<div class="col-md-3">
			<h4>회사소개</h4>
			<div class="copy-link">
				<span>법인명(상호): 404Store</span> | <span>대표자(성명): 홍길동</span> | <br>
				<span>사업자 등록번호 안내: 12333-4563145-4222</span> | <br> <span>개인정보보호책임자:
					홍길동</span> | <br> <span>전화: 010-1234-5678</span> | <span>주소:
					서울 종로구 돈화문로 26 단성사빌딩 4층</span> <span><strong></strong></span>
			</div>
		</div>

	</div>
	<p class="m-0 text-center text-black">Copyright &copy; 404Store
		2023</p>
	
</footer>
</body>
</html>