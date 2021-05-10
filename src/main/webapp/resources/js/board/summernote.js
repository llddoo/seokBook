
let delfilearray=new Array();

 $(document).ready(function(){
	$('#content').summernote({
			height: 500,
			disableResizeEditor: true,
			placeholder: '글 작성',
			toolbar:[
				['style', ['bold', 'italic', 'underline', 'clear']],
				['fontname', ['fontname']],
				['fontsize', ['fontsize']],
				['color', ['color']],
				['para', ['ul', 'ol', 'paragraph']],
				['table',['table']],
				['insert',['picture', 'link', 'video']]
			],
			fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
			callbacks: {
				onImageUpload: function(files) {
					for(file of files){
						uploadFile(file);
					}
				 },
				onMediaDelete: function(files){
					for(file of files){
						delfilearray.push(file);
					}
				}
			}// -- callbacks
	});
	$('.note-statusbar').hide();
});
 
 $("#btn").click(function(){
	let check = true;
	$(".frmCheck").each(function(){
		if($(this).val().trim()==""){
			check=false;
		}
	});
	if(check){
		for(file of delfilearray){
			deleteFile(file);
		}
		const name = $("#forimageupload").val();
		$(".formoveimg").each(function(){
			const filename = $(this).attr("alt");
			const origin = $(this).attr("src").replace($("#rootcontext").val()+"/", "/");
			let fixloca;
			if(origin.indexOf("temp/"+filename)>-1){
				fixloca = origin.replace("temp/"+filename, name);
				moveFile(origin, fixloca, filename);
			}
		});
		$("#frm").submit();
	}else{
		alert("입력되지 않은 칸이 존재합니다. 모두 입력해 주세요.");
	}
});

function uploadFile(file) {
	const formData = new FormData();
	let fileName="";
	const name = "temp";
	formData.append('file', file);
	formData.append('name', name);
	$.ajax({
		type: "POST",
		url: "./boardFileUpload",
		data:formData,
		enctype:"multipart/form-data",
		cache:false,
		processData:false,
		contentType:false,
		success:function(result){
			fileName=result.trim();
			let node = '<img class="formoveimg" alt="'+fileName+'" src="'
						+$("#rootcontext").val()+'/resources/uploaded/'+name+'/'+fileName+'">';
			$("#content").summernote('pasteHTML', node);
		} 
	});		
}

function deleteFile(file){
	const path = $(file).attr("src").replace($("#rootcontext").val()+"/", "/");
	$.ajax({
		type: "post",
		url: "./boardFileDelete", 
		data: {
			path:path
			}, 
		success: function(result){
			result=result.trim();
			if(result==='false'){
				alert('이미 삭제되었거나 삭제할 수 없는 이미지 입니다.');	
			}
		}
	});
}

function moveFile(origin, fixloca, filename){
	$.ajax({
		type: "post",
		url: "./boardFileMove", 
		data: {
			origin:origin,
			fixloca:fixloca
			}, 
		success: function(result){
			result=result.trim();
			if(result==='false'){
				alert(filename+"을 이동시킬 수 없습니다.");
			}
		}
	});
}
