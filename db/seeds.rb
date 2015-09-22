# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Game.create(
[{:name=>'Baseball', 
:start_time=>'2015-09-22 15:30:00', 
:end_time=>'2015-09-21 17:00:00', 
:result=>'Russia defeat Japan 102-102'}, 
{:name=>'Baseball', 
:start_time=>'2015-09-21 13:00:00', 
:end_time=>'2015-09-21 14:00:00', 
:result=>'Brazil defeat China 89-76'
  
},
{:name=>'Baseball', 
:start_time=>'2015-09-21 13:00:00', 
:end_time=>'2015-09-21 14:00:00', 
:result=>''
  
},
{:name=>'Baseball', 
:start_time=>'2015-09-21 14:00:00', 
:end_time=>'2015-09-21 15:00:00', 
:result=>''
  
},
{:name=>'Baseball', 
:start_time=>'2015-09-21 16:00:00', 
:end_time=>'2015-09-21 17:00:00', 
:result=>''
  
}]

)

Team.create(
[{
  name: 'USA'
},
{
  name: 'Australia'
},
{
  name: 'Spain'
},
{
  name: 'China'
}, 
{
  name: 'Russia'
},
{
  name: 'Japan'
}])

