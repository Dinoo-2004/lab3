/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package newpackage;
import java.sql.*;
/**
 *
 * @author Dinoo
 */
public class UserDatabase {
    Connection con;
    
    public UserDatabase(Connection con){
        this.con=con;
    }
    
   public boolean saveUser(User user){

    boolean set = false;

    try{

        System.out.println("Bat dau insert");

        String query = "insert into `user`(name,email,password) values(?,?,?)";

        PreparedStatement pt = this.con.prepareStatement(query);

        pt.setString(1, user.getName());
        pt.setString(2, user.getEmail());
        pt.setString(3, user.getPassword());

        int row = pt.executeUpdate();

        System.out.println("Insert thanh cong: " + row);

        set = true;

    }catch(Exception e){

        System.out.println("LOI SAVE USER");
        e.printStackTrace();

    }

    return set;
}
    
    
    public User logUser(String name){
        User usr=null;
        try{
            String query="select * from user where name=?";
            PreparedStatement pst=this.con.prepareStatement(query);
            pst.setString(1, name);
            ResultSet rs=pst.executeQuery();
            
            if(rs.next()){
                usr=new User();
                usr.setId(rs.getInt("id"));
                usr.setName(rs.getString("name"));
                usr.setEmail(rs.getString("email"));
                usr.setPassword(rs.getString("password"));
        
            }
            
        } catch(Exception e){
            System.out.println("Lỗi saveUser:");
            e.printStackTrace();
        }
        return usr;
    }
}
