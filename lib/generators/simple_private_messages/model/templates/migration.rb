class <%= "Create#{plural_camel_case_name}" %> < ActiveRecord::Migration
  def self.up
    create_table :<%= plural_lower_case_name %> do |t|
      t.integer :sender_id, :recipient_id
      t.string :sender_type, :recipient_type
      t.boolean :sender_deleted, :recipient_deleted, :default => false
      t.string :subject
      t.text :body
      t.datetime :read_at
      t.timestamps
    end
    
    add_index :<%= plural_lower_case_name %>, :sender_id 
    add_index :<%= plural_lower_case_name %>, :sender_type 
    add_index :<%= plural_lower_case_name %>, :recipient_id 
    add_index :<%= plural_lower_case_name %>, :recipient_type 

  end

  def self.down
    
    remove_index :<%= plural_lower_case_name %>, :sender_id 
    remove_index :<%= plural_lower_case_name %>, :sender_type 
    remove_index :<%= plural_lower_case_name %>, :recipient_id 
    remove_index :<%= plural_lower_case_name %>, :recipient_type 
    
    drop_table <%= plural_lower_case_name %>

  end
end
