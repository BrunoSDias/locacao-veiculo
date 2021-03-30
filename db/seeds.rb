puts " ============== CRIANDO ADMINISTRADOR ============== "
Administrador.create(nome: "Bruno", login: "brunosdias@outlook.com", senha: "123456")
puts " ============== ADMINISTRADOR CRIADO ============== "

puts " ============== CRIANDO USUARIO ============== "
Usuario.create(nome: "Bruno Dias", cpf: "378.412.638-30", cep: "15840-000", estado: "SP", endereco: "Rua Vicente Bochichio", numero: 88)
puts " ============== USUARIO CRIADO ============== "

puts " ============== CRIANDO MARCAS ============== "
if marca = Marca.create(nome: "Hyundai")
  Veiculo.create(nome: "HB20", cor: "Prata", qnt_passageiros: 5, placa: "HSB-1213", valor: 50, marca_id: marca.id)
end

if marca = Marca.create(nome: "Ford")
  Veiculo.create(nome: "Ka Sedan", cor: "Azul", qnt_passageiros: 5, placa: "SDV-2156", valor: 40, marca_id:  marca.id)
end

if marca = Marca.create(nome: "Volkswagen")
  Veiculo.create(nome: "T-Cross", cor: "Verde", qnt_passageiros: 5, placa: "HSM-1151", valor: 25.30, marca_id:  marca.id)
end

puts " ============== MARCAS CRIADAS ============== "
