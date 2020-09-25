class PuntosController < ApplicationController
  before_action :set_punto, only: [:show, :edit, :update, :destroy]

  def indajax
    if (params[:lat]!=nil && params[:long]!=nil)
      newpunto = Punto.new
      newpunto.lat = params[:lat].to_f
      newpunto.long = params[:long].to_f
      newpunto.proyecto_id = params[:proyecto_id].to_i
      newpunto.secuencia = Punto.where(:proyecto_id => params[:proyecto_id]).maximum(:secuencia).to_i + 10
      newpunto.nombre = "Punto " + newpunto.secuencia.to_i.to_s
      newpunto.distancia = 0
      newpunto.angulo = 0
      newpunto.save
    end
    
    @puntosarr = calcdistang(params[:proyecto_id])
    
    render :json => @puntosarr.to_json
        
  end

  def calcdistang(proyecto_id)
    puntosarr = Punto.where(:proyecto_id=>proyecto_id).order('secuencia')
    p1 = nil
    p2 = nil
    p3 = nil
    
    puntosarr.each {|p|
      if (p1==nil)
        p1 = p
      elsif (p2==nil)
        p2 = p1
        p1 = p
        x1 = (p2.long - p1.long) * 60 * 1852 * Math.cos(p1.lat * Math::PI / 180)
        y1 = (p2.lat - p1.lat) * 60 * 1852
        p1.distancia = Math.sqrt(x1*x1 + y1 * y1)
        p1.save 
      else
        p3 = p2
        p2 = p1
        p1 = p
        
        x1 = (p2.long - p1.long) * 60 * 1852 * Math.cos(p1.lat * Math::PI / 180)
        y1 = (p2.lat - p1.lat) * 60 * 1852
        ang1 = Math.atan2(y1, x1) * 180 / Math::PI
    
        x2 = (p2.long - p3.long) * 60 * 1852 * Math.cos(p2.lat * Math::PI / 180)
        y2 = (p2.lat - p3.lat) * 60 * 1852
        ang2 = Math.atan2(y2, x2) * 180 / Math::PI
    
        ang = (ang1 - ang2).abs
        if (ang > 180)
           ang = 360 - ang
        end

        p1.distancia = Math.sqrt(x1*x1 + y1 * y1)
        p1.save 
        p2.distancia = Math.sqrt(x2*x2 + y2*y2)
        p2.angulo = ang
        p2.save
                
      end      
    }

    return puntosarr
    
  end


  # GET /puntos
  # GET /puntos.json
  def index
    @puntos = Punto.where("proyecto_id = ?", params[:proyecto_id]).order(:secuencia)
    @proyecto_id = params[:proyecto_id]
  end

  # GET /puntos/1
  # GET /puntos/1.json
  def show
  end

  # GET /puntos/new
  def new
    @punto = Punto.new
  end

  # GET /puntos/1/edit
  def edit
  end

  # POST /puntos
  # POST /puntos.json
  def create
    @punto = Punto.new(punto_params)
    @punto.proyecto_id = params[:proyecto_id]

    respond_to do |format|
      if @punto.save
        format.html { redirect_to @punto, notice: 'Punto was successfully created.' }
        format.json { render :show, status: :created, location: @punto }
      else
        format.html { render :new }
        format.json { render json: @punto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /puntos/1
  # PATCH/PUT /puntos/1.json
  def update
    respond_to do |format|
      if @punto.update(punto_params)
        format.html { redirect_to @punto, notice: 'Punto was successfully updated.' }
        format.json { render :show, status: :ok, location: @punto }
      else
        format.html { render :edit }
        format.json { render json: @punto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /puntos/1
  # DELETE /puntos/1.json
  def destroy
    @punto.destroy
    respond_to do |format|
      format.html { redirect_to puntos_url, notice: 'Punto was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_punto
      @punto = Punto.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def punto_params
      params.require(:punto).permit(:proyecto_id, :nombre, :secuencia, :lat, :long, :angulo, :distancia)
    end
end
