-------------------------------------------------------------------------------------------------------------------

OVERVIEW:

This code will display the following account details of the user:
-Transaction Date
-Amount Paid
-Balance
-Loan Status

It is HTTP API with an endpoint that returns json. Entity framework 
(Code First approach) is used, which is
worked with SQL Server view.
 
-------------------------------------------------------------------------------------------------------------------

ASSUMPTIONS:

-Every payment made, the Balance field will display the outstanding balance of the 
	user on the day of the transaction
-The Loan Status field will display "In Progress" for every payment made until the 
	balance is fully paid, only then it will display "Fully Paid"

-------------------------------------------------------------------------------------------------------------------

REQUIREMENTS:

1. Microsoft SQL Server Management Studio

2. Visual Studio 2019


-------------------------------------------------------------------------------------------------------------------

INSTRUCTIONS ON HOW TO BUILD AND RUN THE CODE

1. Copy the CodingExam database backup file in a location of your preference in your computer.

2. Open Microsoft SQL Server Management Studio and connect to your SQL server.

3. In the Object Explorer, right-click "Databases" then choose "Restore Database".

4. Under the "Source" section, click the button next to "Device" then click the button with 3 dots (ellipses).

5. In the "Select backup devices", press "Add". Locate and Select the CodingExam.bak file then click "OK"

6. Under the "Backup Media" select the newly added backup file then click "OK".

7. Back to "Restore Database" window, click "OK", then click "OK" again when the a pop-up message stating 
	successful restoration shows up.

8. Open Visual Studio 2019 and click "Create a new project". Search for "ASP.NET Web Application (.NET Framework)" 
	for c# then click "Next".

9. Edit the project name and solution name and change the location of your project if you wish. In the "Framework" 
	dropdown-list, select ".NET Framework 4.7.2", then click "Create".

10. In the next window, select "Empty" project template, click the checkbox for "Web API" under the 
	"Add folders & core references", then click "Create". 

11. Once the project is created, go to Solution Explorer located at the right side of the environment. Expand 
	your project, right-click on "Models" folder, hover over "Add", then select "New Item".

12. Click on "Data" under the "Visual C#" section, select "ADO.NET Entity Data Model" then click "Add".
	In the "Entity Data Model Wizard", choose "Code First from database" and click "Next".

13. In the next part of the wizard, click "New Connection", the "Connection Properties" window will appear.
	Type in your server name then select the CodingExam database from the dropdown-list under the
	"Connect to a database" section. Click "OK" then click "Next".

14. Under Views and under dbo, select "vAccountdetails" then click "Finish". The Entity Framework will auto-generate
	code for your Models.

15. Build your project.

16. Right-click on "Controller" folder, select "Add, then choose "Controller". In the "Add New Scaffolded Item" window
	select "Web API", then select "Web API 2 Controller with read/write actions", then click "Add". Rename your
	controller as deemed necessary.

17. As we want to display the details of the user's account, we will use Get method. Here's the syntax for our controller:
	 

  	
    		public class "ControllerName" : ApiController
   		 {
      		  private "ObjectName" db = new "className"();
        
   
       		 public IEnumerable<vAccountDetail> Get()
       		 {
        		    return db."view/tableName";
        		}

        
    		 }

18. For the API to return JSON format, add the followng in App_Start/WebApiConfig.cs class in your project:

		config.Formatters.JsonFormatter.SupportedMediaTypes.Add(new MediaTypeHeaderValue("text/html"));

-------------------------------------------------------------------------------------------------------------------


API ENDPOINT:

Note: Replace placeholder {} with actual value

GET Account Details
https://localhost:{port}/api/account