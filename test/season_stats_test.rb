require './test/test_helper'
require './lib/stats'
require './lib/season_stats'

class SeasonStatsTest < Minitest::Test

  def setup
    @season_stats = SeasonStats.new({
      games: "./test/fixtures/games_fixture.csv",
      teams: "./data/teams.csv",
      game_teams: "./test/fixtures/games_teams_fixture.csv"
      })
  end

  def test_existence
    assert_instance_of SeasonStats, @season_stats
  end

  def test_attributes
    assert_instance_of Game, SeasonStats.games.first
    assert_instance_of Team, SeasonStats.teams.first
    assert_instance_of GameTeam, SeasonStats.game_teams.first
  end

  def test_most_accurate_team
    assert_equal "Portland Thorns FC", @season_stats.most_accurate_team("20172018")
  end

  def test_it_can_find_least_accurate_team
    assert_equal "Orlando City SC", @season_stats.least_accurate_team("20172018")
  end

  def test_winningest_coach
    assert_equal "Paul Maurice", @season_stats.winningest_coach("20172018")
  end

  def test_worst_coach
    assert_equal "Bruce Boudreau", @season_stats.worst_coach("20172018")
  end

  def test_it_can_find_team_with_most_season_tackles
    assert_equal "Portland Thorns FC", @season_stats.most_tackles("20172018")
  end

  def test_it_can_find_team_with_least_season_tackles
    assert_equal "Orlando City SC", @season_stats.fewest_tackles("20172018")
  end

end