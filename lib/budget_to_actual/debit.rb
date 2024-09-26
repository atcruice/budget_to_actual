require_relative "aggregate_notes"
require_relative "negate_amount"
require_relative "transaction"
require_relative "transfer_payee"

module BudgetToActual
  class Debit < Transaction
    include AggregateNotes
    include NegateAmount
    include TransferPayee

    def initialize(*base_attributes, cause, memo)
      super(*base_attributes)
      @cause = cause
      @memo = memo
    end
  end
end
