<#import "parts/common.ftl" as c>
<#import "parts/nav.ftl" as n>
<@c.page>
    <@n.nav>
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
    div.h{
        padding: 0;
        width: border-box;
        height: 25px;
        margin-bottom: 20px;
    }
    h5{
        font-family: 'Poppins', sans-serif;
        letter-spacing: 3px;
        text-align: center;
        font-size: larger;
    }
    div.form{
        width: 200px;
        height: 300px;
        padding: 20px 20px;
        margin: auto;
        background-color: azure;
    }
    input{
        padding: 10px 10 px;
        width: border-box;
        height: 20px;

    }
</style>
<div class="h">
    <h5>Страница изменения пароля.</h5>
</div>
<div>
    <#if condition?has_content>
        <h2>
            ${condition}
        </h2>
    </#if>


</div>
<div class="form">
    <form method="post" action="/profile/changePassword/${user.id}">
        <input type="password" name="oldPassword" placeholder="Старый пароль">
        <br>
        <input name="newPassword" type="password" placeholder="Новый пароль!">
        <br>
        <input type="password" name="repeatedNewPassword" placeholder="Повторите пароль">
        <br>
        <input type="submit" value="Изменить">
    </form>
</div>

</@c.page>