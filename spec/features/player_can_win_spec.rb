RSpec.feature "Player can win", type: :feature do

  scenario "player moves to 'Win' when they click on the 'Correct' button on page5" do
    allow_any_instance_of(GameController).to receive(:autosave).and_return(true)
    visit ('game/page5')
    click_link 'Right' 
    expect(page).to have_current_path '/game/win'
  end

end
