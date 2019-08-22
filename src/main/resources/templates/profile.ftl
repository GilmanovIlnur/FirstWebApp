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
            align: center;
            letter-spacing: 3px;
        }
        img{
            width: 25px;
            height: 25px;
        }
        li.welcome{
            color: #ff7c2b;
        }
        #block{
            box-shadow: 0 0 2px 1px darkgray;
            margin-top: 10px;
            font-family: 'Poppins', sans-serif;
            width: 50%;
            height: 500px;
            float: left;
        }
        div.messages{
            width: 500px;
            height: 500px;
            margin-left: 50px;
        }
        div.block2{
            box-shadow: 0 0 2px 1px darkgray;
            width: 50%;
            height: 500px;
            float: left;
        }
        .subs{
            padding-top: 5px;
            text-align: center;
            float: left;
            width: 50%;
            height: 50px;
        }
        .block3{
            width: 100%;
            height: 100px;

        }
        .log-img{
            padding: 15px;
        }

    </style>
<@n.nav>
    <ui class="links">
        <li class="welcome">
            Welcome,  ${user.login}!
        </li>
        <li>
            <a href="/profile/changePassword/${user.id}">Сменить пароль</a>
        </li>
        <li>
            <a href="/logout">Выйти<a>
        </li>
    </ui>
</@n.nav>
    <div id="block">
        <div class="block2">
            <div class="block3">
                <ui>
                    <li>
                        <a href="/profile">Моя Страница</a>
                    </li>
                    <li>
                        <a href="/profile/users/${user.id}">Редактировать профиль</a>
                    </li>
                <#if isAdmin>
                    <li>
                        <a href="/profile/users">Список пользователей</a>
                    </li>
                </#if>
                </ui>
            </div>

        </div>
        <div class="block2">
            <div class="subs">
                <strong>Подписчики: ${subscribers?size}</strong>
            </div>
            <div class="subs">
                <strong>Подписки: ${subscriptions?size}</strong>
            </div>
            <div class="log-img">
                Скоро будет возможность загрузить карточку пользователя. Разработчики
                работают над этим.
            </div>

        </div>
    </div>

    <div id="block">
        <div class="messages">
        <form method="post" action="/add">
            <input name="message" type="text" placeholder="Что у вас нового?">
            <input type="submit" value="Добавить">
        </form>
        <#if (messages)?size != 0>
            <div>
                <table id="users">
                    <tr>
                        <th>TIME</th>
                        <th>Text</th>

                    </tr>
                        <#list messages as message>
                    <tr>
                        <td>
                            <#if message.getCreationTime()??>
                                ${message.getCreationTime()}
                            <#else >
                                Дата добавления неизвестно.
                            </#if>
                        </td>
                        <td>${message.text}</td>
                        <td>
                            <form method="post" action="/delete/${message.id} ">
                                <input type="submit" value="X" >
                            </form>
                        </td>
                    </tr>
                        </#list>
                </table>
            </div>
        <#else>
            <div>
                Список сообщений пуст.
            </div>
        </#if>
        </div>
    </div>

</@c.page>
