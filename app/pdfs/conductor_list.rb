class ConductorList < Prawn::Document
  #Hay dos formas de hacerlo 1- con el constructor de la clase o  2- con este Método principal que construye el  documento pdf y se invoca con el contructor en el controller
  
  # 1- Método constructor de la clase Orderlist 
  
  def initialize(conductores, view)
     super()
     logo 
     @conductores = conductores
     @vista = view
     conductor_details
  end
   
  # 2- Método que reemplaza el constructor(initialize se elimina), pero implica que en el controller de la clase se invoque así:
  #  output = OrderList.new.to_pdf(@orders,view_context) -> es más larga esta forma.
  # y también se debe cambiar el formato quitandole el método render así:
  # format.pdf{
  #      send_data output, :filename => "orderslist.pdf", :type => "application/pdf", :disposition => "inline"
  #    }
  def to_pdf(conductores, view)
    logo
    @conductores = conductores
    @vista = view
    conductores_details
    render
  end
  
  #Método para definir el logo con su ubicación así como el título del reporte  
  def logo
    logopath =  "#{Rails.root}/app/assets/images/LOGO.png"
    image logopath, :width => 50, :height => 64
    move_down 10
    draw_text "Listado de conductores", :at => [150, 575], size: 22
    text "SAVE DRIVING"
    text "Asistencia vehicular"
  end
  
  #Método para dar formato a la salida de los registros
  def precision(num)
    @vista.number_with_precision(num, :locale => :es ,:precision => 2, :separator => ",", :delimiter => '.')
  end
  
  #Método para almacenar y mostrar los registros del detalle de la orden
  def conductor_item_rows
    [["id", "documento", "numero", "nombres", "direccion", "ciudad", "tel", "email", "observaciones", "calificacion"]] +
    @conductores.map do |conductor|
      [ "#{conductor.id} ",   
      "#{conductor.documento.nombre} ", 
      "#{conductor.numero_doc} ",
      "#{conductor.nombres} ", 
      "#{conductor.direccion} ", 
      "#{conductor.municipio.nombre} ", 
      "#{conductor.telefonos} ", 
      "#{conductor.email} ",
      "#{conductor.observaciones} ",
      "#{conductor.calificacion.nombre} "]
    end
  end
  
  #Método que imprime la tabla de las ordenes que hay
  def conductor_details
    move_down 70
    table conductor_item_rows, :width => 520 do
      row(0).font_style = :bold
      columns(1..11).align = :right
      self.header = true
      self.column_widths = {0 => 17, 1 => 50, 2 => 70, 3 => 70, 4 => 70, 5 => 45, 6 => 50, 7 => 65, 8 => 50, 9 => 33 }
    end
  end

end
