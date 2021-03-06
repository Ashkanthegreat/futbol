require './test/test_helper'
require './lib/stats'
require './lib/game'
require './lib/team'
require './lib/game_team'

class StatsTest < MiniTest::Test

  def setup
    Game.from_csv("./test/fixtures/games_fixture.csv")
    Team.from_csv("./data/teams.csv")
    GameTeam.from_csv("./test/fixtures/games_teams_fixture.csv")
    @stats = Stats.new(Game.all, Team.all, GameTeam.all)
  end

  def test_it_exists
    assert_instance_of Stats, @stats
  end

  def test_has_attributes
    assert_instance_of Game, @stats.games.first
    assert_instance_of Team, @stats.teams.first
    assert_instance_of GameTeam, @stats.game_teams.first
  end

  def test_find_team_by_id
    assert_equal 'Reign FC', @stats.team_by_id("54").team_name
  end

  def test_all_games_by_team
    assert_equal 5, @stats.all_games_by_team("30").length
    assert_instance_of GameTeam, @stats.all_games_by_team("30").first
    assert_instance_of GameTeam, @stats.all_games_by_team("30").last
  end

  
  def test_all_games_by_team
    assert_equal 5, @stats.all_games_by_team("30").length
    assert_instance_of GameTeam, @stats.all_games_by_team("30").first
    assert_instance_of GameTeam, @stats.all_games_by_team("30").last
  end

  def test_calculate_win_percentage_method
    test_team_games = @stats.all_games_by_team('52')
    assert_equal 0.8, @stats.calculate_win_percentage(test_team_games)
  end

  def test_average_method
    assert_equal 0.5, @stats.average(1,2)
  end
end
