require 'test_helper'
require 'capybara/rails'
require 'capybara/minitest'

class CreatingAPartyTest < ActionDispatch::IntegrationTest
  include Capybara::DSL
  include Capybara::Minitest::Assertions

  def test_reset_button_availability
    visit('/')
    click_on('Start a party')
    click_on('Vote!')

    assert_button('Restart!')
  end

  def test_no_reset_button_if_not_creator
    party = Party.create(session_id: "test_session")
    visit("/#{party.id}")
    click_on('Vote')
    assert_no_button('Restart!')
  end


  def teardown
    Capybara.reset_sessions!
    Capybara.use_default_driver
  end
end
