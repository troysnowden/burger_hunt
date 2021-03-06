RSpec.feature "Register", type: :feature do

  scenario "Player can click on arrow to register" do
    visit "/"
    expect(page).to have_css('img', id: "neon-arrow-image")
    click_link 'Click here to start game'
    # Capybara looks for alt text and clicks the link
    expect(page).to have_current_path '/register'
  end

  scenario "Player can register to play game" do
    allow_any_instance_of(GameController).to receive(:autosave).and_return(true)
    visit "/register"
    fill_in "user[username]", with: "user1"
    fill_in "user[password]", with: "test"
    click_button "Register"
  end

end