class CreateProyectos < ActiveRecord::Migration[6.0]
  def change
    create_table :proyectos do |t|
      t.string :nombre
      t.string :descripcion
      t.string :comitente
      t.string :constructor
      t.string :proyectista
      t.date :fproyecto
      t.string :ubicacion
      t.string :expediente
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
