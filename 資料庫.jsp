<%@ page contentType="text/html" %>
<%@ page import="java.sql.*" %>
<%
request.setCharacterEncoding("Big5");

//　接從from所送來的”帳號值”
String user_id = request.getParameter("user_id");
if(user_id == null) {
user_id = "";
}

//　接從from所送來的”密碼值”
String password = request.getParameter("password");
if(password == null) {
password = "";
}

//　會員名稱
String name = "";
%>


<html>

<head><meta http-equiv="Content-Type" content="text/html; charset=big5" /></head>

<body>

<%
/*******　重點 ********/
String sql = "select * from account where user_id='" user_id "' and password='" password "'";

Connection con = null;
try {

/********　以　mysql　database　server　來測試　********/
Class.forName("org.gjt.mm.mysql.Driver");
con = DriverManager.getConnection("
jdbc:mysql://localhost/test?user=root&password=zxc60061&useUnicode=true&characterEncoding=big5");
PreparedStatement pstmt = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);

ResultSet rs = pstmt.executeQuery();

//　若登入成功，則秀出　會員名稱
//　否則重新登入
if(rs.next()) {
name = rs.getString("name");
%>
你好 ~ "<%=name%>"
<%
} else {
%>
<script language="javascript">
alert("帳號密碼有誤，請重新登入");
location.href = "http://zxc10227151.github.io/test3.";
</script>
<%
} //end if


} catch(Exception e) {
out.println(e);
} finally {
if(con != null) {con.close();}
}
%>

</body>
</html>