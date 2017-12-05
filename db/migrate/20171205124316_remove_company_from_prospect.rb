class RemoveCompanyFromProspect < ActiveRecord::Migration[5.1]
  def change
    remove_column :prospects, :company_id
    add_reference :companies, :prospect, index: true
  end
end
