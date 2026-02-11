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
    <p>Please confirm the information below and then press continue...</p>

    <table>
        <thead>
            <tr>
                <th colspan="2" style="text-align: center;">
                    <span style="font-size: 1.5em; font-weight: bold;">Order</span>
                    <br />
                    <span style="font-size: 1.2em; font-weight: bold;">
                        <fmt:formatDate value="${actionBean.order.orderDate}" pattern="yyyy/MM/dd hh:mm:ss" />
                    </span>
                </th>
            </tr>
        </thead>
        <tbody>
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
        </tbody>
    </table>

    <stripes:link class="Button" beanclass="org.mybatis.jpetstore.web.actions.OrderActionBean" event="newOrder">
        <stripes:param name="confirmed" value="true" />
        Confirm
    </stripes:link>
</div>

<%@ include file="../common/IncludeBottom.jsp"%>
