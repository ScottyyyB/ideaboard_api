require 'rails_helper'

RSpec.describe Idea, type: :model do
  describe 'DB Table' do
    it { is_expected.to have_db_column :id }
    it { is_expected.to have_db_column :title }
    it { is_expected.to have_db_column :body }
  end

  describe 'Validations' do
    it { is_expected.to validate_uniqueness_of :title }
  end

  describe FactoryBot do
    it 'should be valid' do
      expect(FactoryBot.create(:idea)).to be_valid
    end
  end
  
end
