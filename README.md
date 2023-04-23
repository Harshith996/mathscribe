# mathscribe

This repository holds code for Mathscribe: an automated typesetter that improves communication between students and graders/teachers.
There are three folders:
1. mathscribe-frontend
  a. This folder holds the core HTML, CSS and JS files that render the webpages.
2. mathscribe-backend
  b. This folder holds the core backend, written in PHP and Python.
3. mathscribe-flutter
  c. This folder holds the mobile app companion, written in Dart and portable in both Android and iOS (Tested only on Android).

## How to run the app
1. Start an Apache server and move all the files within "mathscribe-frontend" to the public folder. (If you're using XAMPP, this is the htdocs folder. If you're running Apache on RHEL or CentOS, this is usually "/var/www/html".
2. Within your server's root folder, create a folder called "backend". Copy all files from "mathscribe-backend" to this new folder.
3. Finally, compile and run the "mathscribe-flutter" folder using a Flutter client like VS Code or Android Studio.
