# test.code
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
public class test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//宣告Connection物件
        Connection con;
        //驅動程式名
        String driver = "com.mysql.jdbc.Driver";
        //URL指向要訪問的資料庫名mydata
        String url = "jdbc:mysql://140.131.114.147:6969/temperature_log?characterEncoding=utf8&useSSL=false";
        //MySQL配置時的使用者名稱
        String user = "root";
        //MySQL配置時的密碼
        String password = "Ihaveadream99!";
        //遍歷查詢結果集
        try {
            //載入驅動程式
            Class.forName(driver);
            //1.getConnection()方法，連線MySQL資料庫！！
            con = DriverManager.getConnection(url,user,password);
            if(!con.isClosed())
                System.out.println("Succeeded connecting to the Database!");
            //2.建立statement類物件，用來執行SQL語句！！
            Statement statement = con.createStatement();
            //要執行的SQL語句
            String sql = "select * from sensor";
            
            //3.ResultSet類，用來存放獲取的結果集！！
            ResultSet rs = statement.executeQuery(sql);


            int count=0;
            		ArrayList <Integer> Idsensor =new ArrayList<Integer>();
            		ArrayList <String> Sensor_Id =new ArrayList<String>();
            		ArrayList <String> Record_time =new ArrayList<String>();
            		ArrayList <String> temperature =new ArrayList<String>();
            		
            while(rs.next()) {
            	Idsensor.add(rs.getInt("Idsensor"));
            	Sensor_Id.add(rs.getString("Sensor_Id"));
            	Record_time.add(rs.getString("Record_time"));
            	temperature.add(rs.getString("Message"));
            	count++;

            }
            for(int i=0;i<count;i++)
            	System.out.println("流水號:"+Idsensor.get(i)+"\t機台編號:"+ Sensor_Id.get(i)+"\t時間:"+Record_time.get(i)+"\t溫度:"+temperature.get(i));
 
            rs.close();
            con.close();
        } catch(ClassNotFoundException e) {   
            //資料庫驅動類異常處理
            System.out.println("Sorry,can`t find the Driver!");   
            e.printStackTrace();   
            } catch(SQLException e) {
            //資料庫連線失敗異常處理
            e.printStackTrace();  
            }catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        }finally{
            System.out.println("資料庫資料成功獲取！！");
        }
    }
	}


