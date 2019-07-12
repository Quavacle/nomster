class Place < ApplicationRecord
    paginates_per 5
    belongs_to :user
    has_many :comments
    geocoded_by :address
    after_validation :geocode
    validates :name, presence: true
    validates :address, presence: true
    validates :description, presence: true
end
