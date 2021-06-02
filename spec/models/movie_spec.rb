require 'rails_helper'
require 'swagger_helper'

RSpec.describe Movie, type: :model do
  describe 'relation' do
    it { should have_many(:ratings) }
    it { should have_many(:movie_catalogs) }
  end
end
