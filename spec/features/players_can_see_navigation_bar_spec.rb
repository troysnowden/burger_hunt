RSpec.feature "Navigation Bar: ", type: :feature do
  
  scenario "players can see the navigation bar on the landing page" do
    expect(page).to have_button 'How to play'
  end

end