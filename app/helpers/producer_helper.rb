module ProducerHelper
    def movies_of_producer producer
        producer.movies.order("name DESC").page(params[:page]).per(24)
    end
end
