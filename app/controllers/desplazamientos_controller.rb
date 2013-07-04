class DesplazamientosController < ApplicationController

  before_filter :require_login
  
  helper_method :sort_column, :sort_direction

  def index
 @rxp = (params[:numreg])? params[:numreg].to_i : 5
   
     if ((@rxp) == 0) or ((@rxp) < 0) then
        @rxp = 1
     end
     @desplazamientos = Desplazamiento.search(params[:search]).order(sort_column + ' ' + sort_direction).paginate(:per_page => (@rxp), :page => params[:page])
    output = DesplazamientoList.new(@desplazamientos,view_context) # Aquí instancio el documento pdf
    respond_to do |format|
      format.pdf{
        send_data output.render, :filename => "desplazamientoList.pdf", :type => "application/pdf", 
                  :disposition => "inline" # este parámetro permite ver el documento pdf en linea.
      }
      format.html #{ render :text => "<h1>Use .pdf</h1>".html_safe }
      format.json { render json: @desplazamientos  }
    end
  end

  def show
    @desplazamiento = Desplazamiento.find(params[:id])
    if params[:format] == "pdf"
      pdf = DesplazamientoPdf.new(@desplazamiento, view_context)
      send_data pdf.render, filename:
      "Desplazamiento_#{@desplazamiento.id}.pdf",
      type: "application/pdf"
    end
  end

  def new
    @desplazamiento = Desplazamiento.new
  end

  def edit
    @desplazamiento = Desplazamiento.find(params[:id])
  end

  def create
    @desplazamiento = Desplazamiento.new(params[:desplazamiento])
    render :action => :new unless @desplazamiento.save
    @desplazamientos= Desplazamiento.all
  end

  def update
    @desplazamiento = Desplazamiento.find(params[:id])
    render :action => :edit unless @desplazamiento.update_attributes(params[:desplazamiento])
  end

  def destroy
    @desplazamiento = Desplazamiento.find(params[:id])
    @desplazamiento.destroy
    @desplazamientos = Desplazamiento.all
  end

    private
  def sort_column
    Desplazamiento.column_names.include?(params[:sort]) ? params[:sort] : "nombres"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  end

end
