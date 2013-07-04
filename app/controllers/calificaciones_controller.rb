class CalificacionesController < ApplicationController

  def index
    @calificaciones = Calificacion.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @calificaciones }
    end
  end

  def show
    @calificacion = Calificacion.find(params[:id])
  end

  def new
    @calificacion = Calificacion.new
  end

  def edit
    @calificacion = Calificacion.find(params[:id])
  end

  def create
    @calificacion = Calificacion.new(params[:calificacion])
     render :action => :new unless @calificacion.save
  end

  def update
    @calificacion = Calificacion.find(params[:id])
    render :action => :edit unless @calificacion.update_attributes(params[:calificacion])
  end

  def destroy
    @calificacion = Calificacion.find(params[:id])
    @calificacion.destroy
  end
end
