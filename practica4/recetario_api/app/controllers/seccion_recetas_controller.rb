class SeccionRecetasController < ApplicationController
  before_action :set_usuario
  before_action :set_seccion

  def create
    @receta = @seccion.recetas.build(receta_params)
    @receta.usuario = @usuario

    if @receta.save
      render json: @receta, status: :created
    else
      render json: @receta.errors, status: :unprocessable_entity
    end
  end

  private

  def set_usuario
    @usuario = Usuario.find(params[:usuario_id])
  end

  def set_seccion
    @seccion = @usuario.secciones.find(params[:seccion_id])
  end

  def receta_params
    params.require(:receta).permit(:nombre, :ingredientes, :pasos, :tiempo_preparacion) 
  end
end

