# Room Meet Scheduler

<p>
This is a project that was developed using Dart and Flutter.
<br>
This project was developed because of a pain that I felt I could resolve internally within the company where I do an internship. 
<br>
<br>
I developed this application together with a co-worker where you can log in, choose one of the meeting rooms available within the company and thus schedule a time to hold a meeting.
<br>
This solution brings more organization within the company and less confusion when organizing schedules (which was done by sticking paper on the door).
<br>
<br>
This project was created with a backend where all user information and created events are stored, all in a MongoDB database, the backend is in this repository:
  
```
https://github.com/brunoalksouza/backend_meet_scheduller_node.git
```

<br>
Feel free to send questions, criticisms and suggestions, if you have any ideas to improve the code you are welcome!
</p>

---

## Prerequisites
<p>
Make sure you have Flutter, Dart, NODE, NPM and Git installed on your system.
</p>
<br>
<p>
You will also have to initialize the backend mentioned above before doing the step by step here.
</p>
<br>
<p>
It turns out that for you to be able to run it, you will need me to authorize your IP within the database, for that you can contact me.
</p>

## How to use

```
git clone https://github.com/seu-usuario/repository-name.git
```

<p>
Navigate to the repository directory:
</p>

```
cd repository-name
```

<p>
Install all the dependencies with:
</p>

```
flutter pub get
```

<p>
Choose the device on which the application will run (I recommend web)
</p>

<p>
And run:
</p>

```
flutter run
```

Login screen:
![Screenshot_6](https://github.com/brunoalksouza/room_meet_scheduler_flutter/assets/80255960/8cf14522-1a05-41ee-91d9-3aff718b15c5)

General screen with reserved meetings
Each meeting is represented by a little ball:
![Screenshot_8](https://github.com/brunoalksouza/room_meet_scheduler_flutter/assets/80255960/eeaa8a25-5a93-44a6-89b3-f97488a40a89)

After clicking the button to schedule the day, you receive this modal to schedule the time and add more information about:
![Screenshot_9](https://github.com/brunoalksouza/room_meet_scheduler_flutter/assets/80255960/d07b3ce9-4c2a-48e8-b307-081a47fa2155)


