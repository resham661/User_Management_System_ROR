class CreateUserRoleManagement < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :full_name
      t.string :email
      t.string :username
      t.string :password
      t.timestamps
    end

    create_table :roles do |t|
      t.string :role_name
      t.timestamps
    end

    create_table :roles_users do |t|
      t.belongs_to :user
      t.belongs_to :role
    end

  end
end
