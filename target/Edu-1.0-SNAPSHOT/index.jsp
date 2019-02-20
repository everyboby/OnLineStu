<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
<h2>卷标</h2>
<form method="post" action="/selectByPrimaryKey.do">
    <input name="signId" type="text">
    <button type="submit">查询</button>
</form>
<h2>
    ${sessionScope.fromSign.signName}
</h2>
<form method="post" action="/insertSelective.do">
    <input name="signName" type="text">
    <button type="submit">插入</button>
</form>
<form method="post" action="/updateByPrimaryKey.do">
    <input name="signId" type="text" value="1">
    <input name="signName" type="text">
    <button type="submit">修改</button>
</form>

<h2>科目</h2>
<form method="post" action="/selectArtsByPrimaryKey.do">
    <input name="artsId" type="text">
    <button type="submit">查询</button>
</form>
<h2>
    ${sessionScope.fromArts.artsName}
</h2>
<form method="post" action="/insertArtsSelective.do">
    <input name="artsName" type="text">
    <button type="submit">插入</button>
</form>
<form method="post" action="/updateArtsByPrimaryKey.do">
    <input name="artsId" type="text" value="1">
    <input name="artsName" type="text">
    <button type="submit">修改</button>
</form>
<h2>时间</h2>
<form method="post" action="/selectTimeByPrimaryKey.do">
    <input name="fromId" type="text">
    <button type="submit">查询</button>
</form>
<h2>
    ${sessionScope.fromTime.fromTime}
</h2>
<form method="post" action="/insertTimeSelective.do">
    <input name="fromTime" type="text">
    <button type="submit">插入</button>
</form>
<form method="post" action="/updateTimeByPrimaryKey.do">
    <input name="fromId" type="text" value="1">
    <input name="fromTime" type="text">
    <button type="submit">修改</button>
</form>
<h2>用户</h2>
<form method="post" action="/selectByUserName.do">
    <input name="userName" type="text">
    <button type="submit">查询</button>
</form>
<h2>
    ${sessionScope.userinfo.userName}
    ${sessionScope.jsonObject}
</h2>
</body>
</html>
