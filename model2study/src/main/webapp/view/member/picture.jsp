<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
	img = opener.document.getElementById("pic");
	img.src = "../picture/${fname}";
	opener.document.f.picture.value = "${fname}";
	self.close();
</script>