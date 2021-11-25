RSpec.feature "Player can register: ", type: :feature do
  
  scenario "players can enter their name on the register page" do
    allow_any_instance_of(GameController).to receive(:autosave).and_return(true)
    visit ('/register')
    expect(page).to have_content 'Username'
    expect(page).to have_button 'Register'
    click_button 'Register'
    expect(page).to have_current_path '/game/page1'
  end

end