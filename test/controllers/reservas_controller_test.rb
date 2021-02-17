require 'test_helper'

class ReservasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @reserva = reservas(:one)
  end

  test "should get index" do
    get reservas_url
    assert_response :success
  end

  test "should get new" do
    get new_reserva_url
    assert_response :success
  end

  test "should create reserva" do
    assert_difference('Reserva.count') do
      post reservas_url, params: { reserva: { cliente_id: @reserva.cliente_id, pagamento_no_destino: @reserva.pagamento_no_destino, reservado_ate: @reserva.reservado_ate, reservado_de: @reserva.reservado_de, tempo_de_espera: @reserva.tempo_de_espera, valor_alugado: @reserva.valor_alugado, veiculo_id: @reserva.veiculo_id } }
    end

    assert_redirected_to reserva_url(Reserva.last)
  end

  test "should show reserva" do
    get reserva_url(@reserva)
    assert_response :success
  end

  test "should get edit" do
    get edit_reserva_url(@reserva)
    assert_response :success
  end

  test "should update reserva" do
    patch reserva_url(@reserva), params: { reserva: { cliente_id: @reserva.cliente_id, pagamento_no_destino: @reserva.pagamento_no_destino, reservado_ate: @reserva.reservado_ate, reservado_de: @reserva.reservado_de, tempo_de_espera: @reserva.tempo_de_espera, valor_alugado: @reserva.valor_alugado, veiculo_id: @reserva.veiculo_id } }
    assert_redirected_to reserva_url(@reserva)
  end

  test "should destroy reserva" do
    assert_difference('Reserva.count', -1) do
      delete reserva_url(@reserva)
    end

    assert_redirected_to reservas_url
  end
end
