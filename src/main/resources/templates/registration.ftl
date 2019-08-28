<#import "parts/common.ftl" as c>
<#import  "parts/nav.ftl" as n>

<@c.page>
    <style>
        .message{
            color: black;
            size: 100px;
            font-family:  'DejaVu Serif', Georgia, "Times New Roman", Times, serif;
        }

         .container{
             padding-left: auto;
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
        <div class="form-group">
            <label for="exampleFormControlInput1">Логин</label>
            <input name="login" type="text" class="form-control" id="exampleFormControlInput1" placeholder="Логин">
        </div>

        <div class="form-group">
            <label for="exampleFormControlInput1">Имя</label>
            <input type="text" name="name" class="form-control" id="exampleFormControlInput1" placeholder="Имя">
        </div>

        <div class="form-group">
            <label for="exampleFormControlInput1">Фамилия</label>
            <input type="text" name="lastName" class="form-control" id="exampleFormControlInput1" placeholder="Фамилия">
        </div>

        <div class="form-group">
            <label for="exampleFormControlInput1">Пароль</label>
            <input type="password" name="password" class="form-control" id="exampleFormControlInput1" placeholder="name@example.com">
        </div>
        <button type="submit" class="btn btn-primary">Зарегистрироваться</button>
    </form>
</div>
</@c.page>