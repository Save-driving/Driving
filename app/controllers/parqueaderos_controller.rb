class ParqueaderosController < ApplicationController

  before_filter :require_login
  
  helper_method :sort_column, :sort_direction

  def index
    #Prawn::Document.generate("explicit.pdf") do |pdf|
    #pdf.text "Hello World"
 @rxp = (params[:numreg])? params[:numreg].to_i : 5
   
     if ((@rxp) == 0) or ((@rxp) < 0) then
        @rxp = 1
     end
     @parqueaderos = Parqueadero.search(params[:search]).order(sort_column + ' ' + sort_direction).paginate(:per_page => (@rxp), :page => params[:page])
    output = ParqueaderoList.new(@parqueaderos,view_context) # Aquí instancio el documento pdf
    respond_to do |format|
      format.pdf{
        send_data output.render, :filename => "parqueaderoList.pdf", :type => "application/pdf", 
                  :disposition => "inline" # este parámetro permite ver el documento pdf en linea.
      }
      format.html #{ render :text => "<h1>Use .pdf</h1>".html_safe }
      format.json { render json: @parqueaderos  }
    end
  end


  def show 
    @parqueadero = Parqueadero.find(params[:id])
    if params[:format] == "pdf"
      pdf = ParqueaderoPdf.new(@parqueadero, view_context)
      send_data pdf.render, filename:
      "Parqueadero_#{@parqueadero.id}.pdf",
      type: "application/pdf"
    end
  end

  def new
    @parqueadero = Parqueadero.new
  end

  def edit
    @parqueadero = Parqueadero.find(params[:id])
  end

  def create
    @parqueadero = Parqueadero.new(params[:parqueadero])
    render :action => :new unless @parqueadero.save
    @parqueaderos = Parqueadero.all
  end

  def update
    @parqueadero = Parqueadero.find(params[:id])
    render :action => :edit unless @parqueadero.update_attributes(params[:parqueadero])
  end

  def destroy
    @parqueadero = Parqueadero.find(params[:id])
    @parqueadero.destroy
    @parqueaderos = Parqueadero.all
  end

    private
  def sort_column
    Parqueadero.column_names.include?(params[:sort]) ? params[:sort] : "nombres"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  end

end
