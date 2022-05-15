require "test_helper"

class ClientTest < ActiveSupport::TestCase
  
  test "Insert" do
    cliente = Client.new
    cliente.name = "Rafael Rossi"
    cliente.address = "Av principal"
    cliente.city = "Sananduva"

    assert cliente.save

    client = Client.where(name: "RAFAEL ROSSI").first

    assert_equal "RAFAEL ROSSI", client.name
    assert_equal "AV PRINCIPAL", client.address
    assert_equal "SANANDUVA", client.city
  end

  test "Without Name" do
    cliente = Client.new
    cliente.address = "Av principal"
    cliente.city = "Sananduva"

    assert !cliente.save, "Name can't be blank"
  end

  test "Without Address" do
    cliente = Client.new
    cliente.name = "Rafael Rossi"
    cliente.city = "Sananduva"

    assert !cliente.save, "Name can't be blank"
  end

  test "Without City" do
    cliente = Client.new
    cliente.name = "Rafael Rossi"
    cliente.address = "Av principal"

    assert !cliente.save, "City can't be blank"
  end
end
