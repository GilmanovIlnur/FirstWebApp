<#import "parts/common.ftl" as c>
<#import "parts/nav.ftl"as n>

<@c.page>
    <@n.nav>

    </@n.nav>
<h4>${type}</h4>
<table class="table table-striped">
    <thead>
    <tr>
        <th scope="col">Имя пользователя</th>
        <th scope="col">Имя</th>
        <th scope="col">Фамилия</th>
        <th scope="col"></th>
    </tr>
    </thead>
    <tbody>
    <#list subs as sub>
        <tr>
            <td><a href="/user/${sub.id}">${sub.login}</a></td>
            <td>${sub.name}</td>
            <td>${sub.lastName}</td>
            <td>
                <#if currentUser.getSubscriptions()?seq_contains(sub)>
                    <form action="/user/unsubscribe/${sub.id}" method="post">
                        <button type="submit" class="btn btn-primary btn-sm">Отписаться</button>
                    </form>
                <#else>
                    <form action="/user/subscribe/${sub.id}" method="post">
                        <button type="submit" class="btn btn-primary btn-sm">Подписаться</button>
                    </form>
                </#if>

            </td>
        </tr>
    </#list>


    </tbody>
</table>

</@c.page>