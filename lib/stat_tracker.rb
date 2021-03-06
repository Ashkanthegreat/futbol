require_relative 'game_team'
require_relative 'game'
require_relative 'team'
require_relative 'season_stats'
require_relative 'team_stats'
require_relative 'league_stats'
require_relative 'game_stats'

class StatTracker

  attr_reader :game_stats, :league_stats, :season_stats, :team_stats

  def self.from_csv(locations)
    games_path = locations[:games]
    teams_path = locations[:teams]
    game_teams_path = locations[:game_teams]
    StatTracker.new(games_path, teams_path, game_teams_path)
  end

  def initialize(games_path, teams_path, game_teams_path) #parent class?
    Game.from_csv(games_path)
    Team.from_csv(teams_path)
    GameTeam.from_csv(game_teams_path)
    @game_stats = GameStats.new(Game.all, Team.all, GameTeam.all)
    @league_stats = LeagueStats.new(Game.all, Team.all, GameTeam.all)
    @season_stats = SeasonStats.new(Game.all, Team.all, GameTeam.all)
    @team_stats = TeamStats.new(Game.all, Team.all, GameTeam.all)
  end

  def percentage_home_wins
    @game_stats.percentage_home_wins
  end

  def percentage_visitor_wins
    @game_stats.percentage_visitor_wins
  end

  def percentage_ties
    @game_stats.percentage_ties
  end

  def count_of_games_by_season
    @game_stats.count_of_games_by_season
  end

  def highest_total_score
    @game_stats.highest_total_score
  end

  def lowest_total_score
    @game_stats.lowest_total_score
  end

  def average_goals_per_game
    @game_stats.average_goals_per_game
  end

  def average_goals_by_season
    @game_stats.average_goals_by_season
  end

  def count_of_teams
    @league_stats.count_of_teams
  end

  def best_offense
    @league_stats.best_offense
  end

  def worst_offense
    @league_stats.worst_offense
  end

  def highest_scoring_visitor
    @league_stats.highest_scoring_visitor
  end

  def highest_scoring_home_team
    @league_stats.highest_scoring_home_team
  end

  def lowest_scoring_visitor
    @league_stats.lowest_scoring_visitor
  end

  def lowest_scoring_home_team
    @league_stats.lowest_scoring_home_team
  end

  def winningest_coach(season)
    @season_stats.winningest_coach(season)
  end

  def worst_coach(season)
    @season_stats.worst_coach(season)
  end

  def most_accurate_team(season)
    @season_stats.most_accurate_team(season)
  end

  def least_accurate_team(season)
    @season_stats.least_accurate_team(season)
  end

  def most_tackles(season)
    @season_stats.most_tackles(season)
  end

  def fewest_tackles(season)
    @season_stats.fewest_tackles(season)
  end

  def team_info(team_id)
    @team_stats.team_info(team_id)
  end

  def best_season(team_id)
    @team_stats.best_season(team_id)
  end

   def worst_season(team_id)
     @team_stats.worst_season(team_id)
   end

  def average_win_percentage(team_id)
    @team_stats.average_win_percentage(team_id)
  end

  def all_games_by_team(team_id)
    @team_stats.all_games_by_team(team_id)
  end

  def most_goals_scored(team_id)
    @team_stats.most_goals_scored(team_id)
  end

  def fewest_goals_scored(team_id)
    @team_stats.fewest_goals_scored(team_id)
  end

  def favorite_opponent(team_id)
    @team_stats.favorite_opponent(team_id)
  end

  def rival(team_id)
    @team_stats.rival(team_id)
  end
end
