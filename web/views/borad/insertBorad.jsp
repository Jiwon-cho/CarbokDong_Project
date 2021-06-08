<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<script src="//cdn.ckeditor.com/4.16.0/standard/ckeditor.js"></script>
	<style>
	ul, li{
		margin:0;
		padding:0;
		list-style-type:none;
	}
	#subject{
		width:100%;
	}
	.title_input{
		overflow: hidden;
		padding: 15px 3px 11px;
		border-bottom: 1px solid #e9eaeb;
		clear: both;
		margin: 0;
	}
	.title_input textarea{
		padding: 0;
		width: 80%;
		border: 0;
		font-size: 21px;
		line-height: 24px;
		resize: none;
		outline: none;
	}
	.btn{
		border-top: 1px solid #f5f5f5;
		margin: 0;
		padding: 0;
	}
	.btnbtn{
		display: inline-block;
		border: 0;
		padding: 0;
		text-align: right;
		line-height: 48px;
		background: transparent;
		font-size: 16px;
		color: #333;
		cursor: pointer;
		outline: 0;
		vertical-align: middle;
		margin: 0px;
		left: 1250px;
		position: relative;
	}
	.btnbtn2{
		display: inline-block;
		border: 0;
		padding: 0;
		text-align: right;
		line-height: 48px;
		background: transparent;
		font-size: 16px;
		color: #333;
		cursor: pointer;
		outline: 0;
		vertical-align: middle;
		margin: 0px;
		left: 1300px;
		position: relative;
	}
	.btbt{
		display: inline-block;
		border: 0;
		padding: 0;
		text-align: right;
		line-height: 48px;
		background: transparent;
		font-size: 16px;
		color: #333;
		cursor: pointer;
		outline: 0;
		vertical-align: middle;
		margin: 0px;
	}
	#content{
		resize: none;
	}	
	.iscontainer{
	width: 70%;
	position: relative;
	padding: 100px 100px 100px 100px;
	left: 200px;
	}	
</style>
<script>
attachFile = {
        idx:0,
        add:function(){ // 파일필드 추가
            var o = this;
            var idx = o.idx;

            var div = document.createElement('div');
            div.style.marginTop = '3px';
            div.id = 'file' + o.idx;

            var dv = document.createElement('dv');
            dv.style.marginTop = '3px';
            dv.id = 'dv' + o.idx;

            var file = document.all ? document.createElement('<input name="files">') : document.createElement('input');
            file.type = 'file';
            file.name = 'files';
            file.size = '40';
            file.id = 'fileField' + o.idx;
            file.onchange = function(){o.prev(this,'dv'+idx)};

            var btn = document.createElement('input');
            btn.type = 'button';
            btn.value = '삭제';
            btn.onclick = function(){o.del(idx)};
            btn.style.marginLeft = '5px';



            div.appendChild(file);
            div.appendChild(btn);
            document.getElementById('attachFileDiv').appendChild(div);
                        document.getElementById('attachFileDiv').appendChild(dv);

            o.idx++;
        },
        del:function(idx){ // 파일필드 삭제
            if(document.getElementById('fileField' + idx).value != '' && !confirm('삭제 하시겠습니까?')){
                return;
            }
            document.getElementById('attachFileDiv').removeChild(document.getElementById('file' + idx));
                        document.getElementById('attachFileDiv').removeChild(document.getElementById('dv' + idx));
        },
        prev:function(targetObj,View_area){ // 이미지 미리보기
            var preview = document.getElementById(View_area); //div id
            alert(View_area);
           var ua = window.navigator.userAgent;
  //ie일때(IE8 이하에서만 작동)
    if (ua.indexOf("MSIE") > -1) {
        targetObj.select();
        try {
            var src = document.selection.createRange().text; // get file full path(IE9, IE10에서 사용 불가)
            var ie_preview_error = document.getElementById("ie_preview_error_" + View_area);


            if (ie_preview_error) {
                preview.removeChild(ie_preview_error); //error가 있으면 delete
            }

            var img = document.getElementById(View_area); //이미지가 뿌려질 곳

            //이미지 로딩, sizingMethod는 div에 맞춰서 사이즈를 자동조절 하는 역할
            img.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"+src+"', sizingMethod='scale')";
        } catch (e) {
            if (!document.getElementById("ie_preview_error_" + View_area)) {
                var info = document.createElement("<p>");
                info.id = "ie_preview_error_" + View_area;
                info.innerHTML = e.name;
                preview.insertBefore(info, null);
            }
        }
  //ie가 아닐때(크롬, 사파리, FF)
    } else {
        var files = targetObj.files;
        for ( var i = 0; i < files.length; i++) {
            var file = files[i];
            var imageType = /image.*/; //이미지 파일일경우만.. 뿌려준다.
            var prevImg = document.getElementById("prev_" + View_area);
            if (!file.type.match(imageType)){
                preview.removeChild(prevImg);
                continue;
                }
             //이전에 미리보기가 있다면 삭제
            if (prevImg) {
                preview.removeChild(prevImg);
            }
            var img = document.createElement("img");
            img.id = "prev_" + View_area;
            img.classList.add("obj");
            img.file = file;
            img.style.width = '100px';
            img.style.height = '100px';
            preview.appendChild(img);
            if (window.FileReader) { // FireFox, Chrome, Opera 확인.
                var reader = new FileReader();
                reader.onloadend = (function(aImg) {
                    return function(e) {
                        aImg.src = e.target.result;
                    };
                })(img);
                reader.readAsDataURL(file);
            } else { // safari is not supported FileReader
                //alert('not supported FileReader');
                if (!document.getElementById("sfr_preview_error_"
                        + View_area)) {
                    var info = document.createElement("p");
                    info.id = "sfr_preview_error_" + View_area;
                    info.innerHTML = "not supported FileReader";
                    preview.insertBefore(info, null);
                }
            }
        }
    }

        }
    }

	$(function(){
		CKEDITOR.replace("content");
		$("#frm").submit(function(){
			if($("#subject").val()==""){
				alert("제목을 입력하세요...");
				return false;
			}
			if(CKEDITOR.instances.content.getData()==""){
				alert("내용을 입력하세요...");
				return false;
			}
			return true;
		})
	});
	const fn_cancel=()=>{

  		const result=confirm("정말로 취소하시겠습니까?");
		if(result){
			location.assign('<%=request.getContextPath()%>/borad/mainBorad');			
		}	

	};
	function setThumbnail(event) { var reader = new FileReader(); reader.onload = function(event) { var img = document.createElement("img"); img.setAttribute("src", event.target.result); document.querySelector("div#image_container").appendChild(img); }; reader.readAsDataURL(event.target.files[0]); };
	
</script>

<body>
	
	<div class="iscontainer">
		
		<form method="post" id="frm" action="<%=request.getContextPath() %>/boardWrite" enctype="multipart/form-data">
			<ul>
				<li class="title_input"><textarea name="title" id="subject" rows="1" placeholder="제목을 입력해주세요." maxlength="76" style="height: 26px;"></textarea></li>
				
				<li>
					<input class="btbt" type="file" name="upfile" accept="image/*" onchange="setThumbnail(event);" multiple="multiple">
					<div id="attachFileDiv">
					<input type="button" value="추가" onclick="attachFile.add()" style="margin-left:5px">
					</div>
			    </li>
				<li><div id="image_container"></div><li>
				<li><textarea name="content" id="content" cols="100" rows="50" ></textarea></li>
			</ul>
			<br>
			<hr>
			<!-- 주석처리 할것 -->
			 <input name="id" value="<%=loginMember.getUserId() %>" type="hidden"> 
			<br>
			<div class="btn">
			<input class="btnbtn" type="submit" value="등록하기" width="20" height="20">
			<input class="btnbtn2" type="button" value="취소하기" width="20" height="20" onclick="fn_cancel();">
			</div>
		</form>
		</div>
</body>
</html>

	
<%@ include file="/views/common/footer.jsp"%>