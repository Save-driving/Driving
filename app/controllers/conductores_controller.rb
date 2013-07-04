class ConductoresController < ApplicationController
  
  before_filter :require_login
  
  helper_method :sort_column, :sort_direction

  def index
 @rxp = (params[:numreg])? params[:numreg].to_i : 5
   
     if ((@rxp) == 0) or ((@rxp) < 0) then
        @rxp = 1
     end
     @conductores = Conductor.search(params[:search]).order(sort_column + ' ' + sort_direction).paginate(:per_page => (@rxp), :page => params[:page])
    output = ConductorList.new(@conductores,view_context) # Aquí instancio el documento pdf
    respond_to do |format|
      format.pdf{
        send_data output.render, :filename => "conductorList.pdf", :type => "application/pdf", 
                  :disposition => "inline" # este parámetro permite ver el documento pdf en linea.
      }
      format.html #{ render :text => "<h1>Use .pdf</h1>".html_safe }
      format.json { render json: @conductores  }
    end
  end


  def show
    @conductor = Conductor.find(params[:id])
    if params[:format] == "pdf"
      pdf = ConductorPdf.new(@conductor, view_context)
      send_data pdf.render, filename:
      "Conductor_#{@conductor.id}.pdf",
      type: "application/pdf"
    end
  end

  def new
    @conductor = Conductor.new
  end 

  def edit
    @conductor = Conductor.find(params[:id])
  end

  def create
    @conductor = Conductor.new(params[:conductor])
    render :action => :new unless @conductor.save
    @conductores = Conductor.all
  end

  def update
    @conductor = Conductor.find(params[:id])
    render :action => :edit unless @conductor.update_attributes(params[:conductor])
  end

  def destroy
    @conductor = Conductor.find(params[:id])
    @conductor.destroy
    @conductores = Conductor.all
  end

    private
  def sort_column
    Conductor.column_names.include?(params[:sort]) ? params[:sort] : "nombres"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  end

end
