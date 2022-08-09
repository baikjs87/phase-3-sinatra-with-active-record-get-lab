class ApplicationController < Sinatra::Base

  set :default_content_type, 'application/json'

  get '/bakeries' do
    bakeries = Bakery.all
    bakeries.to_json
  end

  get '/bakeries/:id' do
    bakeries = Bakery.find(params[:id])
    bakeries.to_json(only: [:name, :baked_goods], include: {baked_goods: {only: [:name, :price]}})
  end

  get '/baked_goods/by_price' do
    baked = BakedGood.all.order(price: :desc)
    baked.to_json
  end

  get '/baked_goods/most_expensive' do
    baked = BakedGood.all.order(price: :desc).first
    baked.to_json
  end

end
