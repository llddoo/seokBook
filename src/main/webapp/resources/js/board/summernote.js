
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
					uploadFile(files[0]);	
				 },
				onMediaDelete: function(files){
					deleteFile(files);
				}
					
			}// -- callbacks
	});
	$('.note-statusbar').hide();
});
 
 $("#btn").click(function(){
	let check = true;
	$(".frmCheck").each(function(){
		if($(this).val()==""){
			check=false;
		}
	});
	if(check){
		$("#frm").submit();
	}else{
		alert("입력되지 않은 칸이 존재합니다. 모두 입력해 주세요.");
	}
});

function uploadFile(files) {
	const multipartFile = new FormData();
	let fileName="";
	const name = $("#forimageupload").val();
	multipartFile.append('file', files[0]);
	$.ajax({
		type: "POST",
		url: "./boardFileUpload",
		data:multipartFile,
		enctype:"multipart/form-data",
		cache:false,
		processData:false,
		contentType:false,
		success:function(result){
			fileName=result.trim();
			$("#content").summernote('editor.insertImage', fileName);
		} 
	});		
}

function deleteFile(files){
	const name = $("#forimageupload").val();
	let fileName = $(files[0]).attr("src");
	fileName = fileName.substring(fileName.lastIndexOf('/')+1);
	$.ajax({
		type: "get",
		url: "./boardFileDelete", 
		data: {
			fileName:fileName, 
			name:name
			}, 
		success: function(result){
			result=result.trim();
			console.log(result);
		}
	});
}
