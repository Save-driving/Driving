class BomberosController < ApplicationController
  
  before_filter :require_login
  
  helper_method :sort_column, :sort_direction

  def index
    #Prawn::Document.generate("explicit.pdf") do |pdf|
    #pdf.text "Hello World"
 @rxp = (params[:numreg])? params[:numreg].to_i : 5
   
     if ((@rxp) == 0) or ((@rxp) < 0) then
        @rxp = 1
     end
     @bomberos = Bombero.search(params[:search]).order(sort_column + ' ' + sort_direction).paginate(:per_page => (@rxp), :page => params[:page])
    output = BomberoList.new(@bomberos,view_context) # Aquí instancio el documento pdf
    respond_to do |format|
      format.pdf{
        send_data output.render, :filename => "bomberoList.pdf", :type => "application/pdf", 
                  :disposition => "inline" # este parámetro permite ver el documento pdf en linea.
      }
      format.html #{ render :text => "<h1>Use .pdf</h1>".html_safe }
      format.json { render json: @bomberos }
    end
  end

 def show
    @abogado = Bombero.find(params[:id])
    if params[:format] == "pdf"
      pdf = BomberoPdf.new(@bombero, view_context)
      send_data pdf.render, filename:
      "Bombero_#{@bombero.id}.pdf",
      type: "application/pdf"
    end
  end

  def new
    @bombero = Bombero.new
  end

  def edit
    @bombero = Bombero.find(params[:id])
  end

  def create
    @bombero = Bombero.new(params[:bombero])
    render :action => :new unless @bombero.save
    @bomberos = Bombero.all
  end

  def update
    @bombero = Bombero.find(params[:id])
    render :action => :edit unless @bombero.update_attributes(params[:bombero])
  end

  def destroy
    @bombero = Bombero.find(params[:id])
    @bombero.destroy
    @bomberos = Bombero.all
  end

    private
  def sort_column
    Bombero.column_names.include?(params[:sort]) ? params[:sort] : "nombres"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  end
end
