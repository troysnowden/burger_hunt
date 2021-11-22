RSpec.feature "Page 3", type: :feature do
  
  scenario "Player can visit page 3 and see puzzle" do
    visit ('/game/page3')
    expect(page).to have_content 'Puzzle Text'
    expect(page).to have_button 'Submit Answer'
  end

  scenario "Players can submit incorrect answer 3 times and have hint appear" do
    visit ('/game/page3')
    3.times do
      fill_in "puzzle_answer", with: "[puzzle-answer]"
      click_button 'Submit Answer'
    end
    expect(page).to have_current_path '/game/page3'
    expect(page).to have_content 'Hint here'
  end

  scenario "Players can submit correct answer have 'move' button appear" do
    visit ('/game/page3')
    fill_in "puzzle_answer", with: "[correct-puzzle-answer]"
    click_button 'Submit Answer'
    expect(page).to have_button 'Move'
    click_button 'Move'
    expect(page).to have_current_path '/game/page5'
  end

end