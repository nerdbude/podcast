## podstats

Every Podcaster want to see the downloads for each episode and some other metrics.<br>
"podstats" is an attempt to realize a simple dashboard for metrics about your podcast.<br>
<br>
### sortlogs.sh
The script filter your Server Access Logs for the relevant entries.<br>
Just create a folder-structure like the following:
/podstats
  - logs
  - new_logs

The "logs" folder contains the 'master.log' and a logfile for each episode i.e. 'episode0.log'<br>
The "new_logs" folder contains your new server access log file. 

Start the script:<br>

```$> sh sortlogs.sh```

<br>
The script looks for existing log files and for new logfiles.<br>
You have to type in your new log file and follow the instructions on the screen.<br>
<br>
Note:<br>
You have to edit the .sh file with your paths and names.<br>


