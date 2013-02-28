#!/bin/env ruby
# encoding: utf-8
if Level.all.length == 0
	puts "Levels"
	admin = Level.new(:name => "Administrador")
	recepcionista = Level.new(:name => "Recepcionista")
	psicologo = Level.new(:name => "Psicologo")
	medico = Level.new(:name => "Medico")
	social = Level.new(:name => "Trabajador Social")

	admin.save
	recepcionista.save
	psicologo.save
	medico.save
	social.save

	Role.destroy_all

	#System cases
	asistencia = Role.new(:name => "Asistencia", :alias => "read_case")
	nuevo_caso = Role.new(:name => "Crear caso", :alias => "create_case")
	editar_caso = Role.new(:name => "Editar caso", :alias => "edit_case")
	eliminar_caso = Role.new(:name => "Eliminar caso", :alias => "remove_case")

	asistencia.save
	nuevo_caso.save
	editar_caso.save
	eliminar_caso.save

	LevelRole.destroy_all

	#Recepcionista
	LevelRole.create!(:level_id => recepcionista.id, :role_id => asistencia.id)
	LevelRole.create!(:level_id => recepcionista.id, :role_id => nuevo_caso.id)

	#Psicologo
	LevelRole.create!(:level_id => psicologo.id, :role_id => asistencia.id)
	LevelRole.create!(:level_id => psicologo.id, :role_id => editar_caso.id)

	#Medico
	LevelRole.create!(:level_id => medico.id, :role_id => asistencia.id)
	LevelRole.create!(:level_id => medico.id, :role_id => editar_caso.id)

	#Trabajador Social
	LevelRole.create!(:level_id => social.id, :role_id => asistencia.id)
	LevelRole.create!(:level_id => social.id, :role_id => editar_caso.id)
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
unless EmotionalCondition.all.length > 0
	puts "Creating emotional  condition"
	EmotionalCondition.create!(:name => "Agresividad")
	EmotionalCondition.create!(:name => "Angustia")
	EmotionalCondition.create!(:name => "Tristeza")
	EmotionalCondition.create!(:name => "Impotencia")
	EmotionalCondition.create!(:name => "Culpa")
	EmotionalCondition.create!(:name => "Indiferencia")
	EmotionalCondition.create!(:name => "Miedo")
	EmotionalCondition.create!(:name => "Enojo")
	EmotionalCondition.create!(:name => "Confusión")
	EmotionalCondition.create!(:name => "Inseguridad")
	EmotionalCondition.create!(:name => "Intencion Suicida")
	EmotionalCondition.create!(:name => "Ideación Suicida")
	EmotionalCondition.create!(:name => "Intento Homicida")
	EmotionalCondition.create!(:name => "Ideación Homicida")
end
unless PsychoPhysioAlteration.all.length > 0
	print "Creating psycophisiological condition\n"
	PsychoPhysioAlteration.create!(:name => "Alteracion del sueño")
	PsychoPhysioAlteration.create!(:name => "Alteracion del apetito")
	PsychoPhysioAlteration.create!(:name => "Alteracion del gastrointestinal")
	PsychoPhysioAlteration.create!(:name => "Dolor de cabeza")
	PsychoPhysioAlteration.create!(:name => "Palpitacion")
	PsychoPhysioAlteration.create!(:name => "Suduracion excesiva")
	PsychoPhysioAlteration.create!(:name => "Temblor del cuerpo")
	PsychoPhysioAlteration.create!(:name => "Tic nervioso")
	PsychoPhysioAlteration.create!(:name => "Alteracion de la piel")
	PsychoPhysioAlteration.create!(:name => "Mareos")
end
unless AggressionKind.all.length > 0
	puts "Creating Aggressions Kinds"
	AggressionKind.create!(:name=>"Formas de violencia")
	AggressionKind.create!(:name=>"Tipo de lessiones fisicas")
	AggressionKind.create!(:name=>"Tipos de Agresion sexual")
	AggressionKind.create!(:name=>"Frecuencia de la agresion")
end

unless Aggression.all.length > 0
	puts "Creating Aggressions for Aggression Kind 1"
	Aggression.create!(:name=>"Patrimonial", :aggression_kind_id=>1)
	Aggression.create!(:name=>"Financiera", :aggression_kind_id=>1)
	Aggression.create!(:name=>"Social", :aggression_kind_id=>1)
	Aggression.create!(:name=>"Sexual", :aggression_kind_id=>1)


	puts "Creating Aggressions for Aggression Kind 2"
	Aggression.create!(:name=>"Golpes", :aggression_kind_id=>2)
	Aggression.create!(:name=>"Armas de fuego", :aggression_kind_id=>2)
	Aggression.create!(:name=>"Arma blanca", :aggression_kind_id=>2)
	Aggression.create!(:name=>"Mordidas", :aggression_kind_id=>2)
	Aggression.create!(:name=>"Quemaduras", :aggression_kind_id=>2)
	Aggression.create!(:name=>"Halones de pelo", :aggression_kind_id=>2)
	Aggression.create!(:name=>"Empujones", :aggression_kind_id=>2)
	Aggression.create!(:name=>"Amenazas", :aggression_kind_id=>2)

	puts "Creating Aggressions for Aggression Kind 3"
	Aggression.create!(:name=>"Vaginal", :aggression_kind_id=>3)
	Aggression.create!(:name=>"Anal", :aggression_kind_id=>3)
	Aggression.create!(:name=>"Oral", :aggression_kind_id=>3)

	puts "Creating Aggressions for Aggression Kind 4"
	Aggression.create!(:name=>"Diraria", :aggression_kind_id=>4)
	Aggression.create!(:name=>"Semanal", :aggression_kind_id=>4)
	Aggression.create!(:name=>"Quincenal", :aggression_kind_id=>4)
end


if HumanCondition.all.length == 0
	puts "Human Conditions"

	HumanCondition.create!(:name => "Alcoholizado/a")
	HumanCondition.create!(:name => "Estable/Sobrio")
	HumanCondition.create!(:name => "Trastorno psiquiatrico")
	HumanCondition.create!(:name => "Drogado/a")
end

if WeaponKind.all.length == 0
	puts "Weapon Kind"

	WeaponKind.create!(:name => "Arma blanca")
	WeaponKind.create!(:name => "Arma de fuego")
end
