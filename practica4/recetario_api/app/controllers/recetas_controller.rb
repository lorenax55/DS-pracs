class RecetasController < ApplicationController
    def index
      @recetas = Receta.where(usuario_id: params[:usuario_id])
      render json: @recetas
    end
  
    def create
      @receta = Receta.new(receta_params)
      if @receta.save
        render json: @receta, status: :created
      else
        render json: @receta.errors, status: :unprocessable_entity
      end
    end
  
    def update
      @receta = Receta.find(params[:id])
      if @receta.update(receta_params)
        render json: @receta
      else
        render json: @receta.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      receta = Receta.find(params[:id])
      if receta.destroy
        head :ok
      else
        render json: { error: "Failed to delete" }, status: :unprocessable_entity
      end
    end
  
    private
  
    def receta_params
      params.require(:receta).permit(:nombre, :ingredientes, :pasos, :tiempo_preparacion, :usuario_id, :seccion_id)
    end
  end
  
