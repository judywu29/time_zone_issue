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
  
  factory :bra_to_chi, class: Game do
    name "Basketball"
    start_time "2015-09-22 10:30:00"
    end_time "2015-09-22 11:00:00"
    result "Brazil defeated China 89-76"
    
    after :create do |game|
      game.teams << FactoryGirl.create(:brazil)
      game.teams << FactoryGirl.create(:china)
    end
    
  end
  
  factory :rus_to_jap, class: Game do
    name "Basketball"
    start_time "2015-09-22 12:30:00"
    end_time "2015-09-22 14:00:00"
    result "Russia defeated Japan 102-101"
    
    after :create do |game|
      game.teams << FactoryGirl.create(:russia)
      game.teams << FactoryGirl.create(:japan)
    end
    
  end
  
  factory :usa_to_spa, class: Game do
    name "Basketball"
    start_time "2015-09-22 17:30:00"
    end_time "2015-09-22 19:00:00"
    result ""
    
    after :create do |game|
      game.teams << FactoryGirl.create(:usa)
      game.teams << FactoryGirl.create(:spain)
    end
  end
end