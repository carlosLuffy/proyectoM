/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package poyectomindustrial;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.swing.JOptionPane;

/**
 *
 * @author carlos o milton
 */
public class Conexion1 {
    
        private String url = "jdbc:mysql://localhost:3306/taller_industrial";
    private String login = "root"; 
    private String password = "";
    private Connection cnx = null;
    private Statement sttm = null;
    private ResultSet rst = null;
    public void UID() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            cnx = DriverManager.getConnection(url, login, password);
            sttm = cnx.createStatement();
            //sttm.executeUpdate(sql); 
            System.out.println("coneccion establecida");
        } catch (ClassNotFoundException c) {
            JOptionPane.showMessageDialog(null, "ERROR: " + c.getMessage());
            System.exit(1); 
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "ERROR: " + e.getMessage());
            System.exit(1);
        }
    }
    
}
