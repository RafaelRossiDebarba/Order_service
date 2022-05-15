require "test_helper"

class ServiceTest < ActiveSupport::TestCase
  
  test "Insert" do
    service = Service.new
    service.description = "Descricao"
    service.price = 10.00
    service.client = Client.first

    assert service.save

    service = Service.where(description: "DESCRICAO").first

    assert_equal 10.00, service.price
    assert_equal "JOÃO", service.client.name
  end

  test "Without description" do
    service = Service.new
    service.price = 10.00
    service.client = Client.first

    assert !service.save, "Description can't be blank"
  end
end
