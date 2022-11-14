extends Node2D

onready var bdate = $label_bday/date
onready var bmonth = $label_bday/month
onready var byear = $label_bday/year
onready var yr_lvl = $label_grade/year_lvl
onready var male = $gender/male
onready var female = $gender/female

onready var fname = $label_stud_fname/student_fname
onready var mname = $label_stud_fname/student_mname
onready var lname = $label_stud_fname/student_lname
onready var age = $label_age/age
onready var stud_num = $label_stud_id/stud_id
onready var section = $label_section/section

onready var buttons = $buttons

var dates_added = false

func add_bday(x,y,z):
	while(y<z):
		x.add_item(str(y))
		y+=1

func _ready():
	pass


func _on_Cancel2_pressed():
	var old_bdate = bdate.text
	var old_bmonth = bmonth.text
	var old_year = byear.text
	var old_yr_lvl = yr_lvl.text
	
	if(dates_added == false):
		add_bday(bdate,1,32)
		add_bday(bmonth,1,13)
		add_bday(byear,1995,2016)
		add_bday(yr_lvl,7,11)
		dates_added = true
	
	restore_value(bdate,old_bdate)
	restore_value(bmonth,old_bmonth)	
	restore_value(byear,old_year)	
	restore_value(yr_lvl,old_yr_lvl)
	
	######### ENABLES USER INPUT ############
	enable_option(bdate,false)
	enable_option(bmonth,false)
	enable_option(byear,false)
	enable_option(yr_lvl,false)
	enable_option(male,false)
	enable_option(female,false)
	
	textbox_editable(fname,true)
	textbox_editable(mname,true)
	textbox_editable(lname,true)
	textbox_editable(age,true)
	textbox_editable(stud_num,true)
	textbox_editable(section,true)
	
	buttons.visible = true
	
	######### END OF ENABLING USER INPUT ############
	
	
	
func enable_option(x,y):
		x.disabled = y

func textbox_editable(x,y):
		x.editable = y

func restore_value(x,y):
	x.text = y
	


func _on_Cancel_pressed():
	
	enable_option(bdate,true)
	enable_option(bmonth,true)
	enable_option(byear,true)
	enable_option(yr_lvl,true)
	enable_option(male,true)
	enable_option(female,true)
	
	textbox_editable(fname,false)
	textbox_editable(mname,false)
	textbox_editable(lname,false)
	textbox_editable(age,false)
	textbox_editable(stud_num,false)
	textbox_editable(section,false)
	
	buttons.visible = false


func _on_Save_pressed():
	_on_Cancel_pressed()
