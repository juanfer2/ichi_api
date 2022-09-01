require 'simplecov'
SimpleCov.start

# Gems
require 'httparty'

# Lib
require 'ichi_api'
require 'ichi_api/clients/ip_api'
require 'pry'

RSpec.configure do |config|
  config.example_status_persistence_file_path = '.rspec_status'
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.before(:all) do
    IchiApi.configure do |config|
      config.url = 'url'
      config.token = 'token'
      config.lang = 'lang'
    end
  end
end


private 

def pse_params
  {
    extraParameters: {
      RESPONSE_URL: @params[:confirmation_url],
      FINANCIAL_INSTITUTION_CODE: @params[:pse_bank_code],
      USER_TYPE: @params[:pse_user_type],
      PSE_REFERENCE2: @params[:pse_user_document_type],
      PSE_REFERENCE3: @params[:pse_user_dni]
    }
  }
end
