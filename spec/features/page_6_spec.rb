RSpec.feature "Page 6", type: :feature do
  scenario "Player can visit page 6 and reach a dead end" do
    visit ('/game/page6')
    expect(page).to have_content "Your instincts took you left… your instincts were wrong."
    expect(page).to have_link 'Question: Why does a bicycle have 3 wheels?...'
  end

  scenario "Player can visit page 6 and click the question button" do
    visit ('/game/page6')
    click_link 'Question: Why does a bicycle have 3 wheels?...'
    expect(page).to have_content "The bike is the definition of being a third wheel."
  end

end
