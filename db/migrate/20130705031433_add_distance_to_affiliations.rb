class AddDistanceToAffiliations < ActiveRecord::Migration
  def change
    add_column :affiliations, :distance, :string
  end
end
