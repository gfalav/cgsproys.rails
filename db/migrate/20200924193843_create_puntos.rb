class CreatePuntos < ActiveRecord::Migration[6.0]
  def change
    create_table :puntos do |t|
      t.references :proyecto, null: false, foreign_key: true
      t.string :nombre
      t.decimal :secuencia
      t.decimal :lat
      t.decimal :long
      t.decimal :angulo
      t.decimal :distancia

      t.timestamps
    end
  end
end
