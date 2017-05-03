json.extract! cadastro, :id, :id_cliente_coelce, :digito_verificador_cliente_coelce, :codigo_ocorrencia, :data_ocorrencia, :valor, :parcelas, :id_cliente_parceira, :codigo_produto, :codigo_empresa_parceira, :livre, :created_at, :updated_at
json.url cadastro_url(cadastro, format: :json)
