<%@ page contentType="text/html" %>
<%@ page import="java.sql.*" %>
<%
request.setCharacterEncoding("Big5");

//�@���qfrom�Ұe�Ӫ����b���ȡ�
String user_id = request.getParameter("user_id");
if(user_id == null) {
user_id = "";
}

//�@���qfrom�Ұe�Ӫ����K�X�ȡ�
String password = request.getParameter("password");
if(password == null) {
password = "";
}

//�@�|���W��
String name = "";
%>


<html>

<head><meta http-equiv="Content-Type" content="text/html; charset=big5" /></head>

<body>

<%
/*******�@���I ********/
String sql = "select * from account where user_id='" user_id "' and password='" password "'";

Connection con = null;
try {

/********�@�H�@mysql�@database�@server�@�Ӵ��ա@********/
Class.forName("org.gjt.mm.mysql.Driver");
con = DriverManager.getConnection("
jdbc:mysql://localhost/test?user=root&password=zxc60061&useUnicode=true&characterEncoding=big5");
PreparedStatement pstmt = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);

ResultSet rs = pstmt.executeQuery();

//�@�Y�n�J���\�A�h�q�X�@�|���W��
//�@�_�h���s�n�J
if(rs.next()) {
name = rs.getString("name");
%>
�A�n ~ "<%=name%>"
<%
} else {
%>
<script language="javascript">
alert("�b���K�X���~�A�Э��s�n�J");
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