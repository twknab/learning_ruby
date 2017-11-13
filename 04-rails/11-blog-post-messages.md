# Assignment: Blogs/Posts/Messages
Start a new project and create the models for the ERD below. This is an application that allows people to create blogs, write posts for each blog, and leave messages for a post.

*See `11-blog-posts-messages-ERD.png`*

Create the migration files as well as the models for the application above.

## Implement the following validations:
- Require the presence of name and description for the blog.
- Require the presence of title and content for the posts, require the title to be at least 7 characters long.
- Require author and message for the messages. Require the message to be at least - 15 characters long.

## Using the console (no view):
- Create 5 new blogs.
  - `Blog.create(name:"Health", description:"This is a health related blog.")`
- Create several posts for each blog.
  - `Post.create(title:"Plant Based Proteins", message:"There are many types of proteins that can be obtained from the plant kingdom.", blog:Blog.first)`
- Create several messages for the first post.
  - `Message.create(author:"Tim Knab", message:"I completely agree with you!", post:Post.first)`
- Know how to retrieve all posts for the first blog.
  - `Blog.first.posts` or `Blog.first.post` depending upon how you setup your associations.
- Know how to retrieve all posts for the last blog (sorted by title in the DESC order).
  `Blog.last.posts.order("title DESC")`
- Know how to update the first post's title.
  - `Post.first.update(title:"PCBs in the Puget Sound")`
- Know how to delete the third post (have the model automatically delete all messages associated with the third post when you delete the third post).
  - Add `has_many :messages, dependent: :delete_all` to Post model.
  - Post.third.destroy
- Know how to retrieve all blogs.
  - `Blog.all`
- Know how to retrieve all blogs whose id is less than 5.
  - `Blog.where("id < ?", 5)`
