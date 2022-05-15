require "test_helper"

class ServiceFlowsTest < ActionDispatch::IntegrationTest

  test 'include Service' do
    get new_service_path
    assert_response :success

    service = Service.new
    service.description = "Servico integração"
    service.price = 10
    service.client = Client.first

    post services_path, params: service, as: :json
    assert_response :success
    assert_equal '/services', path

  end

  test 'Error description Include Service' do
    get new_service_path
    assert_response :success

    service = Service.new
    service.price = 10
    service.client = Client.first

    post services_path, params: service, as: :json
    assert_equal 422, status
  end

  test 'Error client Include Service' do
    get new_service_path
    assert_response :success

    service = Service.new
    service.description = "Servico integração"
    service.price = 10

    post services_path, params: service, as: :json
    assert_equal 422, status
  end
end
