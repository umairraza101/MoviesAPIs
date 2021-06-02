# frozen_string_literal: true

class MovieCatalog < ApplicationRecord
  belongs_to :movie
  validates_presence_of :price, :time, :movie_id
end
