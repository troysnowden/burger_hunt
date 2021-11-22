RSpec.feature "Player can register: ", type: :feature do
  
  scenario "players can enter their name on the register page" do
    visit ('/register')
    expect(page).to have_content 'Username'
    expect(page).to have_button 'Create User'
    click_button 'Create User'
    expect(page).to have_current_path '/game/home'
  end

end