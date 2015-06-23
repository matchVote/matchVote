class MatchCalculator
  WEIGHTS = { 0 => 0, 1 => 1, 2 => 10, 3 => 50, 4 => 250 }

  def initialize(one, two)
    @one = one
    @two = two
  end

  def overall_percent
    results = calculate_totals_for_shared_stances
    one_percent_match = results[:one][:score] / results[:one][:importance_total].to_f
    two_percent_match = results[:two][:score] / results[:two][:importance_total].to_f
    (one_percent_match * two_percent_match) ** (1.0 / results[:stance_count])
  end

  def calculate_totals_for_shared_stances
    shared_stances.reduce(initial_hash) do |acc, stances|
      if stances.count == 2
        one = stances.first
        two = stances.last

        acc[:one][:importance_total] += two_weighted = WEIGHTS[two.importance_value]
        acc[:two][:importance_total] += one_weighted = WEIGHTS[one.importance_value]

        if one.agreeance_value == two.agreeance_value
          acc[:one][:score] += two_weighted
          acc[:two][:score] += one_weighted
        end

        acc[:stance_count] += 1
      end
      acc
    end
  end

  def shared_stances
    Stance.where(opinionable_id: [@one.id, @two.id]).
      group_by { |s| s.statement_id }.values
  end

  private
    def initial_hash
      { one: { importance_total: 0, score: 0 },
        two: { importance_total: 0, score: 0 },
        stance_count: 0 }
    end
end

