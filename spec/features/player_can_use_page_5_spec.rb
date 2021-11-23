RSpec.feature "Page 5: ", type: :feature do
  
  scenario "player can see buttons on page 5" do
    visit ('game/page5')
    expect(page).to have_link 'Wrong'
    expect(page).to have_link 'Correct'
  end

  # scenario "player moves to page 6 when they click on the 'Wrong' button" do
  #   visit ('game/page5')
  #   click_link 'Wrong' 
  #   expect(page).to have_current_path '/game/page6'
  # end

end
