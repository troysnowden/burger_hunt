RSpec.feature "Page 5: ", type: :feature do
  
  scenario "player can see 'Left' button on page 5" do
    allow_any_instance_of(GameController).to receive(:autosave).and_return(true)
    visit ('game/page5')
    expect(page).to have_link 'Left'
  end

  scenario "player moves to page 6 when they click on the 'Left' button" do
    allow_any_instance_of(GameController).to receive(:autosave).and_return(true)
    visit ('game/page5')
    click_link 'Left' 
    expect(page).to have_current_path '/game/page6'
  end

  scenario "player moves to 'Win' when they click on the 'Right' button" do
    allow_any_instance_of(GameController).to receive(:autosave).and_return(true)
    visit ('game/page5')
    click_link 'Right' 
    expect(page).to have_current_path '/game/win'
  end

  scenario "player moves to page 6, then returns to page 5, and gets a hint about carrots" do
    allow_any_instance_of(GameController).to receive(:autosave).and_return(true)
    visit ('game/page5')
    expect(page).not_to have_text 'HINT' 
    click_link 'Left'
    expect(page).to have_current_path '/game/page6'
    click_link 'Go Back'
    expect(page).to have_current_path '/game/page5'
    expect(page).to have_text 'HINT'
  end

  # scenario "player can only see 'Right' button at full brightness when they have eaten 3 carrots" do
  #   visit ('game/page5')
  #   expect(page).to have_link 'CARROT'
  #   click_link 'CARROT'
  #   click_link 'CARROT'
  #   click_link 'CARROT'
  #   click_link 'CARROT'
  #   expect(page).to have_link 'Right'
  # end

end
