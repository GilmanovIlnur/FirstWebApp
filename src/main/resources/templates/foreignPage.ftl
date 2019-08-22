<#import "parts/common.ftl" as c>
<#import "parts/nav.ftl"as n>
<@c.page>
    <@n.nav>
    <h3>В гостях у ${user.getLogin()}</h3>
    <ui class="links">
        <li>
            <a href="/profile">Профиль</a>
        </li>
        <li>
            <a href="/logout">Выйти<a>
        </li>
    </ui>
    </@n.nav>
<style>
    .submit{
        margin: 20px;
        padding: 0;
    }
</style>
<div class="submit">
    <form action="/user/${user.id}" method="post">
        <input type="submit" value="Подписаться">
    </form>

</div>
</@c.page>