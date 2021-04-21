
 $(document).ready(function(){
	$('#content').summernote({
			height: 200,
			mingheight: 200,
			maxheight: 200,
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
				   // upload image to server and create imgNode...
				   //$summernote.summernote('insertNode', imgNode);
				   uploadFile(files);
				 }, // -- onImageUpload
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

function deleteFile(files){
	let fileName = $(files[0]).attr("src");
	fileName = fileName.substring(fileName.lastIndexOf('/')+1);
	$.post("summerFileDelete", {fileName:fileName}, function(result){
		console.log(result);
	});
}


function uploadFile(files) {
	const formData = new FormData();
	formData.append('file', files[0]);
	let fileName="";
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
			$("#content").summernote('insertImage', fileName);
		} 
		
	});		
}

