
--inside windows or cmd line
1. install latest 64 bit python, default setup
2. update pip
3. setup path to python dir / scripts mine was "C:\Users\XYZ\AppData\Roaming\Python\Python312\Scripts"
via environment variables for the account/system
4. new terminal window
5. pip install waitress
6. pip install bottle
7. pip install peewee, & install anything python hints when step 10 fails 
8. go to this project folder, where you have unzipped, say/like c:\tools\prj5 via terminal/cmd
9. now run py or python serve.py
10. if it executes without any error, open browser http://localhost:8080
11. you can extend this to internet, by using remotedesktop or xrdp/vnc any free or even google remotedesktop. as there is no login provided on purpose in the webapp prototype.
12. btw, inventory file is the database, sqlite one. you can also explore it using drag-drop on "DB Browser for SQLite", but do not delete using this unless you are testing from scratch 

-- inside the webapp
1. add items
2. add items to stock
3. add orders using stock/item combination
4. print bill / order
5. no auto update of stock is implemented now, you do have to do that manually*** using edit stocks
6. you can download stock as csv. 
7. no mechanism to track cash inflow, credits or outward / supplier orders
8. Not tested yet !! welcome to test and comment.



nizam
2024.06.14

shout-out to makers of Chatgpt3.5/4, notepad++, python 3, Win 11, peewee, sqlite in particular, 

