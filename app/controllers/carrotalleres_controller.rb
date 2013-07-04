class CarrotalleresController < ApplicationController

  before_filter :require_login
  
  helper_method :sort_column, :sort_direction

  def index
 @rxp = (params[:numreg])? params[:numreg].to_i : 5
   
     if ((@rxp) == 0) or ((@rxp) < 0) then
        @rxp = 1
     end
     @carrotalleres = Carrotaller.search(params[:search]).order(sort_column + ' ' + sort_direction).paginate(:per_page => (@rxp), :page => params[:page])
  output = CarrotallerList.new(@carrotalleres,view_context) # Aquí instancio el documento pdf
    respond_to do |format|
      format.pdf{
        send_data output.render, :filename => "carrotallerList.pdf", :type => "application/pdf", 
                  :disposition => "inline" # este parámetro permite ver el documento pdf en linea.
      }
      format.html #{ render :text => "<h1>Use .pdf</h1>".html_safe }
      format.json { render json: @carrotalleres  }
    end
  end


  def show
    @carrotaller = Carrotaller.find(params[:id])
    if params[:format] == "pdf"
      pdf = CarrotallerPdf.new(@carrotaller, view_context)
      send_data pdf.render, filename:
      "Carrotaller_#{@carrotaller.id}.pdf",
      type: "application/pdf"
    end
  end


  def new
    @carrotaller = Carrotaller.new
  end

  def edit
    @carrotaller = Carrotaller.find(params[:id])
  end

  def create
    @carrotaller = Carrotaller.new(params[:carrotaller])
    render :action => :new unless @carrotaller.save
    @carrotalleres = Carrotaller.all
  end

  def update
    @carrotaller = Carrotaller.find(params[:id])
    render :action => :edit unless @carrotaller.update_attributes(params[:carrotaller])
  end

  def destroy
    @carrotaller = Carrotaller.find(params[:id])
    @carrotaller.destroy
    @carrotalleres = Carrotaller.all
  end

    private
  def sort_column
    Carrotaller.column_names.include?(params[:sort]) ? params[:sort] : "nombres"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  end

end
