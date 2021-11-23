RSpec.feature "Landing page: ", type: :feature do
  
  scenario "players begin on the landing page" do
    visit ('/')
    expect(page).to have_content 'Burger Hunt'
  end

end