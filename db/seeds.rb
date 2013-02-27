if Level.all.length == 0
	puts "Levels"
	Level.create!(:name => "Administrador")
	Level.create!(:name => "Recepcionista")
	Level.create!(:name => "Psicologo")
	Level.create!(:name => "Medico")
	Level.create!(:name => "Trabajador Social")

	Role.destroy_all

	Role.create!(:name => "Asistencia", :alias => "read case")
	Role.create!(:name => "Crear caso", :alias => "create case")
	Role.create!(:name => "Editar caso", :alias => "edit case")
	Role.create!(:name => "Eliminar caso", :alias => "remove case")

	LevelRole.destroy_all

	#Recepcionista
	LevelRole.create!(:level_id => 2, :role_id => 1)
	LevelRole.create!(:level_id => 2, :role_id => 2)
	LevelRole.create!(:level_id => 2, :role_id => 4)

	#Psicologo
	LevelRole.create!(:level_id => 3, :role_id => 1)
	LevelRole.create!(:level_id => 3, :role_id => 3)

	#Medico
	LevelRole.create!(:level_id => 4, :role_id => 1)
	LevelRole.create!(:level_id => 4, :role_id => 3)

	#Trabajador Social
	LevelRole.create!(:level_id => 5, :role_id => 1)
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

if ViolenceKind.all.length == 0
	puts "Violence Kinds"

	ViolenceKind.create!(:name => "Victima")
	ViolenceKind.create!(:name => "Agresor")
	ViolenceKind.create!(:name => "Complice")
	ViolenceKind.create!(:name => "Testigo")
end

if State.all.length == 0
	puts "States and Cities"

	City.destroy_all

	state = State.new(:name => "San Salvador")
	state.cities << City.new(:name => "San Salvador")
	state.cities << City.new(:name => "Mejicanos")
	state.cities << City.new(:name => "Apopa")
	state.cities << City.new(:name => "Ciudad Delgado")
	state.save
end

if ZoneKind.all.length == 0
	puts "Zone Kinds"

	ZoneKind.create!(:name => "Ciudad")
	ZoneKind.create!(:name => "Campo")
end

if PregnancyState.all.length == 0
	puts "Pregnancy States"

	PregnancyState.create!(:name => "Si")
	PregnancyState.create!(:name => "No")
	PregnancyState.create!(:name => "N/A")
	PregnancyState.create!(:name => "Desconoce")
	PregnancyState.create!(:name => "Deseado")
	PregnancyState.create!(:name => "No deseado")
end

if CivilState.all.length == 0
	puts "Civil States"

	CivilState.create!(:name => "Soltero")
	CivilState.create!(:name => "Casado")
	CivilState.create!(:name => "Divorciado")
	CivilState.create!(:name => "Acompanado")
	CivilState.create!(:name => "Viudo")
end

if EducationalLevel.all.length == 0
	puts "Educational Level"

	EducationalLevel.create!(:name => "Ninguno")
	EducationalLevel.create!(:name => "Parvularia")
	EducationalLevel.create!(:name => "Primaria")
	EducationalLevel.create!(:name => "Secundaria")
	EducationalLevel.create!(:name => "Bachillerato")
	EducationalLevel.create!(:name => "Universitario")
end

if Ocupation.all.length == 0
	puts "Ocupation"

	Ocupation.create!(:name => "Ama de casa")
	Ocupation.create!(:name => "Maestro")
	Ocupation.create!(:name => "Servicios domesticos")
	Ocupation.create!(:name => "Panadero")
	Ocupation.create!(:name => "Estudiante")
	Ocupation.create!(:name => "N/A")
	Ocupation.create!(:name => "Ninguno")
end