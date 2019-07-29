How to install DJI Assistant 1.1.2 and enable debug mode 
Windows

1. Make sure to uninstall any other version of Assistant 2 you already have installed(you can always reinstall later if needed.) 
	* To uninstall, click START or Windows button>settings>apps and features>
	* Then find DJI Assistant 2 and uninstall 

2. Open the enclosed windows installer and open the program. 
	*follow the instructions in the windows installer. 
	* This process takes but a few moments 

3. Go to your file explorer and find your C: drive
	*open your C: drive and find 
	-Program Files (x86)>
	-DJI Product>
	-Assistant 2>
	-AppFiles >

4. In the app files folder you will see a document called "main.js" 
	*there is a new "main.js" file included in the same folder as this Readme file that you downloaded. 
	*drag the new main.js file into the app files folder.
	*windows will alert you that there is already a "main.js" file in this location and asks if youd like to replace it. Click yes or replace
	
5. Close Assistant 2 if its running and reopen it. 

6. You'll notice the developer tools window will open automatically 

7. On the top menu bar of the developer tools, to the far right, is "resources" tab
	*You mau need to click the >> button to show all the tabs and one is "resources" 

8. Once in resouces go to the side bar this time and click on the drop down of "local storage" and select file://
	*You will now see two columns "key" and "value"
	*One of the "keys" is "debug" and its "value" is 0

9. Change the "value" of "debug" from 0 to 1 and click enter. 

10. You can now X out of the developer menu and you have debug enabled! 

Notes: 
	*You will need to redo step 9 and 10 each time you restart assistant 2 to re-enable debug mode.
	*Assistant 2 1.1.2 can be used to change parameters, vision calibration, and lots more! 
		-It isnt able to upgrade the firmware of the newest DJI drones however, 
			-So if you need to do that at some point you'll have to install the version meant to work with your device




