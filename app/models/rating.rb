# frozen_string_literal: true

class Rating < ApplicationRecord
    belongs_to :movie
    belongs_to :user
end
