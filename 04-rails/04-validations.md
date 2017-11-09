# Validations
Validations in Rails are simple yet powerful. Rails has a number of methods to allow us to check user-input before we save anything to the database and to generate error messages for the parts of the user's input that fail.

To validate input, we simply add the validations that we want a model to have. First, we use the keyword validates followed by the name of the item that we want to validate, followed by the requirements we want. Add the following to the User model:

-  Open: `orm_practice/app/models/user.rb`

```Ruby
class User < ActiveRecord::Base
  validates :first_name, presence: true
end
```

**Important Note:**
*If utilizing rails console, be sure to type `reload!` into console after updating any models, otherwise your new fields or validations will not be detected.*

The above code will validate that the `first_name` attribute is present for any new record. We can validate multiple fields and multiple validations on the same line. It's important to note that validates is a method we are inheriting from ActiveRecord.

The parameters that we are passing in should look very familiar, we are passing in a symbol (:first_name) and a hash for all of the options. Look back to the hashes and symbols tab in the fundamentals chapter if this looks really strange to you.

```Ruby
class User < ActiveRecord::Base
  validates :first_name, :last_name, presence: true, length: { in: 2..20 }
end
```

Now we are validating that both the first_name and last_name fields are present and that their length is within the range 2 to 20.

There are many different kinds of validations and many different kinds of customizations that we can do to the ones that exist.

```Ruby
class User < ActiveRecord::Base
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, presence: true, length: { in: 2..20 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
end
```

Here we have defined our own regular expression, `EMAIL_REGEX`, to match the pattern of a valid email address. We're validating that our email is unique in our database (without worrying about case sensitivity) and we're making sure that it is formatted correctly using our `EMAIL_REGEX` regular expression.

Here is a short list of other types of validations:

- `:length` - validates the length of an attribute's value
- `:minimum`, `:maximum`, `:in`, `:is`
- `:numericality` - validates whether an attribute is a numeric value
- `:odd`, `:even`, and many others
- `:presence` - validates that the specified attributes are not empty
- `:uniqueness` - validates whether the value is unique in the corresponding database table. NOTE: always create a unique index in the database too.
- `:confirmation` - use this when you have two text fields that should receive exactly the same content; assumes the second field name has `_confirmation` appended
- `validates_associated` - use this when your model has associations with other models and they also need to be validated
- `:acceptance` - validate whether a checkbox was checked when a form was submitted (usually for 'terms and conditions')
- also, get familiar with `:message` and `:on`
Check out [Active Record Validations documentation](http://guides.rubyonrails.org/active_record_validations.html).

## Viewing Errors

You can view errors by examining the errors object. This object is attached to any object which doesn't pass validation. Let's say for example first name is required and I attempted the following:

```Ruby
my_new_user = User.new(last_name: "Poppins").save
# This will return a rollback (won't be created)

my_new_user.valid?
# should return => false

my_new_user.errors
# Will return all errors

my_new_user.errors.full_messages
# Shows array of all error messages
```

[Learn more about Error handling with Active Record](http://guides.rubyonrails.org/active_record_validations.html#working-with-validation-errors)
