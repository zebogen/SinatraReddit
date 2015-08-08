module Votable

  def score
    self.votes.reduce(0) { |total, vote| total + vote.value }
  end

end
