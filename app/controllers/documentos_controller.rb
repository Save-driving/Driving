 class DocumentosController < ApplicationController

  before_filter :require_login

  def index
    @documentos = Documento.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @documentos }
    end
  end

  def show
    @documento = Documento.find(params[:id])
  end

  def new
    @documento = Documento.new
  end

  def edit
    @documento = Documento.find(params[:id])
  end

  def create
    @documento = Documento.new(params[:documento])
    render :action => :new unless @documento.save
  end

  def update
    @documento = Documento.find(params[:id])
    render :action => :edit unless @documento.update_attributes(params[:documento])
  end

  def destroy
    @documento = Documento.find(params[:id])
    @documento.destroy
  end
end
