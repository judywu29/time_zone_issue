Time Zone Issue
================
This application is to build a Ruby API which can be used to display results and upcoming events from the next Olympics.

The API should support:
- Display events which are coming up.
- View the sports that are currently in progress.
- Displays results from the previous games/races under the current sports.
Eg. Basketball -> USA are currently playing Australia, 1hr ago Brazil defeated China 89-76, 
2hrs ago Russia defeated Japan 102-101. Next game is USA vs Spain in 4 hours.


I met 2 problems when I built this API: 
================

 - Time Zone
 - prepare data for has-many-through association through factory_girl 
 
 
TimeZone
================
I've made config.time_zone to local(Melbourne) time. However, still when records are created in the DB, 
it looks like datetime is being stored in UTC format.

There are four vairables to set the time zone: 

 - ENV['TZ']
 
 This environment variable is used to set the time zone for Linux or Unix system. 

- config.time_zone

We can set the default time zone by adding this in config/application.rb, e.g. config.time_zone = 'Melbourne'
Through rake time:zones:all, it displays names of all time zones recognized by the Rails TimeZone class

- Time.zone

It can be used to set the dispalying on brower. and it can override the config.time_zone setting.

- config.active_record.default_timezone

It determines whether to use Time.local (if set to :local) or Time.utc (if set to :utc) when pulling dates and times 
from the database. The default is :utc.


So the problem has been solved through adding 2 settings in /config/application.rb: 
config.time_zone = ‘Melbourne'  
config.active_record.default_timezone = :local  

please refer to: http://stackoverflow.com/questions/6118779/how-to-change-default-timezone-for-active-record-in-rails



How to prepare data for has-many-through association through factory_girl
================

I have the following model:

class Team < ActiveRecord::Base

  has_many :playings, dependent: :destroy
  
  has_many :games, through: :playings
  
end

class Game < ActiveRecord::Base

  has_many :playings, dependent: :destroy
  
  has_many :teams, through: :playings
  
end

class Playing < ActiveRecord::Base

  belongs_to :team
  
  belongs_to :game
  
end

Factory: #spec/factories/games.rb
FactoryGirl.define do
 
  factory :aus_to_usa, class: Game do
  
    name "Basketball"
    
    start_time "2015-09-22 14:30:00"
    
    end_time "2015-09-22 16:00:00"
    
    result ""
    
    #just need build 2 teams and then append themm to game: 
    
    after :create do |game|
    
      game.teams << FactoryGirl.create(:usa)
      
      game.teams << FactoryGirl.create(:australia)
      
    end
  end
  ...
end

in #spec/factories/teams.rb

factory :usa, class: Team do

    name "USA"
    
  end
  
  factory :australia, class: Team do
  
    name "Australia"
    
  end
  
end
  
 So we just need to add the callback method definition into the game where 2 teams are appended. 
 
 and when I create the instances in spec file: I just need to create the Game instances:
 
 describe "Game" do
  
  before(:all) do
  
    aus_to_usa = FactoryGirl.create(:aus_to_usa)
    
    bra_to_chi = FactoryGirl.create(:bra_to_chi)

    rus_to_jap = FactoryGirl.create(:rus_to_jap)

    usa_to_spa = FactoryGirl.create(:usa_to_spa)
    
  end
  
   
 Please refer to http://stackoverflow.com/questions/14444878/has-many-through-with-factory-girl
  


