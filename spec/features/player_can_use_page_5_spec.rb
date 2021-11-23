RSpec.feature "Page 5: ", type: :feature do
  
  scenario "player can see buttons on page 5" do
    visit ('game/page-5')
    expect(page).to have_button 'Wrong'
    expect(page).to have_button 'Correct'
  end

  scenario "player moves to page 6 when they click on the 'Wrong' button" do
    visit ('game/page-5')
    click_button 'Wrong' 
    expect(page).to have_current_path '/game/page-6'
  end

  scenario "player moves to 'Win' when they click on the 'Correct' button" do
    visit ('game/page-5')
    click_button 'Correct' 
    expect(page).to have_current_path '/game/win'
  end

end
