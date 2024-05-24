class SeccionesController < ApplicationController
  def index
    @secciones = Seccion.where(usuario_id: params[:usuario_id])
    render json: @secciones
  end

  def create
    @seccion = Seccion.new(seccion_params)
    @seccion.usuario_id = params[:usuario_id] 
    if @seccion.save
      render json: @seccion, status: :created
    else
      render json: @seccion.errors, status: :unprocessable_entity
    end
  end

  def update
    @seccion = Seccion.find(params[:id])
    if @seccion.update(seccion_params)
      render json: @seccion
    else
      render json: @seccion.errors, status: :unprocessable_entity
    end
  end

  def destroy
    seccion = Seccion.find(params[:id])
    if seccion.destroy
      head :ok
    else
      render json: { error: "Failed to delete" }, status: :unprocessable_entity
    end
  end

  private

  def seccion_params
    params.require(:seccion).permit(:nombre, :usuario_id, :parent_id)
  end
end

