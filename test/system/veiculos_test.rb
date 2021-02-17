require "application_system_test_case"

class VeiculosTest < ApplicationSystemTestCase
  setup do
    @veiculo = veiculos(:one)
  end

  test "visiting the index" do
    visit veiculos_url
    assert_selector "h1", text: "Veiculos"
  end

  test "creating a Veiculo" do
    visit veiculos_url
    click_on "New Veiculo"

    fill_in "Cor", with: @veiculo.cor
    fill_in "Marca", with: @veiculo.marca_id
    fill_in "Nome", with: @veiculo.nome
    fill_in "Placa", with: @veiculo.placa
    fill_in "Qnt passageiros", with: @veiculo.qnt_passageiros
    fill_in "Valor", with: @veiculo.valor
    click_on "Create Veiculo"

    assert_text "Veiculo was successfully created"
    click_on "Back"
  end

  test "updating a Veiculo" do
    visit veiculos_url
    click_on "Edit", match: :first

    fill_in "Cor", with: @veiculo.cor
    fill_in "Marca", with: @veiculo.marca_id
    fill_in "Nome", with: @veiculo.nome
    fill_in "Placa", with: @veiculo.placa
    fill_in "Qnt passageiros", with: @veiculo.qnt_passageiros
    fill_in "Valor", with: @veiculo.valor
    click_on "Update Veiculo"

    assert_text "Veiculo was successfully updated"
    click_on "Back"
  end

  test "destroying a Veiculo" do
    visit veiculos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Veiculo was successfully destroyed"
  end
end
