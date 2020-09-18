require "application_system_test_case"

class ProyectosTest < ApplicationSystemTestCase
  setup do
    @proyecto = proyectos(:one)
  end

  test "visiting the index" do
    visit proyectos_url
    assert_selector "h1", text: "Proyectos"
  end

  test "creating a Proyecto" do
    visit proyectos_url
    click_on "New Proyecto"

    fill_in "Comitente", with: @proyecto.comitente
    fill_in "Constructor", with: @proyecto.constructor
    fill_in "Descripcion", with: @proyecto.descripcion
    fill_in "Expediente", with: @proyecto.expediente
    fill_in "Fproyecto", with: @proyecto.fproyecto
    fill_in "Nombre", with: @proyecto.nombre
    fill_in "Proyectista", with: @proyecto.proyectista
    fill_in "Ubicacion", with: @proyecto.ubicacion
    fill_in "User", with: @proyecto.user_id
    click_on "Create Proyecto"

    assert_text "Proyecto was successfully created"
    click_on "Back"
  end

  test "updating a Proyecto" do
    visit proyectos_url
    click_on "Edit", match: :first

    fill_in "Comitente", with: @proyecto.comitente
    fill_in "Constructor", with: @proyecto.constructor
    fill_in "Descripcion", with: @proyecto.descripcion
    fill_in "Expediente", with: @proyecto.expediente
    fill_in "Fproyecto", with: @proyecto.fproyecto
    fill_in "Nombre", with: @proyecto.nombre
    fill_in "Proyectista", with: @proyecto.proyectista
    fill_in "Ubicacion", with: @proyecto.ubicacion
    fill_in "User", with: @proyecto.user_id
    click_on "Update Proyecto"

    assert_text "Proyecto was successfully updated"
    click_on "Back"
  end

  test "destroying a Proyecto" do
    visit proyectos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Proyecto was successfully destroyed"
  end
end
