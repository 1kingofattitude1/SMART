
<%@page language="java" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.io.*"%>
<%@ page language="java" import="java.util.*"%>
<%@ page language="java" import="DatabaseConnector.OPENDATABASE"%>
<%@ page language="java" import="javax.servlet.http.HttpSession"%>
<%@ page language="java" import="java.sql.*"%>
<%@ page language="java" import="javax.servlet.*"%>
<%@ page language="java" import="javax.servlet.http.*"%>




<%!
public String quote="";
public String primary_key="";
HttpSession session=null;
Connection com=null;
String img="";
Float bmi;
String emaill,first_name,last_name,gender,age,dob_day,dob_month,dob_year,height,weight;
		
%>


<%
String quotes_array[]={"Always laugh when you can  it is cheap medicine.","Let food be thy medicine and medicine be thy food.","The art of medicine consists of amusing the patient while nature cures the disease.","Declare the past  diagnose the present  foretell the future.","The life so short  the craft so long to learn.","music isn't just music- its medicine.","Life is the art of drawing without an eraser.","Keep your best wishes  close to your heart and watch what happens","A fit  healthy body—that is the best fashion statement","Healthy citizens are the greatest asset any country can have.",""};
		Random random=new Random();
		int index=Math.abs(random.nextInt(quotes_array.length-1));
		quote = quotes_array[index];
		
%>

<%



		primary_key=request.getSession().getAttribute("email").toString();
		System.out.println("Primary key  -> "+primary_key);
		OPENDATABASE OD=new OPENDATABASE();
		com=OD.getDbConnection();
		Statement stmt=com.createStatement();
		String query="SELECT * from smart_table where email="+ ("'"+primary_key+"'");
		System.out.println("Query -> "+query);
        ResultSet rss=stmt.executeQuery(query);
		try
		{
        while(rss.next())
	        {
	        	
	        	emaill=rss.getString("email");
	        	first_name=rss.getString("first_name");
	        	last_name=rss.getString("last_name");
	        	gender=rss.getString("gender");
	        	age=rss.getString("age");
	        	dob_day=rss.getString("dob_day");
	        	dob_month=rss.getString("dob_month");
	        	dob_year=rss.getString("dob_year");
	        	height=rss.getString("height");
	        	weight=rss.getString("weight");
	        	//System.out.println("Email and password fetched -> "+emaill+" -> " +passwordd);	
	        }
	        if(gender.equalsIgnoreCase("male"))
	        	img="'"+"../image/user_logo.png"+"'";
	        else
	        	img="'"+"../image/female_user_logo.png"+"'";
		}
	    catch(Exception e)
	    {
	    	System.out.println("From Profile.jsp : "+e);
	    }
	   	stmt.close();
	    rss.close();
	    OD.DB_CLOSER(com);

%>

<html>
<head>
	<link rel="stylesheet" href="../css/w3.css"> 
	<link rel="stylesheet" href="../css/bootstrap.min.css">
	<link rel="stylesheet" href="../css/w3-colors-flat.css">
	<link rel="stylesheet" href="../css/w3-colors-metro.css">
	<link rel="stylesheet" href="../css/w3-colors-win8.css">
<link href="https://fonts.googleapis.com/css?family=Alfa+Slab+One" rel="stylesheet">
	<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-colors-win8.css">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-colors-flat.css">
	<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-colors-metro.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <style>

    .hover-class
    {
    	color: white;
    }
    .hover-class:hover
    {
    	color: grey;
    }
	</style>
 </head>
 <body class="w3-container" scroll="no" style="overflow: hidden;">
 <div class="w3-container w3-display-middle w3-white w3-card-4  w3-mobile" style="width: 90%;height: 90%;position: fixed;">
<div style="width:80%;;height:36%;opacity: 0.6" class="w3-container w3-mobile w3-card-4 w3-win8-cyan w3-display-topright w3-allerta">
	
	<div class="w3-container w3-panel w3-display-middle w3-mobile" style="background-color: transparent;width: 100%;height:80%">
	    <span style="font-size:160px;line-height:0.6em;opacity:0.7">&#10077</span>
	    <p class="w3-xxlarge w3-display-middle w3-mobile" style="background-color: transparent;width:80%;font-family:cursive;font-weight: bolder;"><i><% out.write(quote); %></i></p>
  </div>
  <div class="w3-container w3-display-middle w3-mobile " style="opacity:0.15;width: 90%;z-index: -1">
  	<center><font class="w3-wide" style="font-size: 140px;font-family: alfa Slab One,cursive;">S   M   A   R   T
  			<center><font class="" style="font-size: 20px;font-family: cursive;">(Simple Medical Assistant For Rapid Treatment)
  	</font></center>
  	</font>

  </center>
  </div>

</div>


<div style="width:80%;z-index-1;height:64%;z-index: -2;" class=" w3-container w3-mobile w3-card-4 w3-white w3-display-bottomright">

	<table border="1" class="w3-display-topmiddle w3-mobile w3-card-4" style="border: none;margin-top: 3%;border-collapse:collapse;width:99%;">
		<tr style="border-top: transparent;border-left: transparent;">
			<td style="text-align: center;">
				<font class="w3-text-gray w3-opacity-min w3-mobile w3-xxlarge">Gender</font>
					<br>
					<font class="w3-text-gray w3-opacity-min w3-mobile w3-xlarge"><% out.write(gender); %></font><br><br>
					<br>

			</td>
			<td style="text-align: center;width:600;border-right: transparent;">
								<font class="w3-text-gray w3-opacity-min w3-mobile w3-xxlarge">Age</font>
					<br>
					<font class="w3-text-gray w3-opacity-min w3-mobile w3-xlarge"><% out.write(age); %></font><br><br><br>
			</td>
		</tr>
		<tr style="border-bottom: transparent;border-left: transparent;">
			
			<td style="text-align: center">
				<br><br>
								<font class="w3-text-gray w3-opacity-min w3-mobile w3-xxlarge">Email</font>
					<br>
					<font class="w3-text-gray w3-opacity-min w3-mobile w3-large"><% out.write(emaill); %></font><br><br>
			</td>


			<td style="text-align: center;border-right: transparent;">
				
				<center>
					<br><br><table border="0">
					<tr>
						<td style="text-align: center" >
					<font class="w3-text-gray w3-opacity-min w3-mobile w3-xxlarge">Weight</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<br>
					<font class="w3-text-gray w3-opacity-min w3-mobile w3-large"><% out.write(weight); %> Kg</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br><br>
					
						</td>
					<td style="text-align: center">
					<font class="w3-text-gray w3-opacity-min w3-mobile w3-xxlarge">Height</font>
					<br>
					<font class="w3-text-gray w3-opacity-min w3-mobile w3-large"><% out.write(height); %> m</font><br><br>
					</td>
					</tr>
				</table></center>

			</td>
		</tr>
		
	</table>

	<table border="0" class="w3-mobile w3-display-bottomleft" style="width:100%;text-align: center;">
		<tr>
			<td style="text-align: center;width: 400px">
								<font class="w3-text-black w3-opacity-min w3-mobile w3-jumbo">BMI  </font><font class="w3-text-black w3-opacity-min w3-mobile w3-xxlarge"><% 


								bmi= (Float.parseFloat(weight)/Float.parseFloat(height) );
								out.write(Float.toString(bmi));//Float.toString( Math.round(bmi*100)/(float)100)); 


								%>kg/m<sup>2</sup></font>
					<br>
					<font class="w3-text-gray w3-opacity-min w3-mobile w3-large">(Body mass Index)  </font><br><br>
			</td>
			<td style="text-align: left">
				<font class="w3-text-black w3-opacity-min w3-mobile w3-xlarge" style="font-family: cursive;">

					<%

					bmi= (Float.parseFloat(weight)/Float.parseFloat(height) );
					if(bmi<19)
						out.write("Your BMI indicates you are Underweight");
					else if(bmi>19 && bmi<24)
						out.write("Congrat's Your BMI indicates you are Healthy");
					else if(bmi>25 && bmi<30)
						out.write("Your BMI indicates Overweight");
					else if(bmi>30 && bmi<39)
						out.write("Your BMI indicates Obesity");
					else if(bmi>40)
						out.write("Your BMI indicates Extreme Obesity");

						%> </font>
			</td>
		</tr>
		
	</table>
</div>






 <div class="w3-container w3-display-leftmiddle  w3-mobile w3-win8-cobalt w3-card-4 w3-display-left" style="width: 20%;height: 100%;">
 	<table border="0" class="w3-display-topmiddle w3-mobile" style="border-collapse:collapse;width:100%">
 		<tr>
 		<td >
 			<center><div class="w3-container  w3-mobile" style="background-color: transparent; ;width: 100%;height: 100%">
 				<% out.write("<img src="+img+" class='w3-image w3-mobile' width='230' height='200'>"); %>
 			</div>
 			</center>
 			
 		</td>
 	</tr>
 	<tr>
 		<td style="text-align: center;">
 			<br>
 			<label class="w3-text-white w3-mobile">
 				<font class="" style="font-size:30;border-right: 100%">&#9728;</font><%
 				if((first_name+last_name).length()>13)
 					out.write("<font class='w3-large w3-mobile'>"+first_name+" "+last_name+"</font>");
 				else
 					out.write("<font class='w3-xlarge w3-mobile'>"+first_name+" "+last_name+"</font>"); 
 				%></font>
 			</label>
 		</td>
 	</tr>
 	<tr>
 		<td style="text-align: center;">
 			<font class="w3-small w3-mobile w3-text-white"><% out.write(dob_month+","+dob_day+","+dob_year); %></font>
 		</td>
 	</tr>
 	<tr>
 		<td style="text-align: center;">
 			<br>
 			<br>
 			<a href="../index.html" style="text-decoration: none">
	 			<center><div class="w3-mobile w3-card-4 w3-container w3-xxlarge  w3-btn w3-ripple w3-round-large w3-light-blue" style="width: 50%;height:35px;">
	 				<center><font class="w3-xlarge w3-mobile w3-text-white hover-class" style="font-family: alfa Slab One,cursive;">Home</font></center>
	 			</div></center>
	 		</a>
 		</td>
 	</tr>
 	<tr>
 		<td style="text-align: center;">
 			<br>
 			<br>
 			 	<a href="about.html" style="text-decoration: none">
	 			<center><div class=" w3-mobile w3-container w3-card-4 w3-xxlarge  w3-btn w3-ripple w3-round-large w3-light-blue" style="width: 50%;height:35px;">
	 				<center><font class=" w3-mobile w3-xlarge w3-text-white hover-class" style="font-family: alfa Slab One,cursive;">About</font></center>
	 			</div></center>
	 		</a>
 		</td>
 	</tr>
 		<tr>
 		<td style="text-align: center;">
 			<br>
 			<br>
 					 <center>
 					 <form action="http://localhost:8080/SMART/logout" action="GET">
 					 	<input type="submit" name="submit" value="Logout" class="w3-text-white w3-mobile w3-container w3-xlarge w3-card-4  w3-btn  w3-ripple w3-round-large w3-light-blue" style="border:0;width: 50%;height:35px;font-family: alfa Slab One,cursive;font-size: 20px">
	 				</form>	
	 				</center>
 		</td>
 	</tr>
 	</table>

 	<div class="w3-mobile w3-display-bottommiddle w3-container  w3-metro-darken w3-opacity-min" style="width:100%">
 		<label style="font-size: 13px;">
 			Copyright <sup>  <font style="font-size: 13"> &copy </font></sup>
 		</label><br>
 				<label style="font-size: 11px;"> SMART<sup><font style="font-size: 13">&trade;</font></sup> is made for medical help and simulation only </label>
 		
 	</div>
 </div>






</div>
 </body>
 </html>
