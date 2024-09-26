require_relative "transaction"
require_relative "transfer_payee"

module BudgetToActual
  class Deposit < Transaction
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
