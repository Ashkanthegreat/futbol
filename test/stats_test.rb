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

  def test_total_games_and_goals_by_team
    assert_equal [7, 5], @stats.total_games_and_goals_by_team("30", nil)
  end

  def test_add_goals_and_games
    goals_games = [0, 0]
    game_team = mock
    game_team.stubs(:goals).returns(2)
    @stats.add_goals_and_games(goals_games, game_team)
    assert_equal [2, 1], goals_games
  end

  def test_it_can_find_average_goals_by_team
    assert_equal 2.4, @stats.average_goals_by_team("52")
  end

  def test_it_can_find_unique_team_id
    assert_equal ["30", "52", "19", "23", "24", "4", "29", "12", "6", "17", "1", "2"], @stats.unique_team_ids
  end

  def test_find_team_by_id
    assert_equal 'Reign FC', @stats.team_by_id("54").team_name
  end

  def test_games_by_season
    test_season = @stats.team_games_by_season("20172018")
    assert_equal 10, test_season.length
    assert_instance_of GameTeam, test_season.first
  end

end
