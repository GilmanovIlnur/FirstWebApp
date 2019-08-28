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
        <div class="form-group">
            <label for="formGroupExampleInput">Новое имя</label>
            <input name="name" type="text" value="${user.name}" class="form-control" id="formGroupExampleInput" >
        </div>
        <div class="form-group">
            <label for="formGroupExampleInput2">Новая фамилия</label>
            <input name = "lastName" type="text" value="${user.lastName}" class="form-control" id="formGroupExampleInput2" >
        </div>
        <button type="submit" class="btn btn-primary">Изменить</button>


</form>

</@c.page>