<%@ tag description="Page template" pageEncoding="UTF-8"%>
<%@ attribute name="header" fragment="true"%>
<%@ attribute name="footer" fragment="true"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
  content="width=device-width, initial-scale=1, maximum-scale=1" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Template Layout</title>

<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
<script
  src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
  src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>
  <div class="container">
    <div id="pageheader">
      <jsp:invoke fragment="header" />
    </div>
    <div id="body">
      <jsp:doBody />
    </div>
    <div id="pagefooter">
      <jsp:invoke fragment="footer" />
    </div>
  </div>
</body>
</html>