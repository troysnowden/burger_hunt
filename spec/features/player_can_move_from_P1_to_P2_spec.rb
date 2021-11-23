RSpec.feature "Player can move from page1 to page2", type: :feature do
  
  scenario "players can move from page1 to page2 by clicking button" do
    visit ('/game/page1')
    expect(page).to have_button 'Leave the House'
    click_button 'Leave the House'
    expect(page).to have_current_path '/game/page2'
  end

end