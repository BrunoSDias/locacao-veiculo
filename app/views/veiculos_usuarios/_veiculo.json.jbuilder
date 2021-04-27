json.extract! veiculo, :id, :nome, :cor, :qnt_passageiros, :placa, :valor
json.foto polymorphic_url(veiculo.foto)
json.marca veiculo.marca
