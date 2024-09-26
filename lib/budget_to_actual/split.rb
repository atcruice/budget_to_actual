require_relative "transaction"

module BudgetToActual
  class Split < Transaction
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
