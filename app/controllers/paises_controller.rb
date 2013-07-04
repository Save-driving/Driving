class PaisesController < ApplicationController

  before_filter :require_login

  helper_method :sort_column, :sort_direction

  before_filter :find_pais, :except => [ :index, :create, :new ]
 
  def index
     @rxp = (params[:registro])? params[:registro].to_i : 2
    if ((@rxp) == 0) or ((@rxp) < 0) then
      @rxp = 1
    end
    @paises = Pais.order(sort_column + " " + sort_direction).search(params[:search]).page(params[:page]).per_page(@rxp)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @paises }
    end
  end

  def show
  end

  def new
    @pais = Pais.new
  end

  def edit
  end

  def create
    @pais = Pais.new(params[:pais])
    @paises = Pais.all
    render :action => :new unless @pais.save
  end

  def update
    render :action => :edit unless @pais.update_attributes(params[:pais])
  end

  def destroy
    @pais.destroy
    @paises = Pais.all
  end

  private
  def find_pais
  @pais = Pais.find(params[:id]) if params[:id]
  end

     private
  def sort_column
    Pais.column_names.include?(params[:sort]) ? params[:sort] : "nombre"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end
