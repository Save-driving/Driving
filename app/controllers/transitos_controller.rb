class TransitosController < ApplicationController

  before_filter :require_login
  
  helper_method :sort_column, :sort_direction

  def index
    #Prawn::Document.generate("explicit.pdf") do |pdf|
    #pdf.text "Hello World"
 @rxp = (params[:numreg])? params[:numreg].to_i : 5
   
     if ((@rxp) == 0) or ((@rxp) < 0) then
        @rxp = 1
     end
     @transitos = Transito.search(params[:search]).order(sort_column + ' ' + sort_direction).paginate(:per_page => (@rxp), :page => params[:page])
    output = TransitoList.new(@transitos,view_context) # Aquí instancio el documento pdf
    respond_to do |format|
      format.pdf{
        send_data output.render, :filename => "transitoList.pdf", :type => "application/pdf", 
                  :disposition => "inline" # este parámetro permite ver el documento pdf en linea.
      }
      format.html #{ render :text => "<h1>Use .pdf</h1>".html_safe }
      format.json { render json: @transitos }
    end
  end

def show
    @abogado = Transito.find(params[:id])
    if params[:format] == "pdf"
      pdf = TransitoPdf.new(@transito, view_context)
      send_data pdf.render, filename:
      "Transito_#{@transito.id}.pdf",
      type: "application/pdf"
    end
  end

  def new
    @transito = Transito.new
  end

  def edit
    @transito = Transito.find(params[:id])
  end

  def create
    @transito = Transito.new(params[:transito])
    render :action => :new unless @transito.save
    @transitos = Transito.all
  end

  def update
    @transito = Transito.find(params[:id])
    render :action => :edit unless @transito.update_attributes(params[:transito])
  end

  def destroy
    @transito = Transito.find(params[:id])
    @transito.destroy
    @transitos = Transito.all
  end

    private
  def sort_column
    Transito.column_names.include?(params[:sort]) ? params[:sort] : "nombres"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  end

end
