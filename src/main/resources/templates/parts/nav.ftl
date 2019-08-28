<#macro nav>
<style>
    body{
        margin: 0;
        padding: 0;
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
        width: 200px;
        height: 100px;
        margin-left: 10px;
        display: flex;
        align-items: center;
        color: #ff7c2b;
        letter-spacing: 5px;
        font-size: 20px;

    }
    img{
        width: 25px;
        height: 25px;
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
    img{
        width: 25px;
        height: 25px;
    }
    li.welcome{
        color: #ff7c2b;
    }
</style>





      <nav>
          <div class="logo">
              <img src="http://www.tsatu.edu.ua/nauka/wp-content/uploads/sites/49/1466703414.png" alt="">
              <h4>ILNURKIN</h4>
          </div>
          <#nested >
      </nav>
</#macro>