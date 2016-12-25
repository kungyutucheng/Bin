<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file = "/common/tagslib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${basePath }/asserts/uploadify/uploadify.css">
<title>Insert title here</title>
</head>
<body>
<input type="file" name="file_upload" id="file_upload" />
<button type="button" class="btn btn-primary start" onclick="javascript:$('#file_upload').uploadify('upload', '*');">
	<i class="glyphicon glyphicon-upload"></i>
	<span>开始上传</span>
</button>
<button type="button" class="btn btn-warning cancel" onclick="javascript:$('#file_upload').uploadify('cancel', '*');">
	<i class="glyphicon glyphicon-ban-circle"></i>
	<span>取消上传</span>
</button>
<button type="button" class="btn btn-danger delete" onclick="javascript:$('#file_upload').uploadify('stop');">
	<i class="glyphicon glyphicon-stop"></i>
	<span>停止</span>
</button>
<script type="text/javascript" src="${basePath }/asserts/uploadify/jquery.uploadify.min.js"></script>
<script type="text/javascript">
    $(function() {
        $('#file_upload').uploadify({
        	'auto'     : false,
        	'removeCompleted' : false,
        	'buttonText' : '选择文件',
            'swf'      : '${basePath }/asserts/uploadify/uploadify.swf',
            'uploader' : '${basePath }/image/upload'
            // Your options here
        });
    });
    
</script>
</body>
</html>