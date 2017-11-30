# Relationships
One of the datatypes we could declare when making a new model is called `:references`. What does this do? Well, using `:references` will establish a relationship between the model we are creating and the model that we are referencing by adding a foreign key in the new model.

To create a relationship, simply type the name of the model it references followed by references. Let's go over a quick example that builds off our my_app project that we created in the previous tab.

`$ cd my_app`
`$ rails g model Message content:text user:references`

This will create a Message model that contains a user_id column in the database. If we navigate to the models folder of our project:

`my_app/app/models/message`

```Ruby
class Message < ActiveRecord::Base
  belongs_to :user
end
```

## MODIFYING Models after Creating them:
This is too advanced for this section, but if needing this reference please see file `./07-migrations.md` which describes it.

This means that a specific message `belongs_to` a particular user. Each row in our messages table will contain a foreign_key reference to a user.  Always use the singular term for references.

## HAS_ONE Relationship
Let's create a Address model that will have a reference to a user.

`$ rails g model Address street:string city:string state:string user:references`
my_app/app/models/user.rb

```Ruby
class User < ActiveRecord::Base
  has_one :address
end
```

`my_app/app/models/address.rb`

```Ruby
class Address < ActiveRecord::Base
  belongs_to :user
end
```

We have just created a has_one relationship where a row in the address table can belong to one user and that a user can have one address. We don't use this very often, but it can be a nice way to save space. We don't have to retrieve the user's address every time we query the user, so less data being retrieved from the database.

It's important that when we generate the Address model that we use user:references. However, we don't have to generate an address_id column for the users table. We simply have to open the User model and add the `has_one :address`. Now, we can open the console and invoke that method on an instance of the User Model.

`User.find(4).address`
The above query will find the 4th user and find the address attached to that user.

## HAS_MANY RELATIONSHIP
A very common relationship that we will be using is the has_many. This is just like has_one, but it indicates that an owner can have more than one (i.e,  many) of the other object. Our very first example was a set up to be a one-to-many relationship between users and messages.

`my_app/app/models/message.rb`

```Ruby
class Message < ActiveRecord::Base
  belongs_to :user
end
```

`my_app/app/models/user.rb`

```Ruby
class User < ActiveRecord::Base
  has_many :messages
end
```

Same idea as `has_one`, except this time in the model that has the `has_many`, we use the plural version of the model. In this case, a user can have more than one message so we use `has_many`. Now, in the console, we can run queries such as:

```ruby
# retrieve all messages that belong to the first user
User.first.messages
```

## HAS_MANY :THROUGH RELATIONSHIP
The last association we will cover is the `has_many :through`.. This allows us to to create many-to-many relationships. Let's say that we have a `Student` model, a `Course` Model, and a `Signup` model. A student could attend many courses and a course could have many students. Therefore, we need the Signup model to keep track of who is attending which course.

```bash
$ rails g model Student first_name:string last_name:string
$ rails g model Course title:string description:text
$ rails g model Signup student:references course:references
```

`my_app/app/models/student.rb`:

```ruby
class Student < ActiveRecord::Base
  has_many :signups
  has_many :courses, through: :signups
end
```

`my_app/app/models/signup.rb`:

```ruby
class Signup < ActiveRecord::Base
  belongs_to :student
  belongs_to :course
end
```

`my_app/app/models/course.rb`:

```ruby
class Course < ActiveRecord::Base
  has_many :signups
  has_many :students, through: :signups
end
```

Now, we are able to retrieve all the courses of a specific student and all the students of a specific course.

```ruby
# retrieves all the courses that the first student has signed up for
Student.first.courses
# retrieves all the students that have signed up for the second course
Course.second.students
```

## DELETE_ALL:
```ruby
class Course < ActiveRecord::Base
  has_many :signups, dependent: :delete_all
  has_many :students, through: :signups
end
```
*Note* The `dependent: :delete_all` line will delete ALL signup records associated with this Course, if the Course was to be deleted.
