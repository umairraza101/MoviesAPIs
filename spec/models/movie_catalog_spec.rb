require 'rails_helper'
require 'swagger_helper'

RSpec.describe MovieCatalog, type: :model do
  describe 'relation' do
    it { should belong_to(:movie) }
  end
end
