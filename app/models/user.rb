class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events, dependent: :destroy

  validates :name, length: {maximum: 255}

  before_create :set_name

  private

  def set_name
    self.name = "Товарисч №#{rand(777)}" if self.name.blank?
  end
end
