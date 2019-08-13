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

<form action="/profile/users/${user.id}" method="post">
    <#if isAdmin??>
        <#list roles as role>
            <label><input type="checkbox" value="${role}" name="roles" ${user.roles?seq_contains(role)?string("checked", "")}>${role}</label>
        </#list>
    </#if>
    <input type="text" name="name" placeholder="Новое имя" value="${user.name}">
    <input type="text" name="lastName" placeholder="Новая Фамилия" value="${user.lastName}">
    <input type="submit" value="Сохранить">
</form>

</@c.page>