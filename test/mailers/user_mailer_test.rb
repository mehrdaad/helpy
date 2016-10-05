require 'test_helper'

class TopicMailerTest < ActionMailer::TestCase

  setup do
    set_default_settings
  end

  test 'No mail sent if setting disabled' do
    AppSettings['settings.welcome_email'] = false
    user = users(:user)
    email = UserMailer.new_user(user, 'token')

    assert_emails 0 do
      email.deliver_now
    end
  end
end
