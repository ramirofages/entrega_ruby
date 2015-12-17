Client.create!([
  {first_name: "primer", last_name: "cliente", birth_date: "2015-12-13", gender: "M", document_number: 1, cuit: "1-1-1", email: "asdasd@hotmail.com", phone_number: 123, skype: "123@hotmail.com"},
  {first_name: "segundo", last_name: "cliente", birth_date: "2015-12-13", gender: "M", document_number: 4, cuit: "2-2-2", email: "asdasd@hotmail.com", phone_number: 6565, skype: "asdasd@hotmail.com"},
  {first_name: "tercer", last_name: "cliente", birth_date: "2015-12-11", gender: "M", document_number: 1, cuit: "33-333-3", email: "asd@asd.com", phone_number: 123, skype: "asd@skype.com"}
])
Person.create!([
  {name: "primera persona", cuit: "222-222-3", isJuridic: true},
  {name: "segunda persona", cuit: "22-34-5", isJuridic: false}
])
Receipt.create!([
  {client_id: 2, person_id: 2, description: "asdasdasd", total_amount: 123, emission_date: "2015-12-13"},
  {client_id: 2, person_id: 2, description: "zxczxcz", total_amount: 23, emission_date: "2015-12-13"},
  {client_id: 2, person_id: 2, description: "zxczxcz", total_amount: 23, emission_date: "2015-12-13"},
  {client_id: 2, person_id: 2, description: "zxczxcz", total_amount: 23, emission_date: "2015-12-13"},
  {client_id: 2, person_id: 1, description: "asdasd", total_amount: 25, emission_date: "2015-12-13"},
  {client_id: 2, person_id: 1, description: "565555555", total_amount: 58, emission_date: "2014-12-14"},
  {client_id: 2, person_id: 2, description: "asdasdasd", total_amount: 24, emission_date: "2015-06-15"}
])
