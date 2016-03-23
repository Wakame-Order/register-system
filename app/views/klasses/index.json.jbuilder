json.array!(@klasses) do |klass|
  json.extract! klass, :id, :klass_name
  json.url klass_url(klass, format: :json)
end
