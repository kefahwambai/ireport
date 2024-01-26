Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins "http://localhost:4000"

    resource "*",
    headers: ["Authorization"],
    expose: ['access-token', 'expiry', 'token-type', 'Authorization'],
    methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end
