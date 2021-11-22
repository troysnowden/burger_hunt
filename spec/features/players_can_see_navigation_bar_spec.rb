RSpec.feature "Navigation Bar: ", type: :feature do
  
  scenario "players can see the navigation bar on the landing page" do
    visit ('/')
    expect(page).to have_button 'How to play'
    expect(page).to have_button 'Log in'
  end

  # scenario "players can see the navigation bar on the register page" do
  #   visit ('/register')
  #   expect(page).to have_button 'How to play'
  #   expect(page).to have_button 'Log in'
  # end

end