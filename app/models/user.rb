# frozen_string_literal: true

class User < ApplicationRecord
  has_many :trips
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, presence: true

  scope :is_driver, -> { where("'driver' = ANY(role)") }

  def name
    display_name || first_name.capitalize + ' ' + last_name.capitalize
  end
end
