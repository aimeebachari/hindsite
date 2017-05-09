require 'rails_helper'

RSpec.describe 'Event' do

  describe 'create' do
    it 'generates lat and lng upon creation' do
      event = Event.create(
        name: "Launch",
        date: "2017",
        address: "77 Summer St. Boston, MA 02111",
        description: "Launch moves to Downtown Crossing."
      )

      expect(event.latitude).to eq(42.3540204)
      expect(event.longitude).to eq(-71.05887299999999)
    end
  end

  describe 'update' do
    it 'updates lat and lng with address change' do
      event = Event.create(
        name: "Launch",
        date: "2017",
        address: "77 Summer St. Boston, MA 02111",
        description: "Launch moves to Downtown Crossing."
      )

      event.update(address: "14 Field St. Seekonk, MA 02771")

      expect(event.save).to be true
      expect(event.latitude).to eq(41.844338)
      expect(event.longitude).to eq(-71.338703)
    end
  end

end
