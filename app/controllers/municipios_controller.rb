class MunicipiosController < ApplicationController

  before_filter :require_login
  
  autocomplete :departamento, :nombre, :full => true
  
  def index
    @rxp = (params[:registro])? params[:registro].to_i : 5
    if ((@rxp) == 0) or ((@rxp) < 0) then
      @rxp = 1
    end
    @municipios = Municipio.search(params[:search]).page(params[:page]).per_page(@rxp)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @municipios }
    end
  end

  def show
    @municipio = Municipio.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @municipio }
    end
  end

  def new
    @municipio = Municipio.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @municipio }
    end
  end

  def edit
    @municipio = Municipio.find(params[:id])
  end

  def create
   @municipio = Municipio.new(params[:municipio])
   @municipio.nombre = Municipio.muni_ubica(@municipio)
   
    respond_to do |format|
      if @municipio.save
        format.html { redirect_to @municipio, notice: 'Municipio creado con éxito.' }
        format.json { render json: @municipio, status: :created, location: @municipio }
      else
        format.html { render action: "new" }
        format.json { render json: @municipio.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @municipio = Municipio.find(params[:id])
   @municipio.nombre = Municipio.muni_ubica(@municipio)
    respond_to do |format|
      if @municipio.update_attributes(params[:municipio])
        format.html { redirect_to @municipio, notice: 'Municipio modificado con éxito.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @municipio.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @municipio = Municipio.find(params[:id])
    @municipio.destroy

    respond_to do |format|
      format.html { redirect_to municipios_url }
      format.json { head :no_content }
    end
  end

    private
  def sort_column
    Municipio.column_names.include?(params[:sort]) ? params[:sort] : "nombre"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end
