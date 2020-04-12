##### Clear DB Before Seeding #####

# [User, Exercise, Workout, Category].each {|c| c.destroy_all}

# ActiveRecord::Base.connection.tables.each do |t|
#   ActiveRecord::Base.connection.execute("Delete from #{t}")
#   ActiveRecord::Base.connection.execute("DELETE FROM SQLITE_SEQUENCE WHERE name='#{t}'")
# end

##### Create Users #####

otto = User.create(
  first_name: "Otto",
  last_name: "Cedeno",
  username: "ottocedeno",
  password: "tac0s"
)

korey = User.create(
  first_name: "Korey",
  last_name: "Rowe",
  username: "onepercent",
  password: "fatcat"
)

charlotte = User.create(
  first_name: "Charlotte",
  last_name: "Kassimir",
  username: "charkasstic",
  password: "fatcat"
)

joe = User.create(
  first_name: "Joe",
  last_name: "LoNigro",
  username: "gorgon",
  password: "fatcat"
)

samantha = User.create(
  first_name: "Samantha",
  last_name: "Becker",
  username: "littlelinus",
  password: "fatcat"
)


##### Categories #####

arms = Category.create(name: "Arms")
chest = Category.create(name: "Chest")
back = Category.create(name: "Back")
legs = Category.create(name: "Legs")
core = Category.create(name: "Core")
cardio = Category.create(name: "Cardio")


##### Exercises #####

#ARMS
curls = Exercise.create(name: "Bicep Curls", rep_count: 10, category: arms)
shoulder_press = Exercise.create(name: "Shoulder Press", rep_count: 12, category: arms)
tricep_extensions = Exercise.create(name: "Tricep Extensions", rep_count: 10, category: arms)
lateral_raises = Exercise.create(name: "Lateral Raises", rep_count: 12, category: arms)
dips = Exercise.create(name: "Dips", rep_count: 12, category: arms)

#CHEST
pushups = Exercise.create(name: "Pushups", rep_count: 15, category: chest)
diver_pushups = Exercise.create(name: "Diver Pushups", rep_count: 10, category: chest)
chest_press = Exercise.create(name: "Chest Press", rep_count: 12, category: chest)

#BACK
rows = Exercise.create(name: "Bent Over Rows", rep_count: 15, category: back)
flys = Exercise.create(name: "Bent Over Flys", rep_count: 15, category: back)
pullups = Exercise.create(name: "Pullups", rep_count: 10, category: back)
renegade_rows = Exercise.create(name: "Renegade Rows", rep_count: 12, category: back)

#LEGS
squats = Exercise.create(name: "Squats", rep_count: 15, category: legs)
lunges = Exercise.create(name: "Lunges", rep_count: 20, category: legs)
side_lunges = Exercise.create(name: "Side Lunges", rep_count: 20, category: legs)
rdl = Exercise.create(name: "Single Leg RDL", rep_count: 12, category: legs)

#CORE
situps = Exercise.create(name: "Situps", rep_count: 20, category: core)
toe_touches = Exercise.create(name: "Toe Touches", rep_count: 12, category: core)
plank_jacks = Exercise.create(name: "Plank Jacks", rep_count: 15, category: core)
bicycles = Exercise.create(name: "Bicycle Crunches", rep_count: 30, category: core)
wall_sit = Exercise.create(name: "Wall Sit", rep_count: 30, category: core)
side_plank_twist = Exercise.create(name: "Side Plank Twists", rep_count: 20, category: core)
leg_lifts = Exercise.create(name: "Leg Lifts", rep_count: 15, category: core)

#CARDIO
jump_squats = Exercise.create(name: "Jump Squats", rep_count: 15, category: cardio)
climbers = Exercise.create(name: "Mountain Climbers", rep_count: 20, category: cardio)
burpees = Exercise.create(name: "Burpees", rep_count: 10, category: cardio)
high_knees = Exercise.create(name: "High Knees", rep_count: 30, category: cardio)


##### Workouts #####

Workout.create(
  name: "Full Body Wake Up",
  description: "Hit every muscle group once. Perfect for mornings.",
  user: otto,
  exercises: [lateral_raises, situps, lunges, pushups, climbers]
)

Workout.create(
  name: "Abs, Abs, Abs",
  description: "Quick way to keep the ice cream away!",
  user: charlotte,
  exercises: [situps, bicycles, leg_lifts, plank_jacks, side_plank_twist]
)

Workout.create(
  name: "Cardio Gods 101",
  description: "This one will get your heart rate up.",
  user: korey,
  exercises: [climbers, wall_sit, high_knees, jump_squats, burpees]
)

Workout.create(
  name: "Arm Pump",
  description: "Focused on glamour muscles.  Great before beach.",
  user: otto,
  exercises: [curls, pushups, pullups, dips, shoulder_press]
)

Workout.create(
  name: "Warm Up Before a Run",
  description: "Try this one out before a run.",
  user: samantha,
  exercises: [squats, high_knees, rdl, toe_touches, bicycles]
)

Workout.create(
  name: "Bis and Back",
  description: "Focused on upper body pull motions",
  user: joe,
  exercises: [renegade_rows, curls, flys, pullups, rows]
)

Workout.create(
  name: "Quick Conditioning and Core",
  description: "Great for an after work sweat!",
  user: korey,
  exercises: [burpees, bicycles, lunges, leg_lifts, plank_jacks]
)