class CreateWechats < ActiveRecord::Migration[5.1]
  def change
    create_table :wechats do |t|

      t.timestamps
    end
  end
end
