json.array!(@example_modules) do |example_module|
  json.extract! example_module, :id, :title, :text
  json.url example_module_url(example_module, format: :json)
end
