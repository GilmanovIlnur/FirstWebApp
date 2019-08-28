<#macro login path>
<style>
    .container{
        padding-left: auto;
    }
</style>

<div class="container">
    <form method="post" action="${path}">
        <div class="form-group">
            <label for="formGroupExampleInput">Логин</label>
            <input  name="login" type="text" class="form-control" id="formGroupExampleInput" placeholder="Логин">
        </div>
        <div class="form-group">
            <label for="formGroupExampleInput2">Пароль</label>
            <input name="password" type="password" class="form-control" id="formGroupExampleInput2" placeholder="Пароль">
        </div>
        <button type="submit" class="btn btn-primary">Войти</button>
    </form>
</div>

</#macro>