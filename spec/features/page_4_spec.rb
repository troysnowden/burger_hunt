RSpec.feature "Page 4", type: :feature do
  
  scenario "Player can visit page 4 and see puzzle" do
    visit ('/game/page4')
    expect(page).to have_content "I'll let you on your way if you can solve this riddle"
    expect(page).to have_button 'Submit Answer'
  end

  scenario "Players can submit incorrect answer 3 times and have hint appear" do
    visit ('/game/page4')
    3.times do
      fill_in "puzzle_answer_input", with: "[puzzle-answer]"
      click_button 'Submit Answer'
    end
    expect(page).to have_current_path '/game/page4'
    expect(page).to have_content 'Hint!'
  end

  scenario "Players can submit correct answer have 'move' button appear" do
    visit ('/game/page4')
    fill_in "puzzle_answer_input", with: "mount everest"
    click_button 'Submit Answer'
    expect(page).to have_link 'Move'
    click_link 'Move'
    expect(page).to have_current_path '/game/page5'
  end

  scenario "Players can submit correct answer have 'move' button appear" do
    visit ('/game/page4')
    fill_in "puzzle_answer_input", with: "Everest"
    click_button 'Submit Answer'
    expect(page).to have_link 'Move'
    click_link 'Move'
    expect(page).to have_current_path '/game/page5'
  end

  scenario "Players can submit correct answer have 'move' button appear" do
    visit ('/game/page4')
    fill_in "puzzle_answer_input", with: "EVEREst"
    click_button 'Submit Answer'
    expect(page).to have_link 'Move'
    click_link 'Move'
    expect(page).to have_current_path '/game/page5'
  end

end