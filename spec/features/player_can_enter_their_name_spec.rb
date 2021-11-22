RSpec.feature "Player can register: ", type: :feature do
  
  scenario "players can enter their name on the register page" do
    visit ('/register')
    expect(page).to have_content 'Enter your name'
    expect(page).to have_button 'Begin'
    click_button 'Begin'
    expect(page).to have_current_path '/game/home'
  end

end