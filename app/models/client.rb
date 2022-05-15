class Client < ApplicationRecord
  has_many :services, dependent: :destroy
  validates :name, :address, :city, presence: true
  before_save :upcase_name, :upcase_address, :upcase_city
  private

  def upcase_name
    self.name = name.upcase
  end

  def upcase_address
    self.address = address.upcase
  end

  def upcase_city
    self.city = city.upcase
  end
end
