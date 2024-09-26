require_relative "transaction"

module BudgetToActual
  class Transfer < Transaction
    NULL_PAYEE = "(null)".freeze
    EXPECTED_DIRECTION = "In".freeze

    def initialize(*base_attributes, cause, direction)
      super(*base_attributes)
      @cause = cause
      @direction = direction
    end

    # @return [Money]
    # @raise [Error]
    def amount
      raise Error unless @direction == EXPECTED_DIRECTION
      super
    end

    # @return [String, nil]
    def payee
      return if @payee == NULL_PAYEE
      super
    end

    # @return [String, nil]
    def notes
      @cause&.strip
    end
  end
end
