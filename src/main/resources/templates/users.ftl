<#import "parts/common.ftl" as c>
<#import "parts/nav.ftl" as n>
<@c.page>
<@n.nav>
    <ui class="links">
        <li>
            <a href="/profile">Профиль</a>
        </li>
        <li>
            <a href="/logout">Выйти</a>
        </li>
    </ui>
</@n.nav>
<table class="table">
    <thead class="thead-light">
    <tr>
        <th scope="col">Имя пользователя</th>
        <th scope="col">Имя</th>
        <th scope="col">Фамилия</th>
        <th scope="col"></th>
    </tr>
    </thead>
    <#list users as user>
        <tbody>
        <tr>
            <td>
                <a href="/user/${user.id}">${user.login}</a>
                <#if currentUser.getSubscriptions()?seq_contains(user)>
                    <form action="/user/unsubscribe/${user.id}" method="post">
                        <button type="submit" class="btn btn-primary btn-sm">Отписаться</button>
                    </form>
                <#else>
                    <form action="/user/subscribe/${user.id}" method="post">
                        <button type="submit" class="btn btn-primary btn-sm">Подписаться</button>
                    </form>
                </#if>
            </td>
            <td>${user.name}</td>
            <td>${user.lastName}</td>
            <#if admin??>
                 <td><a href="/profile/users/${user.id}">Редактировать</a></td>
            </#if>
        </tbody>
    </#list>
</table>

</@c.page>