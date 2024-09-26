require_relative "negate_amount"
require_relative "transaction"
require_relative "transfer_payee"

module BudgetToActual
  class Charge < Transaction
    include NegateAmount
    include TransferPayee

    def initialize(*base_attributes, cause)
      super(*base_attributes)
      @cause = cause
    end

    # @return [String, nil]
    def notes
      @cause&.strip
    end
  end
end
