module PuntosHelper
	def puntostr(punto)
		str = number_with_precision(punto.secuencia, precision: 0) + ' - '
		str = str + punto.nombre + ' - '
		str = str + 'Lat: ' + number_with_precision(punto.lat, precision: 3) + ' - '
		str = str + 'Long: ' + number_with_precision(punto.long, precision: 3) + ' - '
		str = str + 'Dist: ' + number_with_precision(punto.distancia, precision: 0) + 'm - '
		str = str + 'Ang: ' + number_with_precision(punto.angulo, precision: 1) + '°'
	end
end
