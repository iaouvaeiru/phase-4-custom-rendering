class Cheese < ApplicationRecord
  
  def summary
    "#{name}: $#{price}"
  end
  
  def index
    cheeses = Cheese.all
    render json: cheeses
  end
  
  def show
    cheese = Cheese.find(params[:id])
    if cheese
      render json: cheese, except: [:created_at, :updated_at], methods: [:summary]
    else
      render json: {error: '404 cheese not found'}
    end
  end

end
