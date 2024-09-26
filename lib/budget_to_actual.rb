require "bigdecimal"
require "monetize"
require_relative "budget_to_actual/atm_withdrawal"
require_relative "budget_to_actual/charge"
require_relative "budget_to_actual/check"
require_relative "budget_to_actual/debit"
require_relative "budget_to_actual/deposit"
require_relative "budget_to_actual/pay"
require_relative "budget_to_actual/split"
require_relative "budget_to_actual/transfer"
require_relative "budget_to_actual/version"

module BudgetToActual
  class Error < StandardError; end

  Money.default_currency = Money::Currency.new("AUD")
  Money.locale_backend = :currency
  Money.rounding_mode = BigDecimal::ROUND_HALF_EVEN

  def self.transaction_for(type, *fields)
    case type
    when "A" then AtmWithdrawal
    when "C"
      case fields.length
      when 7 then Debit
      when 8 then Check
      else raise Error
      end
    when "D" then Deposit
    when "H" then Charge
    when "M" then Split
    when "P" then Pay
    when "T" then Transfer
    else raise Error
    end.new(*fields)
  end
end
