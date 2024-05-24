class UsuariosController < ApplicationController
    def index
      @usuarios = Usuario.all
      render json: @usuarios
    end
  end
  