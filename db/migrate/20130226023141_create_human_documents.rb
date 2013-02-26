class CreateHumanDocuments < ActiveRecord::Migration
  def change
    create_table :human_documents do |t|
      t.references :document_type
      t.references :human
      t.string :code

      t.timestamps
    end
    add_index :human_documents, :document_type_id
    add_index :human_documents, :human_id
  end
end
