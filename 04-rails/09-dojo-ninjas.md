# Assignment: Dojo Ninjas
Create a new project called `dojo_ninjas` and have it use the default SQLite database for both development and testing environment. For this project, you're going to need the following tables/models. Please see the following diagram and create the necessary model:

-----Dojos-------                  -----Ninjas-------
id INT                             id INT
name VARCHAR(255)       1:many     dojo_id INT
city VARCHAR(255)     ---------<   first_name VARCHAR(255)
state VARCHAR(255)                 last_name VARCHAR(255)
------end--------                  ------end---------

#### Dojo
- Have it include the name of the dojo and the city and state of each dojo
- Have the first dojo be "CodingDojo Silicon Valley" in "Mountain View", "CA".
- Have the second dojo be "CodingDojo Seattle" in "Seattle", "WA".
- Have the third dojo be "CodingDojo New York" in "New York", "NY".

#### Ninja
- Have it include first_name, last_name of each ninja in the dojo.
- Each dojo can have multiple ninjas and each ninja belongs to a specific dojo.

IMPORTANT INFO: When you do any of these assignments in this chapter, you should not reference the foreign key directly. For example, instead of writing Ninja.create(dojo_id: 1, ...) , you should write do something like this: Ninja.create(dojo: Dojo.first, ...).  By doing this, we are preserving our database from having bad information. In the first example, a Ninja will be created even if a dojo with id of 1 does not yet exist. In the second example, Active Record will only create a ninja if there is a first dojo in our database.

### This is what you'll do:

- Start a new project (the name of the project should be 'dojo_ninjas')
- Create appropriate tables/models.
- Using Ruby console:
    - Create 3 dojos (insert some blank entries just to make sure it's allowing you to insert empty entries)
    - Change your models so that it does the following validations:
      - For the dojo, require the presence of the name, city, and state; also require the state to be two characters long
      - For the ninja, require the presence of the first name and last name
    - Make sure that your ninja model belongs to the dojo (specify this in the model for both the dojo and the ninja)
- Using ruby console
  - Delete the three dojos you created (e.g. Dojo.find(1).destroy; also look up destroy_all method)
  - Create 3 additional dojos by using Dojo.new.
  - Try to create a few more dojos but without specifying some of the required fields. Make sure that the validation works and generates the errors.
 - Create 3 ninjas that belong to the first dojo you created.
 - Create 3 more ninjas and have them belong to the second dojo you created.
 - Create 3 more ninjas and have them belong to the third dojo you created.
 - Make sure you understand how to get all of the ninjas for any dojo (e.g. get all the ninjas for the first dojo, second dojo, etc).
 - How would you only retrieve the first_name of the ninjas that belong to the second dojo and order the result by created_at DESC order?
  Solution: `Dojo.second.ninja.select(:first_name).order("created_at DESC")`
 - Delete the second dojo. How could you adjust your model so that it automatically removes all of the ninjas associated with that dojo?
 - Make sure that you feel completely comfortable with using .all, .valid?, .where, .order, .limit, .save, .create, .errors, and other methods discussed in the video.
