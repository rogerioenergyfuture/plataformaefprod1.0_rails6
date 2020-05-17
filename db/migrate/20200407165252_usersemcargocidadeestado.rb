class Usersemcargocidadeestado < ActiveRecord::Migration[5.2]
  def change
    remove_reference :user_startups, :state
    remove_reference :user_startups, :city
    remove_reference :user_startups, :cargo
  end
end
