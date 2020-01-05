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
    it "When I fill out with a new merchant's information and click submit a `POST` request is sent to '/merchants' and a new merchant is craeted" do
      visit '/merchants/new'

      name = "Apple DVNR"
      address = "789 Dog st."
      city = "Denver"
      state = "Colorado"
      zip = "80222"

      fill_in "Name", with: name
      fill_in "Address", with: address
      fill_in "City", with: city
      fill_in "State", with: state
      fill_in "Zip", with: zip

      click_on "Submit"

      expect(current_path).to eq('/merchants')

      expect(page).to have_content(@apple_nyc.name)
      expect(page).to have_content(name)
    end
end
