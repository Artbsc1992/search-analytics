module MatchHelper
  def similar_chars?(char1, char2, threshold = 0.8)
    JaroWinkler.distance(char1, char2, ignore_case: true) >= threshold
  end
end