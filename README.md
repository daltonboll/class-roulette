# Class Roulette
Website: http://classroulette.herokuapp.com/

Team Members: Dalton Boll, Steven Traversi

###Idea
Chat rooms exist for each lecture at UC Berkeley. Students join the chat room when they get to lecture. If they have questions that they don't want to interrupt class to ask, they can simply message the chat room, where other students are waiting to answer.

###Models
#####User
has name, email, and many messages
#####Course
has name, department, and many lectures
#####Lecture
has name, date, and many messages
#####Message
has text and belongs to both a User and a Lecture

###Features
* Users can log in
* Navigate through courses to lecture times to a specific lecture 
* Users can send messages in lectures (chat rooms)
* Messages are updated in real-time

###Division of Labor
Together: Created all models, wrote styling for the views

Dalton: Implemented authorization logic, routing logic, seeds.rb, sorting, styling templates

Steven: Implemented database polling for chat rooms, chatroom styling, video demo

