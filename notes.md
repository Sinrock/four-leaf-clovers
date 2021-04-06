Post - join table that joins topics and users
- belongs_to :user
- has many comments
- has many users, through comments
- belongs to topic
- title
- body
------------------------------------------------------------------------

User
- has many posts
- has many comments
- has many commented_posts, through comments
- has many topics, through posts
-------------------------------------------------------------------------

Comments - join table joining users and posts
- belongs to user
- belongs to post
- content
-------------------------------------------------------------------------

Topics
- title
- has many posts
- has many users through posts