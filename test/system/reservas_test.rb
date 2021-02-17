require "application_system_test_case"

class ReservasTest < ApplicationSystemTestCase
  setup do
    @reserva = reservas(:one)
  end

  test "visiting the index" do
    visit reservas_url
    assert_selector "h1", text: "Reservas"
  end

  test "creating a Reserva" do
    visit reservas_url
    click_on "New Reserva"

    fill_in "Cliente", with: @reserva.cliente_id
    check "Pagamento no destino" if @reserva.pagamento_no_destino
    fill_in "Reservado ate", with: @reserva.reservado_ate
    fill_in "Reservado de", with: @reserva.reservado_de
    fill_in "Tempo de espera", with: @reserva.tempo_de_espera
    fill_in "Valor alugado", with: @reserva.valor_alugado
    fill_in "Veiculo", with: @reserva.veiculo_id
    click_on "Create Reserva"

    assert_text "Reserva was successfully created"
    click_on "Back"
  end

  test "updating a Reserva" do
    visit reservas_url
    click_on "Edit", match: :first

    fill_in "Cliente", with: @reserva.cliente_id
    check "Pagamento no destino" if @reserva.pagamento_no_destino
    fill_in "Reservado ate", with: @reserva.reservado_ate
    fill_in "Reservado de", with: @reserva.reservado_de
    fill_in "Tempo de espera", with: @reserva.tempo_de_espera
    fill_in "Valor alugado", with: @reserva.valor_alugado
    fill_in "Veiculo", with: @reserva.veiculo_id
    click_on "Update Reserva"

    assert_text "Reserva was successfully updated"
    click_on "Back"
  end

  test "destroying a Reserva" do
    visit reservas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Reserva was successfully destroyed"
  end
end
