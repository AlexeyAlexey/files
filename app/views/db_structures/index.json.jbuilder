json.array!(@db_structures) do |db_structure|
  json.extract! db_structure, :id
  json.url db_structure_url(db_structure, format: :json)
end
