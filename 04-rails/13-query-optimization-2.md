# Query Optimization II

In this tab, will be working on the same rails project from the previous tab (`13-query-optimization.md`).

## N+1 Problem

Let's say that we want to print the home stadium of 10 random players in our database. In the rails console, we can run something like this.

```Ruby
players = Player.limit(10).order("RANDOM()")
players.each do |player|
  puts player.team.stadium
end
```

Awesome! We were successfully able to print the stadiums for each player. But, how many queries did we run? Well, 1 query to get 10 players + 10 queries to get the arena information for a total of 11. 10 + 1 (N + 1). It might not seem like a problem now, but as applications grow larger, these type of queries can slow down performance.

Active Record created a method to solve this problem. The includes method allows you to eager load the associations that you need. Eager loading is saving the associated tables in memory first to reduce database queries required to retrieve any information from those tables. Run the following:

```Ruby
players = Player.includes(:team).limit(10).order("RANDOM()")
players.each do |player|
  puts player.team.stadium
end
```

In this code, Active Record only performs 2 queries. One query to retrieve ten random players + a query to retrieve the team information of those players. It saves that information in memory so when we request each player's stadium, Active Record does not need to do any queries to the database. It already has that information!

## Joins
When specifying conditions on your queries, Active Record recommends that you use the joins method instead.

> "Even though Active Record lets you specify conditions on the eager loaded associations just like joins, the recommended way is to use joins instead."

In the eager loading process, the SECOND select statements always depend on the FIRST select statements. This makes it difficult to run queries with specific conditions. However, if you must, you can type something like this:

```Ruby
Player.includes(:team).where("teams.name = 'Los Angeles Lakers'").references(:team)
```

Note that the above query executes a LEFT OUTER JOIN from players to teams. If we would like an INNER JOIN, we can use the joins method and specify whatever conditions we want.

```Ruby
Player.joins(:team).where("teams.name = 'Los Angeles Lakers'")
```

## Assignment:

+ Retrieve all players, then write a program that will loop through each player and display their team name, mascot and stadium. How many queries have we done?  
```Ruby
players = Player.all
players.each do |player|
  puts player.team.name
  puts player.team.mascot
  puts player.team.stadium
end
```

Many, many queries performed (one per user!)

+ Retrieve all players and write a program to loop through each player and their team name, mascot and stadium using .includes. How many queries have we done now?  
```Ruby
players = Player.includes(:team)
players.each do |player|
  puts player.team.name
  puts player.team.mascot
  puts player.team.stadium
end
```
2 queries performed!

+ Retrieve all players from the 'Chicago Bulls' by using .includes  
```Ruby
players = Player.includes(:team).where("teams.name = 'Chicago Bulls'").references(:team)
```

+ Retrieve all players along with the team name that play at the 'Staples Center'  
```Ruby
players = Player.joins(:team).where("teams.stadium = 'Staples Center'")
```

+ Retrieve all teams that have any player that start their name with the letter 'Z' by using .includes and .joins
```Ruby
Team.includes(:players).where("players.name LIKE 'Z%'").references(:players)
Team.joins(:players).where("players.name LIKE 'Z%'")

# With .joins, we can also fetch more information. For example, we can retrieve the player's name as well
Team.joins(:players).where("players.name LIKE 'Z%'").select("teams.name as team_name", "teams.*", "players.*")
```
