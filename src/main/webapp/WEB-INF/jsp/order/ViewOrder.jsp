<%--
       Copyright 2010-2022 the original author or authors.

       Licensed under the Apache License, Version 2.0 (the "License");
       you may not use this file except in compliance with the License.
       You may obtain a copy of the License at

          https://www.apache.org/licenses/LICENSE-2.0

       Unless required by applicable law or agreed to in writing, software
       distributed under the License is distributed on an "AS IS" BASIS,
       WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
       See the License for the specific language governing permissions and
       limitations under the License.
--%>
<%@ include file="../common/IncludeTop.jsp"%>

<div id="BackLink">
    <stripes:link beanclass="org.mybatis.jpetstore.web.actions.CatalogActionBean">
        Return to Main Menu
    </stripes:link>
</div>

<div id="Catalog">

    <table>
        <thead>
            <tr>
                <th colspan="2" style="text-align: center;">
                    Order #${actionBean.order.orderId} 
                    <fmt:formatDate value="${actionBean.order.orderDate}" pattern="yyyy/MM/dd hh:mm:ss" />
                </th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <th colspan="2" scope="colgroup" style="background-color: #eee;">Payment Details</th>
            </tr>
            <tr>
                <th scope="row">Card Type:</th>
                <td><c:out value="${actionBean.order.cardType}" /></td>
            </tr>
            <tr>
                <th scope="row">Card Number:</th>
                <td><c:out value="${actionBean.order.creditCard}" /> * Fake number!</td>
            </tr>
            <tr>
                <th scope="row">Expiry Date (MM/YYYY):</th>
                <td><c:out value="${actionBean.order.expiryDate}" /></td>
            </tr>
            
            <tr>
                <th colspan="2" scope="colgroup" style="background-color: #eee;">Billing Address</th>
            </tr>
            <tr>
                <th scope="row">First name:</th>
                <td><c:out value="${actionBean.order.billToFirstName}" /></td>
            </tr>
            <tr>
                <th scope="row">Last name:</th>
                <td><c:out value="${actionBean.order.billToLastName}" /></td>
            </tr>
            <tr>
                <th scope="row">Address 1:</th>
                <td><c:out value="${actionBean.order.billAddress1}" /></td>
            </tr>
            <tr>
                <th scope="row">Address 2:</th>
                <td><c:out value="${actionBean.order.billAddress2}" /></td>
            </tr>
            <tr>
                <th scope="row">City:</th>
                <td><c:out value="${actionBean.order.billCity}" /></td>
            </tr>
            <tr>
                <th scope="row">State:</th>
                <td><c:out value="${actionBean.order.billState}" /></td>
            </tr>
            <tr>
                <th scope="row">Zip:</th>
                <td><c:out value="${actionBean.order.billZip}" /></td>
            </tr>
            <tr>
                <th scope="row">Country:</th>
                <td><c:out value="${actionBean.order.billCountry}" /></td>
            </tr>

            <tr>
                <th colspan="2" scope="colgroup" style="background-color: #eee;">Shipping Address</th>
            </tr>
            <tr>
                <th scope="row">First name:</th>
                <td><c:out value="${actionBean.order.shipToFirstName}" /></td>
            </tr>
            <tr>
                <th scope="row">Last name:</th>
                <td><c:out value="${actionBean.order.shipToLastName}" /></td>
            </tr>
            <tr>
                <th scope="row">Address 1:</th>
                <td><c:out value="${actionBean.order.shipAddress1}" /></td>
            </tr>
            <tr>
                <th scope="row">Address 2:</th>
                <td><c:out value="${actionBean.order.shipAddress2}" /></td>
            </tr>
            <tr>
                <th scope="row">City:</th>
                <td><c:out value="${actionBean.order.shipCity}" /></td>
            </tr>
            <tr>
                <th scope="row">State:</th>
                <td><c:out value="${actionBean.order.shipState}" /></td>
            </tr>
            <tr>
                <th scope="row">Zip:</th>
                <td><c:out value="${actionBean.order.shipZip}" /></td>
            </tr>
            <tr>
                <th scope="row">Country:</th>
                <td><c:out value="${actionBean.order.shipCountry}" /></td>
            </tr>
            <tr>
                <th scope="row">Courier:</th>
                <td><c:out value="${actionBean.order.courier}" /></td>
            </tr>
            <tr>
                <th scope="row">Status:</th>
                <td><c:out value="${actionBean.order.status}" /></td>
            </tr>
        </tbody>
    </table>

    <h3>Order Items</h3>

    <table>
        <thead>
            <tr>
                <th scope="col">Item ID</th>
                <th scope="col">Description</th>
                <th scope="col">Quantity</th>
                <th scope="col">Price</th>
                <th scope="col">Total Cost</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="lineItem" items="${actionBean.order.lineItems}">
                <tr>
                    <td>
                        <stripes:link beanclass="org.mybatis.jpetstore.web.actions.CatalogActionBean" event="viewItem">
                            <stripes:param name="itemId" value="${lineItem.item.itemId}" />
                            ${lineItem.item.itemId}
                        </stripes:link>
                    </td>
                    <td>
                        <c:choose>
                            <c:when test="${lineItem.item != null}">
                                ${lineItem.item.attribute1} ${lineItem.item.attribute2}
                                ${lineItem.item.attribute3} ${lineItem.item.attribute4}
                                ${lineItem.item.attribute5} ${lineItem.item.product.name}
                            </c:when>
                            <c:otherwise>
                                <i>{description unavailable}</i>
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td>${lineItem.quantity}</td>
                    <td><fmt:formatNumber value="${lineItem.unitPrice}" type="currency" /></td>
                    <td><fmt:formatNumber value="${lineItem.total}" type="currency" /></td>
                </tr>
            </c:forEach>
        </tbody>
        <tfoot>
            <tr>
                <th colspan="4" scope="row" style="text-align: right;">Total:</th>
                <td><fmt:formatNumber value="${actionBean.order.totalPrice}" type="currency" /></td>
            </tr>
        </tfoot>
    </table>

</div>

<%@ include file="../common/IncludeBottom.jsp"%>
