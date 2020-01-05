require 'rails_helper'

describe "Can update exsiting merchant" do
  before :each do
    @apple_nyc = Merchant.create!(name: "Apple NYC", address: "123 Bear st.", city: "New York", state: "NY", zip: "80220")
  end
  describe "When I visit a merchants show page I see an 'update' link " do
    it "directs to  '/merchants/:id/edit' where I see a form to edit the merchant's data" do
       visit "/merchants/#{@apple_nyc.id}"
       expect(page).to have_link('edit')

       click_on 'edit'

       expect(current_path).to eq("/merchants/#{@apple_nyc.id}/edit")

       fill_in 'name', with: "Orange NYC"

       click_on 'Update Merchant'

       expect(current_path).to eq("/merchants/#{@apple_nyc.id}")
       expect(page).to have_content("Orange NYC")
    end
  end
end
