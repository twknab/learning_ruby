# Query Optimization

In this project you'll learn how to use `seeds.rb` to create seeded database data.

Before we start talking about query optimization, we need to create an application with some data so we can run queries. Often times, applications need to have some default data in the database. For example, a travel app would most likely need the major destinations in the world loaded into their database. So, how can we solve this problem? From what we know right now, this particular task does not sound too pleasant. After creating the models, we would have to go to the console and insert information into our tables manually. If that does not sound bad enough, what if someone else wanted to use the same schema? They would need to type in the same information in their console as well. Ugh, not a good solution as you can imagine. Well, as with most things, Active Record provides a solution.

## Seed Data
Create a new rails applications name 'optimize' with the following models:

```bash
rails new optimize
rails generate model Team name:string mascot:string stadium:string
rails generate model Player name:string team:references
rake db:migrate
```

Make sure that you have the belongs_to :team and has_many :players relationships set up in your Player and Team models respectively.

Next, navigate to `db/seeds.rb` and paste the following code:

```Ruby
# we require 'open-uri' to request the html files
require 'open-uri'
teams = [
  ["Atlanta Hawks", "Skyhawk", "Philips Arena"],
  ["Boston Celtics", "Lucky the Leprechaun", "TD Garden"],
  ["Brooklyn Nets", "BrooklyKnight", "Barclays Center"],
  ["Charlotte Hornets", "Hugo the Hornet", "Spectrum Center"],
  ["Chicago Bulls", "Benny the Bull", "United Center"],
  ["Cleveland Cavaliers", "Moondog", "Quicken Loans Arena"],
  ["Dallas Mavericks", "Champ", "American Airlines Center"],
  ["Denver Nuggets", "Rocky the Mountain Lion", "Pepsi Center"],
  ["Detroit Pistons", "Hooper", "The Palace of Auburn Hills"],
  ["Golden State Warriors", "Thunder", "Oracle Arena"],
  ["Houston Rockets", "Clutch", "Toyota Center"],
  ["Indiana Pacers", "Boomer the Panther", "Bankers Life Fieldhouse"],
  ["Los Angeles Clippers", "Chuck", "Staples Center"],
  ["Los Angeles Lakers", "Jack Nicholson", "Staples Center"],
  ["Memphis Grizzlies", "Griz", "FedExForum"],
  ["Miami Heat", "Burnie", "American Airlines Arena"],
  ["Milwaukee Bucks", "Bango", "BMO Harris Bradley Center"],
  ["Minnesota Timberwolves", "Crunch the Wolf", "Target Center"],
  ["New Orleans Pelicans", "Pierre the Pelican", "Smoothie King Center"],
  ["New York Knicks", "Spike Lee", "Madison Square Garden"],
  ["Oklahoma City Thunder", "Rumble the Bison", "Chesapeake Energy Arena"],
  ["Orlando Magic", "Stuff the Magic Dragon", "Amway Center"],
  ["Philadelphia 76ers", "Franklin the Dog", "Wells Fargo Center Philadelphia"],
  ["Phoenix Suns", "The Suns Gorilla", "Talking Stick Resort Arena"],
  ["Portland Trail Blazers", "Blaze the Trail Cat", "Moda Center"],
  ["Sacramento Kings", "Slamson the Lion", "Golden 1 Center"],
  ["San Antonio Spurs", "The Coyote", "AT&T Center"],
  ["Toronto Raptors", "Raptor", "Air Canada Centre"],
  ["Utah Jazz", "Jazz Bear", "Vivint Smart Home Arena"],
  ["Washington Wizards", "G. Wiz", "Verizon Center"]
]
# Here, we are using the Nokogiri gem (already comes with Rails), to scrape the ESPN website for the list of players.
# For more information on Nokogiri, you can go to their documentation or visit http://www.nokogiri.org/
atlanta_players = Nokogiri::HTML(open("http://www.espn.com/nba/team/roster/_/name/atl/atlanta-hawks")).css("td.sortcell")
boston_players = Nokogiri::HTML(open("http://www.espn.com/nba/team/roster/_/name/bos/boston-celtics")).css("td.sortcell")
brooklyn_players = Nokogiri::HTML(open("http://www.espn.com/nba/team/roster/_/name/bkn/brooklyn-nets")).css("td.sortcell")
charlotte_players = Nokogiri::HTML(open("http://www.espn.com/nba/team/roster/_/name/cha/charlotte-hornets")).css("td.sortcell")
chicago_players = Nokogiri::HTML(open("http://www.espn.com/nba/team/roster/_/name/chi/chicago-bulls")).css("td.sortcell")
cleveland_players = Nokogiri::HTML(open("http://www.espn.com/nba/team/roster/_/name/cle/cleveland-cavaliers")).css("td.sortcell")
dallas_players = Nokogiri::HTML(open("http://www.espn.com/nba/team/roster/_/name/dal/dallas-mavericks")).css("td.sortcell")
denver_players = Nokogiri::HTML(open("http://www.espn.com/nba/team/roster/_/name/den/denver-nuggets")).css("td.sortcell")
detroit_players = Nokogiri::HTML(open("http://www.espn.com/nba/team/roster/_/name/det/detroit-pistons")).css("td.sortcell")
warriors_players = Nokogiri::HTML(open("http://www.espn.com/nba/team/roster/_/name/gs/golden-state-warriors")).css("td.sortcell")
houston_players = Nokogiri::HTML(open("http://www.espn.com/nba/team/roster/_/name/hou/houston-rockets")).css("td.sortcell")
indiana_players = Nokogiri::HTML(open("http://www.espn.com/nba/team/roster/_/name/ind/indiana-pacers")).css("td.sortcell")
clippers_players = Nokogiri::HTML(open("http://www.espn.com/nba/team/roster/_/name/lac/la-clippers")).css("td.sortcell")
lakers_players = Nokogiri::HTML(open("http://www.espn.com/nba/team/roster/_/name/lal/los-angeles-lakers")).css("td.sortcell")
memphis_players = Nokogiri::HTML(open("http://www.espn.com/nba/team/roster/_/name/mem/memphis-grizzlies")).css("td.sortcell")
miami_players = Nokogiri::HTML(open("http://www.espn.com/nba/team/roster/_/name/mia/miami-heat")).css("td.sortcell")
milwaukee_players = Nokogiri::HTML(open("http://www.espn.com/nba/team/roster/_/name/mil/milwaukee-bucks")).css("td.sortcell")
minnesota_players = Nokogiri::HTML(open("http://www.espn.com/nba/team/roster/_/name/min/minnesota-timberwolves")).css("td.sortcell")
nola_players = Nokogiri::HTML(open("http://www.espn.com/nba/team/roster/_/name/no/new-orleans-pelicans")).css("td.sortcell")
knicks_players = Nokogiri::HTML(open("http://www.espn.com/nba/team/roster/_/name/ny/new-york-knicks")).css("td.sortcell")
okc_players = Nokogiri::HTML(open("http://www.espn.com/nba/team/roster/_/name/okc/oklahoma-city-thunder")).css("td.sortcell")
orlando_players = Nokogiri::HTML(open("http://www.espn.com/nba/team/roster/_/name/orl/orlando-magic")).css("td.sortcell")
phili_players = Nokogiri::HTML(open("http://www.espn.com/nba/team/roster/_/name/phi/philadelphia-76ers")).css("td.sortcell")
phoenix_players = Nokogiri::HTML(open("http://www.espn.com/nba/team/roster/_/name/phx/phoenix-suns")).css("td.sortcell")
portland_players = Nokogiri::HTML(open("http://www.espn.com/nba/team/roster/_/name/por/portland-trail-blazers")).css("td.sortcell")
sacramento_players = Nokogiri::HTML(open("http://www.espn.com/nba/team/roster/_/name/sac/sacramento-kings")).css("td.sortcell")
spurs_players = Nokogiri::HTML(open("http://www.espn.com/nba/team/roster/_/name/sa/san-antonio-spurs")).css("td.sortcell")
toronto_players = Nokogiri::HTML(open("http://www.espn.com/nba/team/roster/_/name/tor/toronto-raptors")).css("td.sortcell")
utah_players = Nokogiri::HTML(open("http://www.espn.com/nba/team/roster/_/name/utah/utah-jazz")).css("td.sortcell")
washington_players = Nokogiri::HTML(open("http://www.espn.com/nba/team/roster/_/name/wsh/washington-wizards")).css("td.sortcell")
players = [
  atlanta_players,
  boston_players,
  brooklyn_players,
  charlotte_players,
  chicago_players,
  cleveland_players,
  dallas_players,
  denver_players,
  detroit_players,
  warriors_players,
  houston_players,
  indiana_players,
  clippers_players,
  lakers_players,
  memphis_players,
  miami_players,
  milwaukee_players,
  minnesota_players,
  nola_players,
  knicks_players,
  okc_players,
  orlando_players,
  phili_players,
  phoenix_players,
  portland_players,
  sacramento_players,
  spurs_players,
  toronto_players,
  utah_players,
  washington_players
]
players.each_with_index do |roster, index|
  Team.create(name: teams[index][0], mascot: teams[index][1], stadium: teams[index][2])
  roster.each do |player|
    Team.last.players.create(name: player.text)
  end
end
```

*Note:* Be sure to open `models/team.rb` and add the following `has_many` relationship:

  `has_many :players`

Now, you can run:

  `rake db:seed`

This command will run the code in the `db/seeds.rb` file. Now, you should have all the nba teams and their rosters in the database. Navigate to your rails console and run:

```
Player.all
Team.all
```

If you are having problems with `nokogiri`, you can run: `gem install nokogiri`. Now that we have data, we can learn about optimizing our queries in the next tab.
