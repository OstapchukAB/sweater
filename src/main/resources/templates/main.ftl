<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>

<@c.page>
<div>
<@l.logout />
</div>
<div>
    <form method="post">
        <input type="text" name="text" placeholder="Введите сообщение"/>
        <input type="text" name="tag" placeholder="Тэг">
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <button type="submit">Добавить</button>
    </form>
</div>


<form method="get" action="/main">
    <input type="text" name="filter" placeholder="Введите тэг" >
    <button type="submit">Найти</button>
</form>

<div>Список сообщений</div>
<div>
<table border="1">
    <tr>
        <th>ID</th>
        <th>TEXT</th>
        <th>TAG</th>
        <th>UserName</th>
    </tr>
<#list messages as message>

    <tr>
    <td>${message.id}</td>
    <td>${message.text}</td>
    <td>${message.tag}</td>
    <td>${message.authorName}</td>
    </tr>

<#else>
<p>No message
</#list>
</table>
</div>
</@c.page>