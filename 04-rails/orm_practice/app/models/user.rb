class User < ApplicationRecord
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, presence: true, length: { in: 2..20 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
end

=begin

Here is a short list of other types of validations:

- :length - validates the length of an attribute's value
- :minimum
- :maximum
- :in
- :is
- :numericality - validates whether an attribute is a numeric value
- :odd
- :even, and many others
- :presence - validates that the specified attributes are not empty
- :uniqueness - validates whether the value is unique in the corresponding database table. NOTE: always create a unique index in the database too.
- :confirmation - use this when you have two text fields that should receive exactly the same content; assumes the second field name has "_confirmation" appended
validates_associated - use this when your model has associations with other models and they also need to be validated
- :acceptance - validate whether a checkbox was checked when a form was submitted (usually for 'terms and conditions')
also, get familiar with :message and :on

=end
