RSpec.feature "Landing page: ", type: :feature do
  
  scenario "players begin on the landing page" do
    visit ('/')
    expect(page).to have_content 'Burger Hunt'
  end

  scenario "players click on the arrow to register" do
    visit ('/')
    expect(page).to have_css('img', id: "neon-arrow-image")
    # click_link 
    # expect(page).to have_current_path '/game/register'
  end

end