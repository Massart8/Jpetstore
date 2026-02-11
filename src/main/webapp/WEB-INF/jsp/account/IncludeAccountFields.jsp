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
<h3>Account Information</h3>

<table>
    <thead>
        <tr>
            <th scope="col">Information Field</th>
            <th scope="col">Input Details</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <th scope="row">First name:</th>
            <td><stripes:text name="account.firstName" /></td>
        </tr>
        <tr>
            <th scope="row">Last name:</th>
            <td><stripes:text name="account.lastName" /></td>
        </tr>
        <tr>
            <th scope="row">Email:</th>
            <td><stripes:text size="40" name="account.email" /></td>
        </tr>
        <tr>
            <th scope="row">Phone:</th>
            <td><stripes:text name="account.phone" /></td>
        </tr>
        <tr>
            <th scope="row">Address 1:</th>
            <td><stripes:text size="40" name="account.address1" /></td>
        </tr>
        <tr>
            <th scope="row">Address 2:</th>
            <td><stripes:text size="40" name="account.address2" /></td>
        </tr>
        <tr>
            <th scope="row">City:</th>
            <td><stripes:text name="account.city" /></td>
        </tr>
        <tr>
            <th scope="row">State:</th>
            <td><stripes:text size="4" name="account.state" /></td>
        </tr>
        <tr>
            <th scope="row">Zip:</th>
            <td><stripes:text size="10" name="account.zip" /></td>
        </tr>
        <tr>
            <th scope="row">Country:</th>
            <td><stripes:text size="15" name="account.country" /></td>
        </tr>
    </tbody>
</table>

<h3>Profile Information</h3>

<table>
    <thead>
        <tr>
            <th scope="col">Setting</th>
            <th scope="col">Selection</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <th scope="row">Language Preference:</th>
            <td><stripes:select name="account.languagePreference">
                <stripes:options-collection collection="${actionBean.languages}" />
            </stripes:select></td>
        </tr>
        <tr>
            <th scope="row">Favourite Category:</th>
            <td><stripes:select name="account.favouriteCategoryId">
                <stripes:options-collection collection="${actionBean.categories}" />
            </stripes:select></td>
        </tr>
        <tr>
            <th scope="row">Enable MyList</th>
            <td><stripes:checkbox name="account.listOption" /></td>
        </tr>
        <tr>
            <th scope="row">Enable MyBanner</th>
            <td><stripes:checkbox name="account.bannerOption" /></td>
        </tr>
    </tbody>
</table>
