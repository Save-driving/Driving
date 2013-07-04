class AseguradorasController < ApplicationController

  before_filter :require_login

  helper_method :sort_column, :sort_direction

  def index
    #Prawn::Document.generate("explicit.pdf") do |pdf|
    #pdf.text "Hello World"
 @rxp = (params[:numreg])? params[:numreg].to_i : 5
   
     if ((@rxp) == 0) or ((@rxp) < 0) then
        @rxp = 1
     end
     @aseguradoras = Aseguradora.search(params[:search]).order(sort_column + ' ' + sort_direction).paginate(:per_page => (@rxp), :page => params[:page])
    output = AseguradoraList.new(@aseguradoras,view_context) # Aquí instancio el documento pdf
    respond_to do |format|
      format.pdf{
        send_data output.render, :filename => "aseguradoraList.pdf", :type => "application/pdf", 
                  :disposition => "inline" # este parámetro permite ver el documento pdf en linea.
      }
      format.html #{ render :text => "<h1>Use .pdf</h1>".html_safe }
      format.json { render json: @aseguradoras }
    end
  end

  def show
    @aseguradora = Aseguradora.find(params[:id])
    if params[:format] == "pdf"
      pdf = AseguradoraPdf.new(@aseguradora, view_context)
      send_data pdf.render, filename:
      "Aseguradora_#{@aseguradora.id}.pdf",
      type: "application/pdf"
    end
  end

  def new
    @aseguradora = Aseguradora.new
  end

  def edit
    @aseguradora = Aseguradora.find(params[:id])
  end

  def create
    @aseguradora = Aseguradora.new(params[:aseguradora])
    render :action => :new unless @aseguradora.save
    @aseguradoras = Aseguradora.all
  end

  def update
    @aseguradora = Aseguradora.find(params[:id])
    render :action => :edit unless @aseguradora.update_attributes(params[:aseguradora])
  end

  def destroy
    @aseguradora = Aseguradora.find(params[:id])
    @aseguradora.destroy
    @aseguradoras = Aseguradora.all
  end

    private
  def sort_column
    Aseguradora.column_names.include?(params[:sort]) ? params[:sort] : "nombres"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  end

end
