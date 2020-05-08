        $(function () {

            $(".sol-to-the-top").on("click", function () {

                //window.scrollTo(0, 0);

            	$('body,html').animate({
    				scrollTop: 0
    			}, 200);
            	
    			return false;

            	

            });

        });





        $(function () {
        	
        	var footerCurrentPage = ( $('#currentPage').val() * 1 ) + 1;
    		var footerTotalCount = ( $('#totalCount').val() );
        	
    		if ( footerCurrentPage > footerTotalCount ) {
    			$(".footerDiv").show();
    		}
    		else {
    			$(".footerDiv").hide();
    		}
        	
        	
        	var file = new Object();


            var $drop = $("#sol-image-drag-and-drop");
            $drop.on("dragenter", function (e) { //드래그 요소가 들어왔을떄
                $(this).addClass('drag-over');
            }).on("dragleave", function (e) { //드래그 요소가 나갔을때
                $(this).removeClass('drag-over');


            }).on("dragover", function (e) {
                e.stopPropagation();
                e.preventDefault();


            }).on('drop', function (e) { //드래그한 항목을 떨어뜨렸을때
                e.preventDefault();
                $(this).removeClass('drag-over');

                e.dataTransfer = e.originalEvent.dataTransfer; //2
                var files = e.target.files || e.dataTransfer.files;
                //console.log(files);
                file = files[0];
                //console.log(file);
                
                if (files.length > 1) {
                    alert('사진은 한 장만 업로드할 수 있습니다.');
                    return;
                }
                if (files[0].type.match(/image.*/)) {

                } else {
                    alert('이미지 파일이 아닙니다.');
                    return;
                }
                if (files[0].type.match(/image.*/)) {
                    $(e.target).css({
                        "background-image": "url(" + window.URL.createObjectURL(files[0]) + ")",
                        "border": 0,
                        "background-size": "auto 100%",
                        "background-repeat": "no-repeat",
                        "background-position": "center",
                        "background-color": "white",
                    }).text("");
                    //console.log(e.target);
                    selectFile(file);
                } else {
                    alert('이미지 파일이 아닙니다.');
                    return;
                }


            });



            $("#sol-image-drag-and-drop").on("click", function () {
                $("#sol-image").click();
            });

            $("#sol-image").on("change", function () {
                file = $('#sol-image').prop("files")[0];
                //console.log(file);
                //blobURL = window.URL.createObjectURL(file);
                $("#sol-image-drag-and-drop").css({
                    "background-image": "url(" + window.URL.createObjectURL(file) + ")",
                    "border": 0,
                    "background-size": "auto 100%",
                    "background-repeat": "no-repeat",
                    "background-position": "center",
                    "background-color": "white",
                }).text("");
                
                selectFile(file);
            });



            $('.sol-article-upload-modal').on('hidden.bs.modal', function (e) {
                console.log('modal close');
                $(this).find('form')[0].reset()
                $("#sol-image-drag-and-drop").css({
                    "width": "100%",
                    "height": "20rem",
                    "border": "3px dashed #8C8C8C",
                    "border-radius": "10px",
                    "transition": "all .15s ease-in-out",
                    "text-align": "center",
                    "line-height": "20rem",
                    "font-size": "1.2rem",
                    "color": "gray",
                    "background-color": "#F2F2F",
                    "text-align": "center",
                    "cursor": "pointer",
                    "background-image": "none"
                }).text("드래그하거나 클릭하여 업로드");
            });

            
            
            
            $("button:contains('등록')").on("click", function(){
            	
            	//console.log("저장할 파일?????" + file);
            	fncAddBoardArticle();
            	
            });
            
            function selectFile(file) {
          	  console.log(">>>>>");
          	  console.log(file);
          	  console.log(">>>>>");
            }
            
            function fncAddBoardArticle(){
            	var boardCode = $("input[name='boardCode']").val();
            	var articleContent = $("textarea[name='articleContent']").val();
            	var articleImage = file.name;
            	
            	if(articleContent == null || articleContent.length < 1){
            		alert("게시글 내용을 입력해주세요.");
            		return false;
            	}
            	
            	if(articleImage == null || articleImage.length < 1){
            		alert("업로드할 이미지 파일을 등록해주세요.");
            		return false;
            	}
            	
            	
            	var form_data = new FormData();
        	    form_data.append('file', file);
        	    form_data.append('boardCode', boardCode);
        	    $.ajax({
        	      data: form_data,
        	      type: "POST",
        	      async: false,
        	      url: '/article/json/saveImage',
        	      cache: false,
        	      contentType: false,
        	      enctype: 'multipart/form-data',
        	      processData: false,
        	      success: function(form_data) {
        	        
        	    	articleImage = form_data.fileName;
        	        //alert("업로드한 이미지 이름???" + articleImage);
        	        $("input[name='articleImage']").val(articleImage);
        	        
        	        //alert("전송할 이미지 이름>>>>>" + $("input[name='articleImage']").val());
        	      }
        	    });
            	
        	    //alert("전송할 이미지 이름>>>>>" + articleImage);
        	    
        	    
            	
            	 
            	$("#sol-add-photo").attr("method","POST").attr("enctype", "multipart/form-data").attr("action","/article/addBoardArticle").submit();
            }
            
            
            
            
            


            var $grid = $('.grid').imagesLoaded(function () {
                $grid.masonry({
                    itemSelector: '.grid-item',
                    //fitwidth: true,
                    columnWidth: '.grid-sizer',
                    percentPosition: true,
                    gutter: 20,
                    //horizontalOrder: true
                });
                
            });
                
            // 스크롤 이벤트 --------------------------------------------------------------
            $(window).scroll(function(){
            	clearTimeout( null );
//            	timer = setTimeout( scrollBoardArticleList, 100 );
            	
            	setTimeout(function() { scrollBoardArticleList(); }, 100); 
            });
            // 스크롤 이벤트 --------------------------------------------------------------
        	

            $("button:contains('더보기')").on("click", function(){

            	//console.log("저장할 파일?????" + file);
            	scrollBoardArticleList();

            });
            

        	// 댓글 리스트 스크롤로 추가할때 쓸 function ----------------------------------------
        	function scrollBoardArticleList() {
        		var currentPage = ( $('#currentPage').val() * 1 ) + 1;
        		var pageSize = ( $('#pageSize').val() );
        		var totalCount = ( $('#totalCount').val() );
        		console.log(pageSize);
        		console.log(totalCount);
        		
        		console.log("현재 페이지>>>>>>" + currentPage);
        		var maxPage = $('#maxPage').val();
        		// console.log("최대 페이지>>>>>>" + maxPage);
        		console.log("최대 페이지>>>>>>" + totalCount);
        		
        		if(currentPage == 2) {
//        			currentPage += 9;
        			currentPage += (pageSize - 1);
        			//maxPage += 9;
        			//totalCount +=
        		}
        		
        		var search = new Object();
        		search.currentPage = currentPage;
        		
        		
        		
        		if ( $(document).height() - 300 <= $(window).scrollTop() + $(window).height() ) {
        			//if ( maxPage >= currentPage ) {
        			if ( totalCount >= currentPage ) {
        				console.log('scroll이 됩니까');
        				
        				$.ajax(
        						{
        							url : "/article/json/getBoardArticleList", 
        							method : "post",
        							dataType : "json",
        							async : false,
        							headers : {
        								"Accept" : "application/json",
        								"Content-Type" : "application/json"
        							},
        							data : JSON.stringify({
        								search : search 
        							}), 
        							success : function(JSONData, status) {
        								var items = [];
        							
        								console.log('scroll ajax');
        								for(var i = 0; i < JSONData.list.length; i++) {
        									var display = '';
        									var $item = null;
        									console.log(">>>>>>>>>>>>>>>>>");
        									console.log(JSONData.list[i]);
        									console.log(">>>>>>>>>>>>>>>>>");
        									
        									var regDate = (JSONData.list[i].regDate).substring(0, 10);
        									
        									display += '<div class="grid-item">';
        									display += '<input type="hidden" id="articleNo" name="articleNo" value="' + JSONData.list[i].articleNo + '"/>';
        									display += '<img src="/images/sol/photo_board/' + JSONData.list[i].articleImage + '" onError="this.src=\'https://dummyimage.com/600x400/000/fff\';" />';
        									display += '<div class="sol-image-caption">';
        									display += '<div>';
        									display += '<div class="row">';
        									display += '<span class="col-6">' + regDate + '</span>';
        									display += '<span class="col-6 d-flex justify-content-end"> ';
        									display += '<i class="far fa-comment-dots my-auto mx-1"></i>';
        									display += '<span>' + JSONData.list[i].totalReply + ' &nbsp;</span>';	
        									display += '<i class="fas fa-heart my-auto mx-1"></i>';		
        									display += JSONData.list[i].totalFavor;			 
        									display += '</span>';			
        									display += '</div>';			
        									display += '<h4 class="mt-1">' + JSONData.list[i].user.nickName + '</h4>';			
        									display += '</div>';			
        									display += '</div>';			
        									display += '</div>';	
        									
        									////items.push(display);
        									
        									//$item = $(display);
        									//$item.push($(display));
        									//$grid.append( $item ).masonry( 'appended', $item).masonry("layout");
        									//$grid.append( $item );
        									//$grid.masonry( 'addItems', $item );
        									//$grid.masonry("layout");
        									//$grid.masonry( 'layoutItems', $item, false );
        									
        									var item = display;
//        									items.push(item);
        									var $items = $(display);
//        									setTimeout(function() { 
//        										$grid.append( $items ).masonry("appended", $items, true).masonry("layout");
//        									}, 500);
        									$grid.append( $items ).masonry( 'appended', $items).masonry("layout");
        								}
        								


        								$('#maxPage').val(JSONData.resultPage.maxPage);
        								$('#currentPage').val( currentPage );
        								
        								if ( currentPage >= totalCount ) {
        									
        	        		    			$(".footerDiv").show();
        	        		    		}
        	        		    		else {
        	        		    			$(".footerDiv").hide();
        	        		    		}
        							}
        						}
        				);
        				
        			}
        		}
        	}
        	// 댓글 리스트 스크롤로 추가할때 쓸 function ----------------------------------------
            
        });
        
   
      