require 'rails_helper'

describe "When I visit '/merchants/:id'" do
  it "can see the specific merchant and it's attributes" do
    apple_nyc = Merchant.create!(name: "Apple NYC", address: "123 Bear st.", city: "Denver", state: "CO", zip: "80220")

     visit "/merchants/#{apple_nyc.id}"

     expect(current_path).to eq("/merchants/#{apple_nyc.id}")

     expect(page).to have_content(apple_nyc.name)
     expect(page).to have_content(apple_nyc.address)
     expect(page).to have_content(apple_nyc.city)
     expect(page).to have_content(apple_nyc.state)
     expect(page).to have_content(apple_nyc.zip)
  end
end
