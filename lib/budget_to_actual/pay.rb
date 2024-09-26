require_relative "transaction"

module BudgetToActual
  class Pay < Transaction
    # @return [String]
    def category
      super or "Income"
    end

    # @return [nil]
    def notes
      nil
    end
  end
end
