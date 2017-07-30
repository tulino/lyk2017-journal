# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  email      :string
#  password   :string
#  role       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord

  has_one :profile
  has_many :posts
  has_many :likes
  has_many :liked_posts, through: :likes, source: :post # iki user-post ilişkisi var like islemi için bu ilişki
  has_many :comments
  accepts_nested_attributes_for :profile
  validates :role, presence: true
  validates :email, presence: true, format: { with: /([\.\w\-]+@\w+\.\w{2,3}(?:\.?\.?\w{2,3})?)/ }
  validates :password, presence: true, length: { minimum: 8, maximum: 30 }
end
