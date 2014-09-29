json.array!(@files_roots) do |files_root|
  json.extract! files_root, :id
  json.url files_root_url(files_root, format: :json)
end
