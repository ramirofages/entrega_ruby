class AddIsJuridicToPerson < ActiveRecord::Migration
  def change
    add_column :people, :isJuridic, :boolean
  end
end
