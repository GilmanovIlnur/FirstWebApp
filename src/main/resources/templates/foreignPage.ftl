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
    td{
        padding: 10px;
        box-shadow: 0 0 5px darkgray;
    }
    .submit{
        text-align: center;
    }

</style>


    <div id="block">
        <div class="block2">
            <div class="block3">
                <ui>
                    <li>
                        <a href="/profile">Моя Страница</a>
                    </li>
                    <li>
                        <a href="/profile/users/${currentUser.id}">Редактировать профиль</a>
                    </li>
                    <li>
                        <a href="/profile/users">Список пользователей</a>
                    </li>
                </ui>
            </div>

        </div>
        <div class="block2">
            <div class="subs">
                <a href="/subscribers/${user.id}"><strong>Подписчики: ${subscribers?size}</strong></a>
            </div>
            <div class="subs">
                <a href="/subscriptions/${user.id}"><strong>Подписки: ${subscriptions?size}</strong></a>
            </div>
            <div class="submit">
                <#if currentUser.subscriptions?seq_contains(user)>
                    <form action="/user/unsubscribe/${user.id}" method="post">
                        <button type="submit" class="btn btn-primary btn-sm">Отписаться</button>
                    </form>
                <#else>
                    <form action="/user/subscribe/${user.id}" method="post">
                        <button type="submit" class="btn btn-primary btn-sm">Подписаться</button>
                    </form>
                </#if>
            </div>

            <div class="log-img">
                Скоро будет возможность загрузить карточку пользователя. Разработчики
                работают над этим.
            </div>

        </div>
    </div>

    <div id="block">
        <div class="messages">

        <#if (messages)?size != 0>
            <div>
                <table id="messages">
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