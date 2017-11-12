# Active Record Migrations
Active Record Migrations allow developers to alter the database schema without having to write SQL directly. It also acts as a version control system to keep your database and code synchronized. For the next tabs, we will create a brand new rails project.

```bash
$ rails new my_app
$ cd my_app
$ rails generate model User first_name:string last_name:string
$ rake db:migrate
```

A migration file is generated with instructions to create a table in the database that will represent your model. Modifying your database by creating or dropping tables, adding or removing columns, or any other action that alters the database is essentially creating a 'new' version of that schema. All of these alterations must be done through migrations so that Active Record can keep your `db/schema.rb` file up-to-date with your database structure.


## Modifying Tables
Let's go back to our User model example and add an email column to the users table via a migration.

`$ rails generate migration AddEmailColumnToUsers email:string`

Now, if we go to the migration file located in `app/db/migrate/YYYYMMDDHHMMSS.add_email_column_to_users.rb:`
you'll see the column changes.

## Checking Migration Status
Next, let's check that statuses of our migrations. In the terminal, run:

`$ rake db:migrate:status`

As you can see, the migration to create the users table is up because I already had run rake db:migrate to create the users table. However, the migration to add the email column still down. Let's run the migration and check the statuses again:

```bash
$ rake db:migrate
$ rake db:migrate:status
migrate status
```

`rake db:migrate` will turn all the migrations that are down to up. In summary, up status means that the changes of that migration file have been executed, and down status means that the changes of that migration filed have not been executed. **Warning: you should never delete a migration file that is up**

## Functions
There are many functions that we can use in migrations. Here is a list of the most popular ones:

- create_table(name, options)
- drop_table(name)
- rename_table(old_name, new_name)
- add_column(table_name, column_name, type, options)
- rename_column(table_name, column_name, new_column_name)
- change_column(table_name, column_name, type, options)
- remove_column(table_name, column_name)
- add_index(table_name, column_name, index_type)
- remove_index(table_name, column_name)
- add_reference(table_name, referenced_model, index:true)

## Rollback Migrations
So far, we only talked about turning migrations up. What about if we want to revert a migration? Well, Active Record provides the rollback feature. Let's say that we want the original schema without the email column. In the terminal. we can run

`$ rake db:rollback`
This will revert the latest migration and change it's status to down. Let's make sure by checking it's status

`$ rake db:migrate:status`

`rake db:rollback` - Rolls back the schema to the previous version
`rake db:rollback STEP=N` - Rolls back the schema N steps, where N is an integer

## Specific rollbacks
`rake db:migrate:up VERSION=MIGRATION_ID` - Turns up the a specific migration
`rake db:migrate:down VERSION=MIGRATION_ID` - Turns down the a specific migration
`$ rake db:migrate:up VERSION=20080906120000`
`$ rake db:migrate:down VERSION=20080906120000`
