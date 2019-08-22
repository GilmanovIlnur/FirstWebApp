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
<div>
    <table id="users">
        <tr>
            <th>Username</th>
            <th>Name</th>
            <th>LastName</th>


        </tr>
                    <#list users as user>
                <tr>
                    <td><a href="/user/${user.id}">${user.login}</a></td>
                    <td>${user.name}</td>
                    <td>${user.lastName}</td>
                    <td>
                        <a href="/profile/users/${user.id}">Edit</a>
                    </td>

                </tr>
                    </#list>
    </table>
</div>

</@c.page>