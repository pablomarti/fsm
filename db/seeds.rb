# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if Level.all.length == 0
	puts "Levels"
	Level.create!(:name => "Administrador")
	Level.create!(:name => "Recepcionista")
	Level.create!(:name => "Psicologo")
	Level.create!(:name => "Medico")
	Level.create!(:name => "Trabajador Social")
end

if Role.all.length == 0
	puts "Roles"
	Role.create!(:name => "Asistencia", :alias => "read case")
	Role.create!(:name => "Crear caso", :alias => "create case")
	Role.create!(:name => "Editar caso", :alias => "edit case")
	Role.create!(:name => "Eliminar caso", :alias => "remove case")

	LevelRole.destroy_all

	#Recepcionista
	LevelRole.create!(:level_id => 2, :role_id => 1)
	LevelRole.create!(:level_id => 2, :role_id => 2)

	#Psicologo
	LevelRole.create!(:level_id => 3, :role_id => 2)
	LevelRole.create!(:level_id => 3, :role_id => 3)

	#Medico
	LevelRole.create!(:level_id => 4, :role_id => 2)
	LevelRole.create!(:level_id => 4, :role_id => 3)

	#Trabajador Social
	LevelRole.create!(:level_id => 5, :role_id => 2)
	LevelRole.create!(:level_id => 5, :role_id => 3)
end

if User.all.length == 0
	puts "Admin User"
	User.create!(	:level_id => 1,
					:name => "Admin", 
					:last_name => "Admin", 
					:email => "admin@fosalud.com",
					:password => "abcdefgh",
					:password_confirmation => "abcdefgh")
end