package Controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import com.sun.corba.se.spi.orbutil.fsm.Guard.Result;

public class ConnectDB {
	static Connection con = null;
	static Statement s = null;
	static ResultSet result = null;
	
	private static Connection ConnectDB(){
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con =   (Connection) DriverManager.getConnection("jdbc:mysql://localhost/company" +
					"?autoReconnect=true&useSSL=false&user=root&password=root");	
		} catch (Exception e) {
			// TODO: handle exception
		}
		return con;
	}
	public static ResultSet ShowData(){
		try {
			s = ConnectDB().createStatement();
			String sql = "SELECT * FROM Employee";
			result = s.executeQuery(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public static ResultSet getStaff(String name){
		try {
			s = ConnectDB().createStatement();
			String sql = "SELECT * FROM Employee WHERE Name ='"+name+"'";
			result = s.executeQuery(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public static ResultSet getManager(String idTeam){
		try {
			s = ConnectDB().createStatement();
			String sql = "SELECT * FROM Team WHERE idTeam ='"+idTeam+"'";
			result = s.executeQuery(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public static ResultSet getType(String idEmplyee){
		try {
			s = ConnectDB().createStatement();
			String sql = "SELECT * FROM Employee WHERE ID ='"+idEmplyee+"'";
			result = s.executeQuery(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public static ResultSet SearchByID(int idEmplyee){
		try {
			s = ConnectDB().createStatement();
			String sql = "SELECT * FROM Employee WHERE ID ='"+idEmplyee+"'";
			result = s.executeQuery(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public static boolean  InsertDate(String name,String email,int type,int team){
		try {
			s = ConnectDB().createStatement();
			String sql = "insert into Employee (Name, Email, Type, idTeam)"
			        + " values ('"+name+"','"+email+"',"+type+","+team+")";
			 int insert = s.executeUpdate(sql);
			 if(insert > 0){
				return InsertTeam(name);
			 }
				
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	public static boolean InsertTeam(String name){
		try {
			s = ConnectDB().createStatement();
			String sql = "SELECT * FROM Employee WHERE Name = '"+name+"'";
			result = s.executeQuery(sql);
			String idUSer = null;
			String idTeam = null;
			while(result.next()){
				idUSer = result.getString("ID");
				idTeam = result.getString("idTeam");
			}
			String sql2 = "insert into team (Idteam, IdEmployee)"
			        + " values ("+idTeam+","+idUSer+")";
			 int insert2 = s.executeUpdate(sql2);
			 if(insert2 > 0){
				 return true;
			 }
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	public static boolean UpdateDate(int id,String name,String email,int type,int team){
		try {
			s = ConnectDB().createStatement();
			String sql = "UPDATE Employee SET Name ='"+name+"'"+ ",Email = '"+email+"'"+ ",Type ="+type+",idTeam ="+team+" WHERE ID = "+id+"";
			int update = s.executeUpdate(sql);
			if(update > 0){
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

		
}
