<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

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
        <h1>Show Product</h1>
        <hr />
        <div class="form-group">
          <label for="name">Name: </label><span> ${product.name}</span>
        </div>
        <div class="form-group">
          <label for="price">Price: </label><span> ${product.price}</span>
        </div>
    
        <a href="/products/${product.id}/edit">Edit this product</a><br />
        <a href="" data-toggle="modal" data-target="#deleteModal">Delete this product</a><br />
        <form:form action="/products/${product.id}" method="delete"
          id="deleteForm"></form:form>
        <a href="/products">Back to list</a><br />
      </div>
    </div>
    
    <!-- Modal -->
    <div class="modal fade" id="deleteModal" role="dialog">
      <div class="modal-dialog modal-sm">
        <div class="modal-content">
          <div class="modal-body">
            <p>Do you want to delete this product?</p>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-danger"
              data-dismiss="modal" id="delete">Delete</button>
            <button type="button" class="btn btn-default"
              data-dismiss="modal">Close</button>
          </div>
        </div>
      </div>
    </div>
    <script type="text/javascript">
    	$("#delete").on("click", function() {
    		$("#deleteForm").submit();
    	});
    </script>
  </jsp:body>
</t:genericpage>