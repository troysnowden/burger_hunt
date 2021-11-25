RSpec.feature "Navigation Bar: ", type: :feature do
  
  scenario "players can see the navigation bar on the landing page" do
    visit ('/')
    expect(page).to have_link 'How to play'
    expect(page).to have_link 'Log in'
  end

  scenario "players can see the navigation bar on the register page" do
    visit ('/register')
    expect(page).to have_link 'How to play'
    expect(page).to have_link 'Log in'
  end

  scenario "players can see the pocket button if logged in" do
    visit ('/register')
    fill_in "user_username", with: "johnsmith"
    fill_in "user_password", with: "password"
    click_button "Register"
    expect(page).to have_link 'How to play'
    expect(page).to_not have_link 'Log in'
    expect(page).to have_button 'Pocket'
    click_button "Pocket"
    expect(page).to have_content "Chocolate Bar - Equipped"
    expect(page).to have_content "T-Rex Egg"
  end

  scenario "player can equip item" do
    visit ('/register')
    fill_in "user_username", with: "johnsmith"
    fill_in "user_password", with: "password"
    click_button "Register"
    click_button "Pocket"
    click_button "Equip"
    expect(page).to_not have_content "Chocolate Bar - Equipped"
    expect(page).to have_content "T-Rex Egg - Equipped"
    click_button "Equip"
    expect(page).to have_content "Chocolate Bar - Equipped"
    expect(page).to_not have_content "T-Rex Egg - Equipped"
  end

  scenario "players can see the 'Start again' button if logged in" do
    visit ('/register')
    fill_in "user_username", with: "johnsmith"
    fill_in "user_password", with: "password"
    click_button "Register"
    expect(page).to have_link 'How to play'
    expect(page).to have_link 'Start again'
    expect(page).to_not have_link 'Log in'
  end
end