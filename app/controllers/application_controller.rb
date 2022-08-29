class ApplicationController < Sinatra::Base

  set :default_content_type, 'application/json'
  # add routes
  get '/bakeries' do
    Bakery.all.to_json
  end
 
  get '/bakeries/:id' do

 bakery=Bakery.find(params[:id])

 bakery.to_json(only: [:name], include: {
 baked_goods: { only: [:name, :price]}})
  end


  get '/baked_goods/by_price' do
   BakedGood.order(price: :desc).to_json(only: [:name,:price])

  end

  get '/baked_goods/most_expensive' do
    BakedGood.order(price: :desc).first.to_json

  end


end
