class TalleresController < ApplicationController

  before_filter :require_login
  
  helper_method :sort_column, :sort_direction

  def index
    #Prawn::Document.generate("explicit.pdf") do |pdf|
    #pdf.text "Hello World"
 @rxp = (params[:numreg])? params[:numreg].to_i : 5
   
     if ((@rxp) == 0) or ((@rxp) < 0) then
        @rxp = 1
     end
     @talleres = Taller.search(params[:search]).order(sort_column + ' ' + sort_direction).paginate(:per_page => (@rxp), :page => params[:page])
    output = TallerList.new(@talleres,view_context) # Aquí instancio el documento pdf
    respond_to do |format|
      format.pdf{
        send_data output.render, :filename => "TallerList.pdf", :type => "application/pdf", 
                  :disposition => "inline" # este parámetro permite ver el documento pdf en linea.
      }
      format.html #{ render :text => "<h1>Use .pdf</h1>".html_safe }
      format.json { render json: @talleres  }
    end
  end


  def show
    @taller = Taller.find(params[:id])
    if params[:format] == "pdf"
      pdf = TallerPdf.new(@taller, view_context)
      send_data pdf.render, filename:
      "Taller_#{@taller.id}.pdf",
      type: "application/pdf"
    end
  end

  def new
    @taller = Taller.new
  end

  def edit
    @taller = Taller.find(params[:id])
  end

  def create
    @taller = Taller.new(params[:taller])
    render :action => :new unless @taller.save
    @talleres = Taller.all
  end

  def update
    @taller = Taller.find(params[:id])
    render :action => :edit unless @taller.update_attributes(params[:taller])
  end

  def destroy
    @taller = Taller.find(params[:id])
    @taller.destroy
    @talleres = Taller.all
  end

    private
  def sort_column
    Taller.column_names.include?(params[:sort]) ? params[:sort] : "nombres"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  end

end
