RSpec.feature "Page 6", type: :feature do
  scenario "Player can visit page 6 and dead end" do
    visit ('/game/page6')
    expect(page).to have_content "Your instincts took you left… your instincts were wrong."
    expect(page).to have_link 'Question why a bicycle has 3 wheels...'
  end

end