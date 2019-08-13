<#import "parts/common.ftl" as c>
<#import "parts/log.ftl" as l>
<#import "parts/nav.ftl" as n>
<@c.page>
    <style>

        label {
            color: #ff7c2b;
            font-family: 'DejaVu Serif', Georgia, "Times New Roman", Times, serif;
            float: left;
        }
        .container{
            margin-top: 50px;
            font-family: 'Poppins', sans-serif;
            margin-left: 40%;
            align-items: center;
            float: left;
            text-align: center;

        }
        .main {
            letter-spacing: 3px;
            margin: 0px;
            width: 100%;
            height: border-box;
            color: black;
            font-family: 'Poppins', sans-serif;
            font-size: 20px;
        }
        a{
            font-size: 20px;
            font-family: 'Poppins', sans-serif;
            letter-spacing: 3px;
        }
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