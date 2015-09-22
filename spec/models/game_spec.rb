require "rails_helper"

describe "Game" do
  
  before(:all) do
    aus_to_usa = FactoryGirl.create(:aus_to_usa)
    
    bra_to_chi = FactoryGirl.create(:bra_to_chi)

    rus_to_jap = FactoryGirl.create(:rus_to_jap)

    usa_to_spa = FactoryGirl.create(:usa_to_spa)
  end 
  
  it "gets current playing games" do
    current_games = Game.current_games
    expect(current_games.count).to eq 1
    expect(current_games.first.name).to eq "Basketball"
    expect(current_games.first.teams.first.name).to eq "USA"
    expect(current_games.first.teams.second.name).to eq "Australia"
  end
  
   it "gets history games" do
    history_games = Game.history_games
    expect(history_games.count).to eq 2
    expect(history_games.first.result).to eq "Brazil defeated China 89-76"
    expect(history_games.first.teams.first.name).to eq "Brazil"
    expect(history_games.first.teams.second.name).to eq "China"
    
    expect(history_games.second.result).to eq "Russia defeated Japan 102-101"
    expect(history_games.second.teams.first.name).to eq "Russia"
    expect(history_games.second.teams.second.name).to eq "Japan"
  end
  
   it "gets future games" do
    future_games = Game.future_games
    expect(future_games.count).to eq 1
    expect(future_games.first.teams.first.name).to eq "USA"
    expect(future_games.first.teams.second.name).to eq "Spain"

  end
end
