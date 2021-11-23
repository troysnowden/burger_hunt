RSpec.feature "Page 5: ", type: :feature do
  
  scenario "player can see 'Left' button on page 5" do
    visit ('game/page5')
    expect(page).to have_link 'Left (wrong)'
  end

  scenario "player can only see 'Right' button when they have eaten 3 carrots" do
    visit ('game/page5')
    expect(page).to have_link 'CARROT'
    # click_link 'CARROT'
    # click_link 'CARROT'
    # click_link 'CARROT'
    # click_link 'CARROT'
    # expect(page).to have_link 'Right (correct)'
  end


  scenario "player moves to page 6 when they click on the 'Left (wrong)' button" do
    visit ('game/page5')
    click_link 'Left (wrong)' 
    expect(page).to have_current_path '/game/page6'
  end

  # scenario "player moves to 'Win' when they click on the 'Right (correct)' button" do
  #   visit ('game/page5')
  #   click_link 'Right (correct)' 
  #   expect(page).to have_current_path '/game/win'
  # end

  scenario "player moves to page 6, then returns to page 5, and gets a hint about carrots" do
    visit ('game/page5')
    expect(page).not_to have_text 'HINT' 
    click_link 'Left (wrong)'
    expect(page).to have_current_path '/game/page6'
    click_link 'Go back'
    expect(page).to have_current_path '/game/page5'
    expect(page).to have_text 'HINT'
  end

end
