class Application < ApplicationRecord
  validates :url, uniqueness: { case_sensitive: false, message:"This url already exists in an existing application." }
  belongs_to :user
  has_many :events, dependent: :destroy
end
