## podstats

Every Podcaster want to see the downloads for each episode and some other metrics.<br>
"podstats" is an attempt to realize a simple dashboard for metrics about your podcast.<br>
<br>
### sortlogs.sh
The script filter your Server Access Logs and just keep the relevant entries.<br>

"200" - successful download<br>
"232323" - Filesize of the Episode in byte for a full download<br>

Just create a folder-structure like the following:

.count.sh
.sortlogs.sh
/podstats
/podstats/logs
/podstats/new_logs

The "logs" folder contains the 'master.log' and a logfile for each episode i.e. 'episode0.log'<br>
The "new_logs" folder contains your new server access log file.

Start the script:<br>

$> sh sortlogs.sh

<br>
The script looks for existing log files and for new logfiles.<br>
You have to type in your new log file and follow the instructions on the screen.<br>
<br>
When the "sortlogs.sh" stops start the count.sh.
<br>
The "count.sh" starts [GoAccess](https://goaccess.io), a Opensource Log File analyzer with a HTML dashboard.
<br>
![alt text](https://github.com/nerdbude/podcast/blob/master/images/dashboard.png "dashboard")

Have fun with your stats!
