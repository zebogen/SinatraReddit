module Votable

  def score
    self.votes.reduce(0) { |total, vote| total + vote.value }
  end

  def self.all_by_score
    self.all.sort_by { |a, b| a.score }
  end

end
