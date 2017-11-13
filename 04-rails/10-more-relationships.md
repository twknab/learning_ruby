# Relationships in Detail
So far, we have learned how to create `one-to-one`, `one-to-many`, and `many-to-many` relationships. ActiveRecord has an easy and almost painless way to set up relationships, but it is important to understand what are we actually adding to our models when we write has_one, belongs_to, or has_many. Let's analyze the following ERD:

*See `10-more-relationships.png` for ERD diagram*

There are three relationships in this application:

1. One-To-One
Once a user registers, our application assigns a unique account to the user.

`app/models/user.rb`

```ruby
class User < ActiveRecord::Base
  has_one :account
end
```

`app/models/account.rb`

```ruby
class Account < ActiveRecord::Base
  belongs_to :user
end
```

### `has_one` Relationship
More about `has_one`: when we declare a has_one relationship, ActiveRecord automatically creates **five** instance methods. In general (where {{association}} is the model name assigned to `has_one`, ie, in the example above it would be `account`):

- `.{{association}}`
- `.{{association}}=`
- `.build_{{association}}`
- `.create_{{association}}`
- `.create_{{association}}!`

In our particular case, our association is the account model. So, our five methods are:

- `.account`
- `.account=`
- `.build_account`
- `.create_account`
- `.create_account!`

A little more familiar? Let's dive into an example.

```ruby
first_user = User.first
first_user.account # => #<Account id: 1, account_number: "000AAA", user_id: 1, created_at: "2016-11-03 00:35:36", updated_at: "2016-11-03 01:40:42">
```

Here, we call the `.account` method that retrieves, or gets, the account related to the first user. ActiveRecord will also give us a *setter*.

```ruby
first_user = User.first
first_user.account # => #<Account id: 1, account_number: "000AAA", user_id: 1, created_at: "2016-11-03 00:35:36", updated_at: "2016-11-03 01:40:42">
first_user.account = Account.second # => setting the user account to the secound account
first_user.account # => #<Account id: 2, account_number: "000AAB", user_id: 1, created_at: "2016-11-03 01:42:37", updated_at: "2016-11-03 01:43:05">
```

Awesome! We can get and set the account of every user just like that. We can also build and create accounts.

```ruby
first_user = User.first
first_user.build_account(account_number: "000AAC") # => building a new instance of the account (it does not yet save)
first_user.save # updating the first user's account to the new account number created
first_user.create_account(account_number: "000AAD") # builds a new instance of the account and saves it as the first user's account. ie, `create_account` builds and saves at the same time, whereas `build_account` only builds but does not save.
```

`.create_account!` method is similar to the create_account method, however it will raise an error if the record is invalid.

### `belongs_to` Relationship

When we declare a `belongs_to` relationship, ActiveRecord automatically creates similar methods as the `has_one` relationship. In this particular case, we will get:

- `.user`
- `.user=`
- `.build_user`
- `.create_user`
- `.create_user!`

I will let you play with these methods yourself.

2. One-To-Many
A user should be able to create many events.

`app/models/event.rb`:

```ruby
class Event < ActiveRecord::Base
  belongs_to :user
end
```

`app/models/user.rb`:

```ruby
class User < ActiveRecord::Base
  has_one :account
  has_many :events
end
```

### `has_many` Relationship

When we declare a `has_many` relationship, ActiveRecord automatically creates a few instance methods. In general:

- `collection`
- `collection<<(object, ...)`
- `collection.delete(object, ...)`
- `collection.destroy(object, ...)`
- `collection=(objects)`
- `collection_singular_ids`
- `collection_singular_ids=(ids)`
- `collection.clear`
- `collection.empty?`
- `collection.size`
- `collection.find`
- `collection.where`
- `collection.exists?`
- `collection.build`
- `collection.create`
- `collection.create!`

In our case, it would be the following:

- `events`
- `events<<(object, ...)`
- `events.delete(object, ...)`
- `events.destroy(object, ...)`
- `events=(objects)`
- `event_ids`
- `event_ids=(ids)`
- `events.clear`
- `events.empty?`
- `events.size`
- `events.find`
- `events.where`
- `events.exists?`
- `events.build`
- `events.create`
- `events.create!`

* We will leave it up to you to try these methods.

3. Many-To-Many
A user can attend many events and a event can have many users attending.

`app/models/user.rb`:

```ruby
class User < ActiveRecord::Base
  has_one :account
  has_many :events
  has_many :attendees
  has_many :events, through: :attendees
end
```

`app/models/event.rb`:

```ruby
class Event < ActiveRecord::Base
  belongs_to :user
  has_many :attendees
  has_many :users, through: :attendees
end
```

Notice that in the User model, we have two relationships with same name of events. So, for example, if we call `User.first.events`, will we get the events that the user has created or the events that the user is attending? Since the relationship that goes through the attendees table comes after in the code, we will get all the events that the user is attending.

Along with creating instance methods, each relationship definition comes with a set of options that we can pass. For example, we can rename the our `has_many`, `:through` relationship using the source option to better fit our application.

`app/models/user.rb`:

```ruby
class User < ActiveRecord::Base
  has_one :account
  has_many :events
  has_many :attendees
  has_many :events_attending, through: :attendees, source: :event
end
```

Now, we can have get to both events created and events attending from any user.

```ruby
user = User.first
user.events # => Retrieves all the events created by this user.
user.events_attending #=> Retrieves all the events attending by the user.
```

For each relationship (`has_one`, `has_many`, `belongs_to`), the set of options might be a little different. For example, for the `has_many` relationship, some of the most popular options are:

- `:as` - user for polymorphic associations
- `:autosave` - can be turn to true to load and destroy members
- `:class_name` - if the model cannot be derived from the association name, you can use this option to declare the model directly
- `:dependent` - controls what happens to the associated object when their owner is destroyed
- `:foreign_key` - allows you to name the foreign key directly
- `:source` - if the model cannot be derived from the association name in a has_many :through case, you can use this option to declare the model directly
- `:through` - to specify a join model
- `:validate` - either true or false for validation

For more documentation and information, refer to (Active Record Associations)[http://guides.rubyonrails.org/association_basics.html] guide.
