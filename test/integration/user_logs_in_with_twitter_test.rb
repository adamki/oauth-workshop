require 'test_helper'

class UserLogsInWithTwitterTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  def setup
    Capybara.app = OauthWorkshop::Application
    stub_omniauth
  end

  def stub_omniauth
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
      provider: "twitter",
      extra:{
        raw_info: {
          name: "adam",
          user_id: "1",
          screen_name: "adajensen",
        }
      },
      credentials: {
        token: "pizza",
        secret: "secretpizza"
      }
    })
  end

  test 'logging in' do
    visit '/'
    assert_equal 200, page.status_code
    click_link 'Login'
    assert_equal '/', current_path
    assert page.has_content?("adajensen")
    assert page.has_link?("Logout")
  end
end
