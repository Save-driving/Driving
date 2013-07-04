class AmbulanciasController < ApplicationController

  before_filter :require_login
  
  helper_method :sort_column, :sort_direction

  def index
    #Prawn::Document.generate("explicit.pdf") do |pdf|
    #pdf.text "Hello World"
 @rxp = (params[:numreg])? params[:numreg].to_i : 5
   
     if ((@rxp) == 0) or ((@rxp) < 0) then
        @rxp = 1
     end
     @ambulancias = Ambulancia.search(params[:search]).order(sort_column + ' ' + sort_direction).paginate(:per_page => (@rxp), :page => params[:page])
    output = AmbulanciaList.new(@ambulancias,view_context) # Aquí instancio el documento pdf
    respond_to do |format|
      format.pdf{
        send_data output.render, :filename => "ambulanciaList.pdf", :type => "application/pdf", 
                  :disposition => "inline" # este parámetro permite ver el documento pdf en linea.
      }
      format.html #{ render :text => "<h1>Use .pdf</h1>".html_safe }
      format.json { render json: @ambulancias }
    end
  end

 def show
    @ambulancia = Ambulancia.find(params[:id])
    if params[:format] == "pdf"
      pdf = AmbulanciaPdf.new(@ambulancia, view_context)
      send_data pdf.render, filename:
      "Ambulancia_#{@ambulancia.id}.pdf",
      type: "application/pdf"
    end
  end

  def new
    @ambulancia = Ambulancia.new
  end

  def edit
    @ambulancia = Ambulancia.find(params[:id])
  end

  def create
    @ambulancia = Ambulancia.new(params[:ambulancia])
    render :action => :new unless @ambulancia.save
    @ambulancias = Abogado.all
  end

  def update
    @ambulancia = Ambulancia.find(params[:id])
    render :action => :edit unless @ambulancia.update_attributes(params[:ambulancia])
  end

  def destroy
    @ambulancia = Ambulancia.find(params[:id])
    @ambulancia.destroy
    @ambulancias = Ambulancia.all
  end

    private
  def sort_column
    Ambulancia.column_names.include?(params[:sort]) ? params[:sort] : "nombres"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  end

end
