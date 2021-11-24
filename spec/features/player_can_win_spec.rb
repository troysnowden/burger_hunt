RSpec.feature "Player can win", type: :feature do

  scenario "player moves to 'Win' when they click on the 'Correct' button on page5" do
    visit ('game/page5')
    click_link 'Correct' 
    expect(page).to have_current_path '/game/win'
  end

end