require 'test_helper'

class InstituicosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @instituico = instituicos(:one)
  end

  test "should get index" do
    get instituicos_url
    assert_response :success
  end

  test "should get new" do
    get new_instituico_url
    assert_response :success
  end

  test "should create instituico" do
    assert_difference('Instituico.count') do
      post instituicos_url, params: { instituico: { codigo_empresa_parceira: @instituico.codigo_empresa_parceira, codigo_produto: @instituico.codigo_produto, id_cliente_parceira: @instituico.id_cliente_parceira, nome_instituicao: @instituico.nome_instituicao } }
    end

    assert_redirected_to instituico_url(Instituico.last)
  end

  test "should show instituico" do
    get instituico_url(@instituico)
    assert_response :success
  end

  test "should get edit" do
    get edit_instituico_url(@instituico)
    assert_response :success
  end

  test "should update instituico" do
    patch instituico_url(@instituico), params: { instituico: { codigo_empresa_parceira: @instituico.codigo_empresa_parceira, codigo_produto: @instituico.codigo_produto, id_cliente_parceira: @instituico.id_cliente_parceira, nome_instituicao: @instituico.nome_instituicao } }
    assert_redirected_to instituico_url(@instituico)
  end

  test "should destroy instituico" do
    assert_difference('Instituico.count', -1) do
      delete instituico_url(@instituico)
    end

    assert_redirected_to instituicos_url
  end
end
