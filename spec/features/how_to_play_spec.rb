RSpec.feature "How to play", type: :feature do
  scenario "Players can access the how to play modal" do
    visit ('/')
    click_button 'How to play'
    expect(page).to have_content 'Here\'s how to play Buger Hunt'
  end
end
