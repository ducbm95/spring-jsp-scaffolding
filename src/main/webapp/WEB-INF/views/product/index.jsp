<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
        <h1>List of Products</h1>
        <hr />
        <a href="/products/new">Add product</a> |
        <a href="/products/new_list">Add list of products</a>
      </div>
    </div>
    <hr>
    
    <div class="row">
      <div class="col-md-12">
        <table class="table table-bordered">
          <thead>
            <tr>
              <th>Name</th>
              <th>Price</th>
              <th>Action</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach items="${products}" var="product">
              <tr>
                <td>${product.name}</td>
                <td>${product.price}</td>
                <td>
                  <span><a href="/products/${product.id}">Show</a></span> |
                  <span><a href="/products/${product.id}/edit">Edit</a></span>
                </td>
               </tr>
             </c:forEach>
          </tbody>
        </table>
      </div>
    </div>
  </jsp:body>
</t:genericpage>