require "application_system_test_case"

class PuntosTest < ApplicationSystemTestCase
  setup do
    @punto = puntos(:one)
  end

  test "visiting the index" do
    visit puntos_url
    assert_selector "h1", text: "Puntos"
  end

  test "creating a Punto" do
    visit puntos_url
    click_on "New Punto"

    fill_in "Angulo", with: @punto.angulo
    fill_in "Distancia", with: @punto.distancia
    fill_in "Lat", with: @punto.lat
    fill_in "Long", with: @punto.long
    fill_in "Nombre", with: @punto.nombre
    fill_in "Proyecto", with: @punto.proyecto_id
    fill_in "Secuencia", with: @punto.secuencia
    click_on "Create Punto"

    assert_text "Punto was successfully created"
    click_on "Back"
  end

  test "updating a Punto" do
    visit puntos_url
    click_on "Edit", match: :first

    fill_in "Angulo", with: @punto.angulo
    fill_in "Distancia", with: @punto.distancia
    fill_in "Lat", with: @punto.lat
    fill_in "Long", with: @punto.long
    fill_in "Nombre", with: @punto.nombre
    fill_in "Proyecto", with: @punto.proyecto_id
    fill_in "Secuencia", with: @punto.secuencia
    click_on "Update Punto"

    assert_text "Punto was successfully updated"
    click_on "Back"
  end

  test "destroying a Punto" do
    visit puntos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Punto was successfully destroyed"
  end
end
