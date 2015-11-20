class Album < ActiveRecord::Base

  validates :title, presence: true

  belongs_to :band

  has_many :tracks
end
