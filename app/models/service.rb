class Service < ApplicationRecord
  belongs_to :client
  validates :description, presence: true
  validates :client, presence: true
  before_save :upcase_description
  
  private
  def upcase_description
    self.description = description.upcase
  end
end
