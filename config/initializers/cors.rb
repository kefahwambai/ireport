Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins "https://ireporter.vercel.app"

    resource "*",
    headers: :any,
    expose: ['access-token', 'expiry', 'token-type', 'Authorization'],
    methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end
