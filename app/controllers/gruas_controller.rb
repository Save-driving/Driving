class GruasController < ApplicationController

  before_filter :require_login
  
  helper_method :sort_column, :sort_direction

  def index
 @rxp = (params[:numreg])? params[:numreg].to_i : 5
   
     if ((@rxp) == 0) or ((@rxp) < 0) then
        @rxp = 1
     end
     @gruas = Grua.search(params[:search]).order(sort_column + ' ' + sort_direction).paginate(:per_page => (@rxp), :page => params[:page])
    output = GruaList.new(@gruas,view_context) # Aquí instancio el documento pdf
    respond_to do |format|
      format.pdf{
        send_data output.render, :filename => "gruaList.pdf", :type => "application/pdf", 
                  :disposition => "inline" # este parámetro permite ver el documento pdf en linea.
      }
      format.html #{ render :text => "<h1>Use .pdf</h1>".html_safe }
      format.json { render json: @gruas  }
    end
  end


  def show
    @grua = Grua.find(params[:id])
    if params[:format] == "pdf"
      pdf = GruaPdf.new(@grua, view_context)
      send_data pdf.render, filename:
      "Grua_#{@grua.id}.pdf",
      type: "application/pdf"
    end
  end

  def new
    @grua = Grua.new
  end

  def edit
    @grua = Grua.find(params[:id])
  end

  def create
    @grua = Grua.new(params[:grua])
    render :action => :new unless @grua.save
    @gruas = Grua.all
  end

  def update
    @grua = Grua.find(params[:id])
    render :action => :edit unless @grua.update_attributes(params[:grua])
  end

  def destroy
    @grua = Grua.find(params[:id])
    @grua.destroy
    @gruas = Grua.all
  end

    private
  def sort_column
    Grua.column_names.include?(params[:sort]) ? params[:sort] : "nombres"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  end

end
