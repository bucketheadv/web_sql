WebSql::Engine.routes.draw do
  root to: 'sql#index', via: [:get, :post]
end
