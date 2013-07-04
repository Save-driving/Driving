class AbogadosController < ApplicationController

  before_filter :require_login
  
  helper_method :sort_column, :sort_direction

  def index
    #Prawn::Document.generate("explicit.pdf") do |pdf|
    #pdf.text "Hello World"
 @rxp = (params[:numreg])? params[:numreg].to_i : 5
   
     if ((@rxp) == 0) or ((@rxp) < 0) then
        @rxp = 1
     end
     @abogados = Abogado.search(params[:search]).order(sort_column + ' ' + sort_direction).paginate(:per_page => (@rxp), :page => params[:page])
    output = AbogadoList.new(@abogados,view_context) # Aquí instancio el documento pdf
    respond_to do |format|
      format.pdf{
        send_data output.render, :filename => "abogadoList.pdf", :type => "application/pdf", 
                  :disposition => "inline" # este parámetro permite ver el documento pdf en linea.
      }
      format.html #{ render :text => "<h1>Use .pdf</h1>".html_safe }
      format.json { render json: @abogados }
    end
  end


  def show
    @abogado = Abogado.find(params[:id])
    if params[:format] == "pdf"
      pdf = AbogadoPdf.new(@abogado, view_context)
      send_data pdf.render, filename:
      "Abogado_#{@abogado.id}.pdf",
      type: "application/pdf"
    end
  end

  def new
    @abogado = Abogado.new
  end

  def edit
    @abogado = Abogado.find(params[:id])
  end

  def create
    @abogado = Abogado.new(params[:abogado])
    render :action => :new unless @abogado.save
    @abogados = Abogado.all
  end

  def update
    @abogado = Abogado.find(params[:id])
    render :action => :edit unless @abogado.update_attributes(params[:abogado])
  end

  def destroy
    @abogado = Abogado.find(params[:id])
    @abogado.destroy
    @abogados = Abogado.all
  end

    private
  def sort_column
    Abogado.column_names.include?(params[:sort]) ? params[:sort] : "nombres"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  end

end
