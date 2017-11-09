# About

The Rails console allows you interact with your Rails app from the command line. It is similar to IRB, however it loads the whole development environment of your application. For example, from the console, you will be able to interact with your models to create, read, update, destroy entries from your database tables.

To enter the console, we will have to navigate into the orm_practice project that we created in the previous tab.

- `$ cd orm_practice`
- `$ rails console`

We should now be able to play around in our rails console. It is important to remember when we created the model, we created a class called User and we are going to learn some of the built-in methods from ActiveRecord::Base, the class all of our Model Classes inherit from by default.

## Creating Data
With ActiveRecord, we will create records by calling a combination of methods. There are two basic ways to create a record, using the .new and .save methods or by using the .create method.

### .new & .save
The .new command creates a new object, much like any other class. If we type in User.new we should see it creates a new User instance, just like creating other objects, we need to capture this new object in a variable. In the console, we can write:

- `user1 = User.new`

After running this command, we will have a new instance of the User class with some empty attributes. Now, we can set each attribute one by one.

- `user1.first_name = "John"`
- `user1.last_name = "Doe"`
- `user1.password = "secret"`

If we then type user1 and press enter we should see that the first_name, last_name, and password attributes are set, however the rest are nil.

It is important to understand that at this point user1 is not yet saved in the database. It only exists locally in this console session. To finally save it to our database we will be invoking the .save method.

- `user1.save`

Now the user1 data is saved into the next row in the database. It can be a pain to have to add each attribute one by one so what we can do instead is to provide all the arguments to the .new.

- `user2 = User.new(first_name: "Jane", last_name:"Doe", email:"janedoe@email.com", age:35)`

And then we can save it like we normally would with .save.

- `user2.save`

### .create
We can also combine the two steps from new and create by calling the .create. method.

- `User.create(first_name:"Jon", last_name:"Stark", email:"jon@thewall.com", age:17)`

There is no need to capture this in a variable as it will automatically save to the database. The create method will instantiate a new instance of the User class locally and then save it to the database, all in one command!

## Reading Data
Active Record provides useful methods for us to retrieve information from the database. Let's look at some examples.

```Ruby
# retrieving all rows in the users table
users = User.all
# retrieving the first row in the users table
user = User.first
# retrieving the second row in the users table
user2 = User.second
# retrieving the last row in the users table
last_user = User.last
# retrieving the user with id = 2
user = User.find(2)
# retrieving the FIRST USER ONLY with the first name John
john = User.find_by(first_name: "John")
# retrieving all the users with the first name John
johns = User.where(first_name: "John")
# retrieving all users with the last name Doe but only selecting the first name and last name column
does = User.where(last_name: "Doe").select(:first_name, :last_name)
```

Here's how you can order data sets by property, ascending or descending:
http://guides.rubyonrails.org/active_record_querying.html#ordering

## Updating Data
Once we have found a record from our database, we can also modify its attributes. Again, we have a couple of different ways to update records.

```Ruby
# retrieving the user, setting the first name attribute to a different value then saving the record
user = User.find(1)
user.first_name = "Some Other Name"
user.last_name = "Some Other Last Name"
user.save
# retrieving the user then updating and saving multiple attributes
user = User.last
user.update(first_name: "James", last_name: "Doe", age: 40)
```

## Deleting Data
Once we have a record from our database, we can delete that record.

```Ruby
user = User.first.destroy
user2 = User.last.delete
```

Both `.destroy` and `.delete` methods will execute a `DELETE` SQL query to delete that record according to it's id. However, destroy allows callbacks to be executed where delete does not. We will talk about callbacks in a future tab.
