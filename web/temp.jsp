<%@ page
        import="javax.naming.Context, javax.naming.InitialContext, javax.sql.DataSource, java.sql.Connection, java.sql.ResultSet, java.sql.SQLException, java.sql.Statement, javax.naming.NamingException" %><%--
  Date: 2020-07-07
  Time: 오후 4:53
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%!
    private static Connection getConnection() throws NamingException, SQLException {
        Context initCtx = new InitialContext();
        Context envCtx = (Context) initCtx.lookup("java:/comp/env");
        DataSource dataSrc = (DataSource) envCtx.lookup("oracleConnInfo");
        return dataSrc.getConnection();
    }

    public static String man(Connection conn) {
        String m = null;
        try {
            String sql = "SELECT SYSDATE FROM DUAL";
            Statement stmt = null;
            ResultSet rs = null;

            try {
                stmt = conn.createStatement();
                rs = stmt.executeQuery(sql);

                if (rs.next()) {
                    m = rs.getString(1) + "</h1>";
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            conn.close();//종료가 아닌 반환
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return m;
    }
%>
<%
    try {
        out.print(man(getConnection()));
    } catch (NamingException e) {
        e.printStackTrace();
    } catch (SQLException throwables) {
        throwables.printStackTrace();
    }
%>
이 자리에는 메인 페이지를 위한 컨테이너가 자리잡을 것.