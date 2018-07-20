json.extract! product, :id, :sku, :name, :brewer, :created_at, :updated_at
json.url product_url(product, format: :json)
