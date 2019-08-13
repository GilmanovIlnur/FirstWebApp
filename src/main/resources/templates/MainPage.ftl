<#import "parts/common.ftl" as c>
<#import "parts/nav.ftl" as n>
<@c.page>

    <style>
        .*{
            margin: 0px;
            padding: 0px;
        }
        nav{
            display: flex;
            justify-content: space-around;
            align-items: center;
            min-height: 10px;
            background-color: #454340;
            font-family: 'Poppins', sans-serif;
        }
        .logo{

            display: flex;
            align-items: center;
            color: #ff7c2b;
            letter-spacing: 5px;
            font-size: 20px;
        }
        .links{
            display: flex;
            justify-content: space-around;
            width: 30%;
        }
        .links a{
            background-color: darkgray;
            font-size: 15px;
            letter-spacing: 3px;
            color: rgba(144,5,0,0.98);
            text-decoration: none;
            font-weight: bold;
        }
        .links li{
            list-style: none;
        }
        h5{
            margin-top: 200px;
            font-family: 'Poppins', sans-serif;
            font-size: 50px;
            letter-spacing: 3px;
        }
        img{
            width: 25px;
            height: 25px;
        }
        div.author{
            height: auto;
            width: auto;
            margin-top: 200px;
            text-align: center;
            font-family: 'DejaVu Serif', Georgia, "Times New Roman", Times, serif;
        }
      
    </style>

    <@n.nav>
        <ui class="links">
            <li>
                <a href="/login">Войти<a>
            </li>
            <li>
                <a href="/registration">Регистрация<a>
            </li>
        </ui>
    </@n.nav>

    <h5><p align="center">Добро пожаловать в ILNURKIN!</p></h5>
    <div class="author">
        <i>
            © Ильнур Гильманов, 2019.
            Связаться с автором: ilnurhero@gmail.com
        </i>
        <br>
        <a href="https://www.instagram.com/ilnur_hr/">
            <img src="https://www.seekpng.com/png/detail/1-13319_instagram-round-corner-png-icon-instagram-instagram-icono.png" alt="" class="instagram">
        </a>
    </div>

</@c.page>
