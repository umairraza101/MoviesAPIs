# frozen_string_literal: true

class Movie < ApplicationRecord
    has_many :ratings
    has_many :movie_catalogs
end
