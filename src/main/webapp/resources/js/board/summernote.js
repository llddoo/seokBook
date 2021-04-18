/**
 * 
 */
 $(document).ready(function(){
	$('#content').summernote({
			lang:"ko-KR",
			height: 200,
			mingheight: 200,
			maxheight: 200,
			disableResizeEditor: true,
			placeholder: '글 작성',
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