require "csv"

module BudgetToActual
  class Transaction
    CSV_HEADERS = %i[account amount category date notes payee type].freeze
    DATE_FORMAT = "%d/%m/%y".freeze

    def initialize(account, envelope, date, payee, amount)
      @account = account
      @amount = amount
      @date = date
      @envelope = envelope
      @payee = payee
    end

    # @return [String]
    def account
      @account.strip
    end

    # @return [Money]
    def amount
      Monetize.parse(@amount)
    end

    # @return [String, nil]
    def category
      @envelope
        .strip
        .then { _1 unless _1.empty? }
    end

    # @return [Date]
    def date
      Date.strptime(@date, DATE_FORMAT)
    end

    # @return [String]
    def payee
      @payee.strip
    end

    # @return [Hash]
    def to_h
      {
        account: account,
        amount: amount,
        category: category,
        date: date.iso8601,
        notes: notes,
        payee: payee,
        type: self.class.to_s
      }
    end

    def to_csv_row
      CSV::Row.new(*to_h.then { [_1.keys, _1.values] })
    end
  end
end
