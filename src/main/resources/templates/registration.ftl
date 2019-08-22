<#import "parts/common.ftl" as c>
<#import  "parts/nav.ftl" as n>

<@c.page>
    <style>
        input{
            border: 2px solid coral;
            padding: 12px 20px 12px 40px;
            text-align: left;
            border-radius: 30px;

        }
        .field{
            clear:both;
            text-align: right;
        }

        label {
            color: #ff7c2b;
            font-family: 'DejaVu Serif', Georgia, "Times New Roman", Times, serif;
            float: left;
        ;
        }
        .container{
            background-color: #FBFBFB;
            float: left;
            padding-left: 500px;
            padding-top: 100px;


        }
        .message{
            color: black;
            size: 100px;
            font-family:  'DejaVu Serif', Georgia, "Times New Roman", Times, serif;
        }
        button{
            color: darkgreen;
            size: 100px;
            border: 2px solid red;
            border-radius: 20px;
        }
    </style>

<@n.nav>
    <ui class="links">
        <li>
            <a href="/">Главная страница</a>
        </li>
        <li>
            <a href="/login">Войти</a>
        </li>
    </ui>
</@n.nav>
<#if message??>
        <div class="message">Пользователь с таким именем уже существует!</div>
</#if>
<div class="container">

    <form method="post" action="/registration">
        <div class="field">
            <label>Логин</label>
            <input name="login" type="text">
        </div>
        <br>
        <div class="field">
            <label>Имя</label>
            <input name="name" type="text">
        </div>
        <br>
        <div class="field">
            <label>Фамилия</label>
            <input name="lastName" type="text">
        </div>
        <br>

        <div class="field">
            <label>Пароль</label>
            <input name="password" type="password">
        </div>
        <br>
        <button name="button" type="submit">Зарегистрироваться</button>
    </form>
</div>

</@c.page>