require_relative "aggregate_notes"
require_relative "negate_amount"
require_relative "transaction"

module BudgetToActual
  class Check < Transaction
    include AggregateNotes
    include NegateAmount

    def initialize(*base_attributes, cause, number, memo)
      super(*base_attributes)
      @cause = cause
      @memo = memo
      @number = number
    end
  end
end
