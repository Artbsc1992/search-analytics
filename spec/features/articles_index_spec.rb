require 'rails_helper'

RSpec.feature "Articles", type: :feature do

  before(:each) do
    @mock_user = User.new(
      name: 'John Doe',
      email: 'johndoe@gmail.com',
      password: '123456'
    )
  end

  it "Should allow access to articles index page" do
    sign_in @mock_user
    visit articles_path
    expect(current_path).to eq(articles_path)
  end

  it "Should redirect to login page if not logged in" do
    visit articles_path
    expect(current_path).to eq(new_user_session_path)
  end

  it "should have the content 'Best Books" do
    sign_in @mock_user
    visit articles_path
    expect(page).to have_content('Best Books')
  end

  it "shoudl have a search bar" do
    sign_in @mock_user
    visit articles_path
    expect(page).to have_field('Search articles by title')
  end

end
