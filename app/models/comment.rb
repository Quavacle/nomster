class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :place
    validates :message, presence: true
    validates :rating, presence: true
end
