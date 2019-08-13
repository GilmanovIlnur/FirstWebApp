<#macro login path>
    <form method="post" action="${path}">
        <div class="field">
            <label>Логин</label>
            <input name="login" type="text">
        </div>
        <br>
        <div class="field">
            <label>Пароль</label>
            <input name="password" type="password">
        </div>
        <br>
        <input type="submit" value="Войти">

    </form>
</#macro>