package com.peas.test;

import java.sql.*;

public class JDBC_Connection {

    public static void main(String[] args) {
        try {
            Class.forName("org.mariadb.jdbc.Driver");//指定连接类型
            Connection connection = DriverManager.getConnection("jdbc:mariadb://localhost:3306/peas_interest?user=root&password=satan");
            PreparedStatement preparedStatement = connection.prepareStatement("select password from account where name = 'satan'");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String pwd = resultSet.getString("password");
                System.out.println(pwd);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
