require 'test_helper'

class Test2Test < ActionDispatch::IntegrationTest
  test 'about page has expected title and heading' do
    get '/about'
    assert_select 'title', 'About'
    assert_select 'h1', 'About'
  end

  test 'about page has expected content' do
    get '/about'
    assert_match 'Welcome to public/about.html!', response.body
  end
  # test "the truth" do
  #   assert true
  # end
end
