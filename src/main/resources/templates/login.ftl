<#import "parts/common.ftl" as c>
<#import "parts/log.ftl" as l>
<#import "parts/nav.ftl" as n>
<@c.page>
    <style>



    </style>
<@n.nav>
    <ui class="links">
        <li>
            <a href="/">Главная страница</a>
        </li>
        <li>
            <a href="/registration">Регистрация</a>
        </li>
    </ui>
</@n.nav>
<div class="main">
    <p align="center">Приветствуем Вас! Войдите в систему или зарегистрируйтесь.
</div>
<div class="container">
    <@l.login "/login" />
</div>

</@c.page>