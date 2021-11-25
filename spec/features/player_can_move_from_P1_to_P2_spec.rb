RSpec.feature "Player can move from page1 to page2", type: :feature do
  
  scenario "players can move from page1 to page2 by clicking button" do
    allow_any_instance_of(GameController).to receive(:autosave).and_return(true)
    visit ('/game/page1')
    expect(page).to have_link 'Leave the House'
    click_link 'Leave the House'
    expect(page).to have_current_path '/game/page2'
  end

end