class MecanicosController < ApplicationController

  before_filter :require_login
  
  helper_method :sort_column, :sort_direction

  def index
 @rxp = (params[:numreg])? params[:numreg].to_i : 5
   
     if ((@rxp) == 0) or ((@rxp) < 0) then
        @rxp = 1
     end
     @mecanicos = Mecanico.search(params[:search]).order(sort_column + ' ' + sort_direction).paginate(:per_page => (@rxp), :page => params[:page])
    output = MecanicoList.new(@mecanicos,view_context) # Aquí instancio el documento pdf
    respond_to do |format|
      format.pdf{
        send_data output.render, :filename => "mecanicoList.pdf", :type => "application/pdf", 
                  :disposition => "inline" # este parámetro permite ver el documento pdf en linea.
      }
      format.html #{ render :text => "<h1>Use .pdf</h1>".html_safe }
      format.json { render json: @mecanicos }
    end
  end


  def show
    @mecanico = Mecanico.find(params[:id])
    if params[:format] == "pdf"
      pdf = MecanicoPdf.new(@mecanico, view_context)
      send_data pdf.render, filename:
      "Mecanico_#{@mecanico.id}.pdf",
      type: "application/pdf"
    end
  end

  def new
    @mecanico = Mecanico.new
  end

  def edit
    @mecanico = Mecanico.find(params[:id])
  end

  def create
    @mecanico = Mecanico.new(params[:mecanico])
    render :action => :new unless @mecanico.save
    @mecanicos = Mecanico.all
  end

  def update
    @mecanico = Mecanico.find(params[:id])
    render :action => :edit unless @mecanico.update_attributes(params[:mecanico])
  end

  def destroy
    @mecanico = Mecanico.find(params[:id])
    @mecanico.destroy
    @mecanicos = Mecanico.all
  end

    private
  def sort_column
    Mecanico.column_names.include?(params[:sort]) ? params[:sort] : "nombres"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  end

end
