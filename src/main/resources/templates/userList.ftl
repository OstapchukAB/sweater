<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>

<div>
    <@l.logout/>
    <@c.page>
List of users
</div>
    <table xmlns="http://www.w3.org/1999/html">
    <thead>
    <tr>
        <th>Name</th>
        <th>Role</th>
        <th></th>
    </tr>
     </thead>
    <tbody>
    <#list users as user>
    <tr>
        <td>${user.username}</td>
        <td><#list user.roles as role>${role}<#sep>, </#list></td>
        <td><a href="/user/${user.id}">edit</a></td>
    </tr>
    </#list>
    </tbody>
</table>
</@c.page>
