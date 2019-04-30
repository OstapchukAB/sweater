<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>

<div>
    <div>
        <a href="/main">Main page</a>
    </div>

    <@l.logout/>
    <b>Add new user</b>
    <@c.page>
</div>

    <@l.login "/registration" />
${message}
</@c.page>