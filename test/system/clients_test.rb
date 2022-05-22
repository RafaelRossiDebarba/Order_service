require "application_system_test_case"

class ClientsTest < ApplicationSystemTestCase
  setup do
    @client = clients(:one)
  end

  test "visiting the index" do
    visit clients_url
    assert_selector "h1", text: "Clientes"
  end

  test "should create client" do
    visit clients_url
    click_button "Novo Cliente"

    fill_in "Address", with: @client.address
    fill_in "City", with: @client.city
    fill_in "Name", with: @client.name
    click_button "Salvar"

    assert_text "Client was successfully created"
    click_button "Voltar"
  end

  test "should update Client" do
    visit client_url(@client)
    click_button "Editar", match: :first

    fill_in "Address", with: @client.address
    fill_in "City", with: @client.city
    fill_in "Name", with: @client.name
    click_button "Salvar"

    assert_text "Client was successfully updated"
    click_button "Voltar"
  end

  test "should destroy Client" do
    visit client_url(@client)
    click_on "Deletar", match: :first

    assert_text "Client was successfully destroyed"
  end
end
