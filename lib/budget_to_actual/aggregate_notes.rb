module BudgetToActual
  module AggregateNotes
    # @return [String, nil]
    def notes
      [@cause, @memo]
        .tap(&:compact!)
        .map!(&:strip)
        .delete_if(&:empty?)
        .join("; ")
        .then { _1 unless _1.empty? }
    end
  end
end
