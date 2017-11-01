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
        <h1>Add list of Products</h1>
        <hr />
        <form:form modelAttribute="productListForm"
          action="/products/create_list" method="post">
          <table class="table table-bordered">
            <thead>
              <tr>
                <th>Name</th>
                <th>Price</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td><form:input path="products[0].name" cssClass="form-control"/></td>
                <td><form:input path="products[0].price" cssClass="form-control"/></td>
              </tr>
              <tr>
                <td><form:input path="products[1].name" cssClass="form-control"/></td>
                <td><form:input path="products[1].price" cssClass="form-control"/></td>
              </tr>
              <tr>
                <td><form:input path="products[2].name" cssClass="form-control"/></td>
                <td><form:input path="products[2].price" cssClass="form-control"/></td>
              </tr>
            </tbody>
          </table>
          <input type="submit" value="Save" class="btn btn-primary" />
          <a href="/products" class="btn btn-default">Cancel</a>
        </form:form>
      </div>
    </div>
  </jsp:body>
</t:genericpage>