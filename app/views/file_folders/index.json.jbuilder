json.array!(@file_folders) do |file_folder|
  json.extract! file_folder, :id
  json.url file_folder_url(file_folder, format: :json)
end
