# Callbacks and Custom Methods

Often we are going to want an action to happen at different points of the life cycle of an object (create, update and destroy). Callbacks are methods that are executed at specific times of an object's life cycle.

## List of callbacks
This is a list of all the callbacks during different phases of an object.

### Creating an Object
- before_validation
- after_validation
- before_save
- around_save
- before_create
- around_create
- after_create
- after_save
- after_commit

### Updating an Object
- before_validation
- after_validation
- before_save
- around_save
- before_update
- around_update
- after_update
- after_save
- after_commit

### Destroying an Object
- before_destroy
- around_destroy
- after_destroy
- after_commit


Going back to our file: `orm_practice/app/models/user.rb`:

```Ruby
class User < ActiveRecord::Base
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, presence: true, length: { in: 2..20 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }

  # this callback will run before saving on create and update
  before_save :downcase_email

  # this callback will run after creating a new user
  after_create :successfully_created

  # this callback will run after updating an existing user
  after_update :successfully_updated

  # this callback will only run on creating a record to ensure a default age of 0
  before_validation :default_age, on: [:create]

  private
    def downcase_email
      self.email.downcase!
    end

    def successfully_created
      puts "Successfully created a new user"
    end
    def successfully_updated
      puts "Successfully updated a existing user"
    end

    def default_age
      self.age = 0 unless self.age?
    end
end
```

## Custom Class and Instance Methods
We have used many built-in methods so far such as `.all` `.find` `.create` but we can also define our own methods. The syntax for this is just like defining any method in a regular ruby class.

Regarding again the file: `orm_practice/app/models/user.rb`

```Ruby
class User < ActiveRecord::Base
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, presence: true, length: { in: 2..20 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }

  # creating a custom instance method. self refers to the ActiveRecord object
  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  # creating a custom class method. self refers to the User model
  def self.average_age
      self.sum(:age) / self.count
  end

  # ... emitted callback code for brevity
end
```

Now, in your rails console, you can call those custom methods.
