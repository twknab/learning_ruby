# Introduction
- Models are the M in the MVC. The job of a model is to represent data and logic. Whenever we have data that we need to store temporarily or persistently we will be using one of our model classes. All of the logic associated with that data, whether it be saving that information in the database for later use or sending a confirmation email after a User has registered to our site will also be handled by our model classes.

## Object Relational Mapping ORM
- An ORM is a technique that connects the different objects that we use in our Application to tables in the database. For example, if we have a users table with the first_name and last_name columns in our database, we will need to create a User model class with the first_name and last_name attributes. Then, the Rails ORM will automatically link the table and columns to the name of the model and its attributes.

- Now that those two are linked, we can create, read, update and delete records from our users table by calling methods from the User model class. All without having to write a single line of SQL!

## ActiveRecord
- The ORM that we will be using with Rails is called ActiveRecord. This ORM is one of the main features that made Rails so popular by developers. ActiveRecord works with a wide range of different databases but for the purpose of this course we will be focusing mostly on sqlite and postgresql.

## Creating a Model Class
- Let's create a new rails project:
- `$ rails new orm_practice`
- `$ cd orm_practice`
- Also make sure to add Hirb to our Gemfile and install it.
- If you don't recall how to install a gem into your Rails project, go back the the Gems section in the Setting Up section.

- To create a Model Class we will be using one of Rails many generator commands.
- `$ rails g model`

Using this command we can generate a model locally which we will then use to create a table in our database. We will also be using this command to add attributes to our Model Class. When we add attributes to our Model Class, Active Record will take care of creating columns in our database as well. As an example, if we were to generate a User model and we give it a `first_name` attribute, Active Record will create a column in the users table of our database called `first_name`.

Let's make a User model that has a `first_name`, a `last_name`, an `email`, a `password`, and an `age` value:

- `$ rails g model User first_name:string last_name:string email:string password:string age:integer`
- Notice the name of the model is capitalized and singular.

User class is going to be our link to a table in our database, and database columns require a type, we must specify the type of each attribute we add. Also, you may have noticed that we didn't add the primary `key`, `created_at` and `updated_at` fields. Well, ActiveRecord is designed to add those three automatically.

When you use the generator to create a model, it will also create a few files:

1. The model file, named after the model name.
2. The migration file, which we'll cover more in depth in a later section.
3. As well as some test files which we will cover in the TDD chapter.

Here's what you'll see:

```
invoke  active_record
create    db/migrate/20170201002746_create_users.rb
create    app/models/user.rb
invoke    test_unit
create      test/models/user_test.rb
create      test/fixtures/users.yml
```

Migration files are a way for us to grow/change our database schema over time. Once a migration file is created, we need to migrate it to our database by running:

- `$ rake db:migrate`

This will actually create the table in our database that corresponds to our model class.

Lastly, ActiveRecord supports many different data types:
- `:binary`
- `:boolean`
- `:date`
- `:datetime`
- `:decimal`
- `:float`
- `:integer`
- `:primary_key`
- `:references`
- `:string`
- `:text`
- `:time`
- `:timestamp`
