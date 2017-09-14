require 'test_helper'
require 'capybara/rails'
require 'capybara/minitest'

class CreatingAPartyTest < ActionDispatch::IntegrationTest
  include Capybara::DSL
  include Capybara::Minitest::Assertions

  def test_pluralization
    visit('/')
    click_on('Start a party')
    click_on('Vote!')

    assert_content('1 vote is in')
    Party.last.votes.create(points: 0)

    visit("/#{Party.last.id}/result")

    assert_content('2 votes are in')
  end

  def teardown
    Capybara.reset_sessions!
    Capybara.use_default_driver
  end
end
