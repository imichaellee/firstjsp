<%@ page language="java" import="java.util.*, java.sql.Connection, java.sql.DriverManager, java.sql.Statement, java.sql.ResultSet, firstjsp.Login" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%

Enumeration<String> RequestParaNames = request.getParameterNames();
String id ="",name="",age="",address="",salary="",action="",tableaction="",LoginID="",LoginPW="",grade="",score="",course="",department="";
//String name,age,address,salary,action,tableaction,LoginID,LoginPW =" ";
for( Enumeration e = RequestParaNames; e.hasMoreElements();){
	String thisParaName = e.nextElement().toString();
	//out.println("<br>@@@@@@@@@@@@@@@@@@"+thisParaName+"@@@@@@@@@@@@@@@<br>");
	
	if(thisParaName.equals("ActionOption"))
		action = request.getParameter("ActionOption");
	if(thisParaName.equals("TableOption")){
		tableaction = request.getParameter("TableOption");
		//out.println("<br>@@@@@tableaction@@@@@@@@"+tableaction+"@@@@@tableaction@@@@@<br>");
	}
	if(thisParaName.equals("id"))
		id = request.getParameter("id");
	if(thisParaName.equals("name"))
		name = request.getParameter("name");
	
	if(thisParaName.equals("grade")){

			grade = request.getParameter("grade");

		
	}
	if(thisParaName.equals("score")){

			score = request.getParameter("score");

		
	}
	
	if(thisParaName.equals("dbs_id"))
		LoginID = request.getParameter("dbs_id");
	if(thisParaName.equals("dbs_pw"))
		LoginPW = request.getParameter("dbs_pw");
}

	if(tableaction.equals(new String("teacher"))){
		
		course = grade;
		department = score;
		grade=null;
		score=null;
	}
	
//String result = new String(type.getBytes("utf-8"), "utf-8");      
//out.println(path);out.println(basePath);
/*
out.println("</br>********************</br>the method of request is: "+request.getMethod());
out.println("</br>Your actionoption is "+action+"!!!!!!");
out.println("</br>Your input details:</br>id is "+id);  //here id is id's value input if the request is get 
out.println("</br>name is "+name);
out.println("</br>age is "+age);
out.println("</br>address is "+address);
out.println("</br>salary is</br>********************"+salary);
*/

		
		//Connection c = null;
		//Statement stmt = null;
		String sql  = null;
		String sql_startString = "('";
		String sql_endString = "')";
		String sql_substring = "','";
		
		
		String table=null;
		if(tableaction.equals(new String("student"))){
			table = "student";
			//out.println("yyyyyyyyyyy"+grade+"==="+score+"==="+course+"==="+department);
		}
		if(tableaction.equals(new String("teacher"))){
			table = "teacher";
		}		
	
		int flag = 0;
		if(table.equals("teacher"))flag=1;
		
		//out.println(grade+"==="+score+"==="+course+"==="+department);
		//out.println("<br><br>"+flag+"<br><br>"+table+"<br><br>");
		
		
		//a.TryLogin(LoginID,LoginPW);
		//if(tableaction.equals(new String("yeslogin"))){
		//	out.println(a.TryLogin(LoginID,LoginPW));
		//}
		/*
			Class.forName("org.postgresql.Driver");
			try{
			c=DriverManager.getConnection("jdbc:postgresql:myschool","postgres","0008");
			}catch(Exception e){
				out.println("diao lei lao mou!");
			}
			out.println("CONNECTION SUCCESSUL!");
			stmt=c.createStatement();
		*/	
		Login a = new Login();
		//out.println(tableaction+"---"+action);
		if(true){
			
			a.TryLogin(LoginID,LoginPW);
			a.setID(LoginID);
			a.setPW(LoginPW);
			//out.println("!!!");
		}	
		
//creat	
			if(action.equals(new String("create"))){  //if here is only "add " not work, ==is for name but not content
				if(flag == 0)
					sql="insert into student(id,name,grade,score) values"+sql_startString+id+sql_substring+name+sql_substring+grade+sql_substring+score+sql_endString;
			else
				sql="insert into teacher(id,name,course,department) values"+sql_startString+id+sql_substring+name+sql_substring+course+sql_substring+department+sql_endString;
			}
			
//delete			
			if(action.equals(new String("delete"))){  //if here is only "add " not work, ==is for name but not content
				//out.println("delete!"+action.equals(new String("delete")));
					//if(!id.equals(null))
					if(flag == 0)
					sql = "DELETE from student WHERE id = '"+id+"'";
			else
				sql = "DELETE from teacher WHERE id = '"+id+"'";
			}

//update		
			if(action.equals(new String("update"))){  //if here is only "add " not work, ==is for name but not content
				if(flag == 0)
					sql="update student set name="+"'"+name+"'"+",grade="+"'"+grade+"'"+",score="+"'"+score+"'"+" where id="+"'"+id+"'";
			else	
				sql="update teacher set name="+"'"+name+"'"+",course="+"'"+course+"'"+",department="+"'"+department+"'"+" where id="+"'"+id+"'";

			}

//Search
	String firstLabel="",secondLabel="";
			if(action.equals(new String("search"))){ //if here is only "add " not work, ==is for name but not content				
				if(flag == 0){
					sql = "select name,grade,score from student where id = '"+id+"'";
					firstLabel=new String("Grade");
					secondLabel=new String("Score");
				}
				else{
					sql = "select name,course,department from teacher where id = '"+id+"'";
					firstLabel=new String("Course");
					secondLabel=new String("Department");
				}
				//stmt.executeUpdate(sql);
				ResultSet rs = a.getResultSet(sql);
				while(rs.next()){		//<a style="font-weight:bold;"></a>
					out.println("</br>"+rs.getString(1)+"'s "+firstLabel+" is "+"<a style='font-weight:700;font-size:30px;'>"+rs.getString(2)+"</a>"+"<br>"+rs.getString(1)+"'s "+secondLabel+" is "+"<a style='font-weight:700;font-size:30px;'>"+rs.getString(3)+"</a>");
				}
				
			}

			//out.println("</br>"+sql);
			//Login a = new Login();
			//a.TryLogin("postgres","0000");
			a.exeSql(sql);
		

			//stmt.close();
			//c.close();
		

%>