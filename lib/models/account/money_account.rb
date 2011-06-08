# encoding: utf-8
# author: Boris Barroso
# email: boriscyber@gmail.com
module  Models::Account
  module MoneyAccount
    def create_new_account
      self.build_account(
        :currency_id => self.currency_id || OrganisationSession.currency_id,
        :account_type_id => AccountType.org.scoped_by_account_number("bank").first.id
      ) {|a| 
        a.amount = amount
        a.initial_amount = amount 
      }
    end

  end
end
