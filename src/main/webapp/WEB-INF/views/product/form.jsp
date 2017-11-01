<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:if test="${product.id == null}">
  <c:set var="header_text" value="Add product"></c:set>
  <c:set var="action" value="/products"></c:set>
</c:if>
<c:if test="${product.id != null}">
  <c:set var="header_text" value="Edit product"></c:set>
  <c:set var="action" value="/products/${product.id}/update"></c:set>
</c:if>

<t:genericpage>
  <jsp:attribute name="header">
    <h1>Welcome</h1>
  </jsp:attribute>
  <jsp:attribute name="footer">
    <p id="copyright">Copyright 1927, Future Bits When There Be Bits Inc.</p>
  </jsp:attribute>
  <jsp:body>
    <div class="row">
      <div class="col-md-12">
        <h1>${header_text}</h1>
        <hr/>
        <form:form modelAttribute="product" action="${action}" method="post">
          <div class="form-group">
            <label for="name">Product Name</label>
            <form:input path="name" cssClass="form-control" />
            <form:errors path="name" />
          </div>
          <div class="form-group">
            <label for="Price">Product Price</label>
            <form:input path="price" cssClass="form-control" />
            <form:errors path="price" />
          </div>
          <input type="submit" value="Save" class="btn btn-primary" />
          <a href="/products" class="btn btn-default">Cancel</a>
        </form:form>
      </div>
    </div>
  </jsp:body>
</t:genericpage>