
Project: 0x19. Postmortem
-------------------------
_______________________________________________________________________________________________________________________________________________________________
ALX System Engineering & DevOps Project Outage Postmortem

Issue Summary:

Duration: November 11, 2023, 06:00 - 19:20 (WAT)
Impact: Outage on an isolated Ubuntu 14.04 container running Apache, causing 500 Internal Server Errors for GET requests.
Root Cause: Typo in wp-settings.php led to an attempt to load a non-existent file, class-wp-locale.phpp.
Timeline:

06:00 WAT: Project 0x19 released, triggering an outage on the Apache server.
19:20 PST: Brennan (BDB) detected the issue and initiated the debugging process.
Step 1: Checked running processes with ps aux - identified two apache2 processes (root and www-data).
Step 2: Inspected /etc/apache2/sites-available/ - server serving content from /var/www/html/.
Step 3: Ran strace on root Apache process PID, no useful information obtained.
Step 4: Repeated on www-data process PID - strace revealed -1 ENOENT error for /var/www/html/wp-includes/class-wp-locale.phpp.
Step 5: Examined files in /var/www/html/ using Vim - found typo in wp-settings.php (class-wp-locale.phpp instead of class-wp-locale.php).
Step 6: Removed the trailing 'p' from the file path in wp-settings.php.
Step 7: Tested server with curl - 200 A-ok!
Step 8: Automated fix with a Puppet manifest.
Root Cause and Resolution:

Cause: Typo in wp-settings.php led to an attempt to load a non-existent file, class-wp-locale.phpp.
Resolution: Removed the trailing 'p' in wp-settings.php, fixing the file path. Automated the fix with a Puppet manifest.
Corrective and Preventative Measures:

Improvements/Fixes:
Implement rigorous testing before deployment to catch such errors.
Enable status monitoring using services like UptimeRobot for instant outage alerts.
Continue using Puppet manifest (0-strace_is_your_friend.pp) to automate fixing similar errors in the future.
Tasks:
Conduct thorough code reviews to catch typos before deployment.
Integrate automated testing into the CI/CD pipeline.
Periodically review and update Puppet manifest for evolving codebase.
Summation:
In the vast world of coding, even a small typo can lead to major outages. This incident, caused by a simple misspelling, emphasizes the importance of thorough testing and vigilant code reviews. The automated fix implemented with Puppet ensures that similar issues are swiftly addressed in the future. Remember, we're programmers – let's embrace the mantra of testing and continuous improvement, ensuring a smooth sail for our applications. Happy coding, and may your typos be ever in your favor! 🚀💻🔍
