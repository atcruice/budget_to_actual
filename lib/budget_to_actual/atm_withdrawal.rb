require_relative "negate_amount"
require_relative "transaction"

module BudgetToActual
  class AtmWithdrawal < Transaction
    include NegateAmount

    def notes
      nil
    end
  end
end
