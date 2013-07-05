class CreateAffiliations < ActiveRecord::Migration
  def change
    create_table :affiliations do |t|
      t.string :first_pre_id
      t.string :second_pre_id
      t.string :relationship

      t.timestamps
    end
  end
end
