require "application_system_test_case"

class ServicesTest < ApplicationSystemTestCase
  setup do
    @service = services(:one)
  end

  test "Fluxo Normal" do
    visit services_url
    click_button "Novo Serviço"

    select("RAFAEL", from: 'service_client_id')
    fill_in "service_description", with: @service.description
    fill_in "service_price", with: @service.price
    click_button "Salvar"

    assert_text "Servico cadastrado."
    assert_selector "p", text: "SERVICE 1"
    assert_selector "p", text: "59.99"
    assert_selector "p", text: "1"
  end

  test "Fluxo Exepcional 1" do
    visit services_url
    click_button "Novo Serviço"

    select("RAFAEL", from: 'service_client_id')
    fill_in "service_description", with: @service.description
    fill_in "service_price", with: @service.price
    click_button "Voltar"

    assert_equal "/services", current_path
  end

  test "Fluxo Exepcional 2" do
    visit services_url
    click_button "Novo Serviço"

    select("RAFAEL", from: 'service_client_id')
    fill_in "service_price", with: "0l"
    click_button "Salvar"

    assert_selector "li", text: "Description can't be blank"

    assert_equal "/services/new", current_path
  end

  test "visiting the index" do
    visit services_url
    assert_selector "h1", text: "Services"
  end

  test "should update Service" do
    visit service_url(@service)
    click_button "Editar", match: :first

    select("RAFAEL", from: 'service_client_id')
    fill_in "service_description", with: @service.description
    fill_in "service_price", with: @service.price
    click_button "Salvar"

    assert_text "Serviço atualizado."
    click_button "Voltar"
  end

  test "should destroy Service" do
    visit service_url(@service)
    click_button "Deletar", match: :first

    assert_text "Serviço foi deletado."
  end
end
