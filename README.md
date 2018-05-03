### Rails Project - Hearthstone Forum (HearthDiscuss)

__Title__: Rails Decal Final Project: HearthDiscuss

__Team Members__: Yunjie Zhang, Ruijie Zhou

__Demo Link__: 

__Idea__: A hearthstone themed online forum created using rails where users can log in to post and edit discussions in different channels, and post and edit replies to different dicussions.

__Models and Descriptions__:

User

* has email, username, password, many discussions and replies.

Channel

* has many dicussions and users, has a title

Discussion

* created by a user under a particular channel, has many replies, has a title and content

Reply

* created by a user under a certain discussion, has some content

__Features__:

* Users can create account and log in
* Users can post discussions and replies
* Users can edit and delete their own discussions and replies
* Use rolify and cancancan to encore an admin user role, which has unlimited access to edit and delete every discussion and reply
* Use redcarpet and coderay to enable markdown syntax and codeblocks in discussion posts and replies

__Division of Labor__:

* Ruijie: Implement discussion and channels
* Yunjie: Implement user and replies