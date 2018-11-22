require 'oauth2'

module BitRabbit::AccountService
  module OAuth
    class Client < ::OAuth2::AccessToken
      BaseURL = '/oauth/v1'
      def transfer(currency:, to:, amount:)
        post("#{BaseURL}/transfers", body: {
                  currency: currency,
                  to: to,
                  amount: amount
                }).parsed
      end

      def me
        get("#{BaseURL}/me").parsed
      end

      def get_accounts
        res = get("#{BaseURL}/accounts").parsed
        if res['success']
          res['data']
        else
          raise res['errors']
        end
      end
    end
  end
end