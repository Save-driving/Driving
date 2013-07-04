class DepartamentosController < ApplicationController

  before_filter :require_login

  before_filter :find_pais_departamentos
  
  autocomplete :pais, :nombre, :full => true
  
  def index
     @rxp = (params[:registro])? params[:registro].to_i : 5
    if ((@rxp) == 0) or ((@rxp) < 0) then
      @rxp = 1
    end
    @departamentos = @pais.departamentos.search(params[:search]).page(params[:page]).per_page(@rxp)  

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @departamentos }
    end
  end

  def show

  end

  def new
    @departamento = Departamento.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @departamento }
    end
  end

  def edit
  end

  def create
    @departamento = @pais.departamentos.build(params[:departamento])
   # @departamento = Departamento.new(params[:departamento])

    respond_to do |format|
      if @departamento.save
        format.html { redirect_to(pais_departamentos_path(@pais), notice: 'El departamento fue creado con exito.')}
        format.json { render json: @departamento, status: :created, location: @departamento }
      else
        format.html { render action: "new" }
        format.json { render json: @departamento.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @departamento.update_attributes(params[:departamento])
        format.html { redirect_to(pais_departamentos_path(@pais), notice: 'El departamento fue modificado con exito.') }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @departamento.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @departamento.destroy

    respond_to do |format|
      format.html { redirect_to(pais_departamentos_path(@pais)) }
      format.json { head :no_content }
    end
  end

  private
  def find_pais_departamentos
  @pais = Pais.find(params[:pais_id])
  @departamento = Departamento.find(params[:id]) if params[:id]
  end

    private
  def sort_column
    Departamento.column_names.include?(params[:sort]) ? params[:sort] : "nombre"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end
