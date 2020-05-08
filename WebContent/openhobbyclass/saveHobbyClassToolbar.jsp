<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- //2020-02-24 Git Commit --%>
	<div class="d-none d-lg-block">
		<nav class="navbar navbar-expand-lg fixed-top navbar-light bg-light" style="width:100%; padding-left:24px;">
			<a class="navbar-brand" href="/index.jsp"><img src="/resources/image/logo/logo-favicon.png" width="36px" height="36px"></a>
			<span class="lmhc-cc-text">CREATOR CENTER</span>
				
			<div class="collapse navbar-collapse justify-content-end">
				<div class="navbar-nav">
				
					<button type="button" class="btn btn-light">    
						 <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24">
							 <path fill="none" d="M0 0h24v24H0V0z"/>
							 <path d="M12 6.5c3.79 0 7.17 2.13 8.82 5.5-1.65 3.37-5.02 5.5-8.82 5.5S4.83 15.37 3.18 12C4.83 8.63 8.21 6.5 12 6.5m0-2C7 4.5 2.73 7.61 1 12c1.73 4.39 6 7.5 11 7.5s9.27-3.11 11-7.5c-1.73-4.39-6-7.5-11-7.5zm0 5c1.38 0 2.5 1.12 2.5 2.5s-1.12 2.5-2.5 2.5-2.5-1.12-2.5-2.5 1.12-2.5 2.5-2.5m0-2c-2.48 0-4.5 2.02-4.5 4.5s2.02 4.5 4.5 4.5 4.5-2.02 4.5-4.5-2.02-4.5-4.5-4.5z"/>
						 </svg>
					     <span class="getPreviewClass" style="font-size: 14px;">미리보기
					     </span>
				    </button>
					<button type="button" class="btn btn-light saveAndOutButton">
						<svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24">
					    	<path d="M0 0h24v24H0z" fill="none"/>
					    	<path d="M10.09 15.59L11.5 17l5-5-5-5-1.41 1.41L12.67 11H3v2h9.67l-2.58 2.59zM19 3H5c-1.11 0-2 .9-2 2v4h2V5h14v14H5v-4H3v4c0 1.1.89 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2z"/>
						</svg>
					    <span style="font-size: 14px;">저장 후 나가기
					    </span>
				    </button>
				    
				</div>
			</div>
			
		</nav>
	</div>
	
	
	<div class="d-block d-lg-none">
		<nav class="navbar navbar-expand-lg fixed-top navbar-light bg-light" style="width:100%; padding-left:24px;">
			<a class="navbar-brand" href="/index.jsp"><img src="/resources/image/logo/logo-favicon.png" width="36px" height="36px"></a>
			
			<div class="justify-content-end">
				<div class="navbar-nav">				
					<div>
						<div style="float: left;">
							<button type="button" class="btn btn-light">
								<span class="getPreviewClass" style="font-size: 14px;">미리보기
								</span>
							</button>
						</div>
						<div style="float: left;">
							<button type="button" class="btn btn-light saveAndOutButton">
						   		<span style="font-size: 14px;">저장 후 나가기
						   		</span>
					   		</button>
					   	</div> 
			        </div>
		        </div>
		    </div>
		    <div class="progress-div" style="position:relative; top: 12px; left:-24px; width:100%;">
			  <div class="progress-bar" role="progressbar" style="background-color: rgb(253, 126, 20); width: 100%; height:4px;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="120"></div>
			</div>
		</nav>
		
	</div>
