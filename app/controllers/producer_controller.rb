class ProducerController < ApplicationController
  before_action :find_producer, only: :show
  
  def index
    @producers = Producer.order(:name).page(params[:page]).per(24)
  end

  def show
  end
  
  private
  def find_producer
    @producer = Producer.find_by id: params[:id]
  end
end
