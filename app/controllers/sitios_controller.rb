class SitiosController < ApplicationController
  # Hacer query con el dropdown de comuna. Select2.js
  def index
    @comunas = Comuna.all
  end

  def resultado
    @c_id = params[:comuna]
    @distrito = Comuna.find_by({'id':@c_id}).distrito
    @diputados = @distrito.diputados
    @circunscripcion = @distrito.circunscripcion
    @senadores = @circunscripcion.senadors
  end

  def contacto
  end
end
