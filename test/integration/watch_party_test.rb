require 'test_helper'
require 'capybara/rails'
require 'capybara/minitest'


class WatchPartyTest < ActionDispatch::IntegrationTest
  include Capybara::DSL
  include Capybara::Minitest::Assertions

  def test_party_watch
    party = Party.create(session_id: "test_session")
    visit("/#{party.id}")
    click_on('Vote')

    visit("/#{party.id}/watch")
    assert_content('1 votes are in!')
  end

  def test_link_to_watch_from_party_path
    party = Party.create(session_id: "test_session")
    visit("/#{party.id}")

    assert_link('Watch', "/#{party.id}/watch")
  end

  def teardown
    Capybara.reset_sessions!
    Capybara.use_default_driver
  end

end
