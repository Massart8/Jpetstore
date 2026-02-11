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
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="stripes" uri="http://stripes.sourceforge.net/stripes.tld"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="StyleSheet" href="../css/jpetstore.css" type="text/css" media="screen" />
    <title>JPetStore Demo</title>
    <meta charset="UTF-8" />
    <meta http-equiv="Cache-Control" content="no-store, no-cache, must-revalidate" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Expires" content="0" />
</head>

<body>

<div id="Header">

    <div id="Logo">
        <div id="LogoContent">
            <stripes:link beanclass="org.mybatis.jpetstore.web.actions.CatalogActionBean">
                <img src="../images/logo-topbar.gif" alt="JPetStore Logo" />
            </stripes:link>
        </div>
    </div>

    <div id="Menu">
        <div id="MenuContent">
            <stripes:link beanclass="org.mybatis.jpetstore.web.actions.CartActionBean" event="viewCart">
                <img name="img_cart" src="../images/cart.gif" alt="Shopping Cart" style="vertical-align: middle;" />
            </stripes:link>
            
            <img src="../images/separator.gif" alt="" style="vertical-align: middle;" />

            <c:choose>
                <c:when test="${sessionScope.accountBean == null or !sessionScope.accountBean.authenticated}">
                    <stripes:link beanclass="org.mybatis.jpetstore.web.actions.AccountActionBean" event="signonForm">
                        Sign In
                    </stripes:link>
                </c:when>
                <c:otherwise>
                    <stripes:link beanclass="org.mybatis.jpetstore.web.actions.AccountActionBean" event="signoff">
                        Sign Out
                    </stripes:link>
                    <img src="../images/separator.gif" alt="" style="vertical-align: middle;" />
                    <stripes:link beanclass="org.mybatis.jpetstore.web.actions.AccountActionBean" event="editAccountForm">
                        My Account
                    </stripes:link>
                </c:otherwise>
            </c:choose>

            <img src="../images/separator.gif" alt="" style="vertical-align: middle;" />
            <a href="../help.html">Help (?)</a>
        </div>
    </div>

    <div id="Search">
        <div id="SearchContent">
            <stripes:form beanclass="org.mybatis.jpetstore.web.actions.CatalogActionBean">
                <stripes:text name="keyword" size="14" />
                <stripes:submit name="searchProducts" value="Search" />
            </stripes:form>
        </div>
    </div>

    <div id="QuickLinks">
        <stripes:link beanclass="org.mybatis.jpetstore.web.actions.CatalogActionBean" event="viewCategory">
            <stripes:param name="categoryId" value="FISH" />
            <img src="../images/sm_fish.gif" alt="Fish" />
        </stripes:link>
        <img src="../images/separator.gif" alt="" />
        
        <stripes:link beanclass="org.mybatis.jpetstore.web.actions.CatalogActionBean" event="viewCategory">
            <stripes:param name="categoryId" value="DOGS" />
            <img src="../images/sm_dogs.gif" alt="Dogs" />
        </stripes:link>
        <img src="../images/separator.gif" alt="" />
        
        <stripes:link beanclass="org.mybatis.jpetstore.web.actions.CatalogActionBean" event="viewCategory">
            <stripes:param name="categoryId" value="REPTILES" />
            <img src="../images/sm_reptiles.gif" alt="Reptiles" />
        </stripes:link>
        <img src="../images/separator.gif" alt="" />
        
        <stripes:link beanclass="org.mybatis.jpetstore.web.actions.CatalogActionBean" event="viewCategory">
            <stripes:param name="categoryId" value="CATS" />
            <img src="../images/sm_cats.gif" alt="Cats" />
        </stripes:link>
        <img src="../images/separator.gif" alt="" />
        
        <stripes:link beanclass="org.mybatis.jpetstore.web.actions.CatalogActionBean" event="viewCategory">
            <stripes:param name="categoryId" value="BIRDS" />
            <img src="../images/sm_birds.gif" alt="Birds" />
        </stripes:link>
    </div>

</div>

<div id="Content"><stripes:messages />
