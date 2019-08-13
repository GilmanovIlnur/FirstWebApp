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
    <input type="text" name="name" placeholder="Новое имя">
    <input type="text" name="lastName" placeholder="Новая Фамилия">
    <input type="submit" value="Сохранить">
</form>

</@c.page>