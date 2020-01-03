require 'rails_helper'

describe "When I visit merchant" do
  before :each do
    @apple_nyc = Merchant.create!(name: "Apple NYC", address: "123 Bear st.", city: "New York", state: "NY", zip: "80220")
    @apple_la = Merchant.create!(name: "Apple L.A.", address: "456 Fish st.", city: "Los Angeles", state: "CA", zip: "80221")
  end
  it "Can see a link to create a new merchant" do
    visit '/merchants'
    expect(page).to have_content(@apple_nyc.name)
    expect(page).to have_link('New Merchant')
  end
    #

  it "When clicked I am taken to '/merchants/new' " do
    visit '/merchants'

    expect(page).to have_link('New Merchant')

    click_link 'New Merchant'


    expect(current_path).to eq('/merchants/new')
  end
    #   it "When I fill out with a new merchant's information and click submit a `POST` request is sent to '/merchants' and a new merchant is craeted" do
    #     it "redirected to merchant Index and new Merchant is listed" do
    #
    #
    #   end
    # end
end

















# User Story 4, Merchant Creation
#
# As a visitor
# When I visit the Merchant Index page
# Then I see a link to create a new merchant
# When I click this link
# Then I am taken to '/merchants/new' where I  see a form for a new merchant
# When I fill out the form with a new merchant's:
# - name
# - address
# - city
# - state
# - zip
# And I click the button to submit the form
# Then a `POST` request is sent to '/merchants',
# a new merchant is created,
# and I am redirected to the Merchant Index page where I see the new Merchant listed.
