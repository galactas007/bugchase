<%@ page import="java.sql.*"%>

<%
String s=request.getParameter("val");
if(s==null || s.trim().equals("")){
out.print("Please enter id");
}else{
int id=Integer.parseInt(s);
out.print(id);
try{
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bugchase","root","natasha");
PreparedStatement ps=con.prepareStatement("select * from register_user where user_id=?");
ps.setInt(1,id);
ResultSet rs=ps.executeQuery();
while(rs.next()){
// out.print(rs.getInt(11)+" "+rs.getString(3));
	out.print(" "+rs.getString(3));
}
con.close();
}catch(Exception e){e.printStackTrace();}
}
%>