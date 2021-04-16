/**
 * 
 */
 
 $("#content").summernote({
			disableResizeEditor: true,
			 disableDragAndDrop: true,
			height:200,
			placeholder: 'write here...',
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
		url: "../fileUpload",
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