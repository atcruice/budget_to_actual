module BudgetToActual
  module TransferPayee
    OLD_ACCOUNT_SUFFIX = " (PayPal)".freeze
    TRANSFER_PREFIX = "Transfer ".freeze

    # @return [String]
    def payee
      _payee = super
      return _payee unless _payee.start_with?(TRANSFER_PREFIX)

      _payee.delete_suffix!(OLD_ACCOUNT_SUFFIX)
      _payee.split.last
    end
  end
end
