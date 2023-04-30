% Define the possible fitness levels
fitness_level(beginner).
fitness_level(intermediate).
fitness_level(advanced).
fitness_level(elite).

% Define the possible workout goals
workout_goal(weight_loss).
workout_goal(muscle_gain).
workout_goal(strength_training).
workout_goal(cardiovascular_health).
workout_goal(sports_performance).
% Define the possible workout routines for each fitness level and goal
workout_routine(beginner, weight_loss, ['30 minutes of cardio', '10 minutes of strength training', '5 minutes of stretching']).
workout_routine(beginner, muscle_gain, ['20 minutes of cardio', '20 minutes of strength training', '5 minutes of stretching']).
workout_routine(beginner, strength_training, ['10 minutes of cardio', '30 minutes of strength training', '5 minutes of stretching']).
workout_routine(beginner, cardiovascular_health, ['45 minutes of cardio', '10 minutes of strength training', '5 minutes of stretching']).
workout_routine(beginner, sports_performance, ['20 minutes of cardio', '30 minutes of strength training', '10 minutes of stretching']).

workout_routine(intermediate, weight_loss, ['45 minutes of cardio', '15 minutes of strength training', '10 minutes of stretching']).
workout_routine(intermediate, muscle_gain, ['30 minutes of cardio', '30 minutes of strength training', '10 minutes of stretching']).
workout_routine(intermediate, strength_training, ['15 minutes of cardio', '45 minutes of strength training', '10 minutes of stretching']).
workout_routine(intermediate, cardiovascular_health, ['60 minutes of cardio', '20 minutes of strength training', '10 minutes of stretching']).
workout_routine(intermediate, sports_performance, ['30 minutes of cardio', '40 minutes of strength training', '10 minutes of stretching']).

workout_routine(advanced, weight_loss, ['60 minutes of cardio', '20 minutes of strength training', '15 minutes of stretching']).
workout_routine(advanced, muscle_gain, ['40 minutes of cardio', '40 minutes of strength training', '15 minutes of stretching']).
workout_routine(advanced, strength_training, ['20 minutes of cardio', '60 minutes of strength training', '15 minutes of stretching']).
workout_routine(advanced, cardiovascular_health, ['75 minutes of cardio', '30 minutes of strength training', '15 minutes of stretching']).
workout_routine(advanced, sports_performance, ['40 minutes of cardio', '50 minutes of strength training', '15 minutes of stretching']).
workout_routine(elite, weight_loss, ['75 minutes of cardio', '30 minutes of strength training', '20 minutes of stretching']).
workout_routine(elite, muscle_gain, ['50 minutes of cardio', '50 minutes of strength training', '20 minutes of stretching']).
workout_routine(elite, strength_training, ['30 minutes of cardio', '90 minutes of strength training', '20 minutes of stretching']).
workout_routine(elite, cardiovascular_health, ['90 minutes of cardio', '40 minutes of strength training', '20 minutes of stretching']).
workout_routine(elite, sports_performance, ['50 minutes of cardio', '70 minutes of strength training', '20 minutes of stretching']).
% Define the age ranges for different fitness levels
age_range(beginner, 18, 30).
age_range(beginner, 31, 50).
age_range(beginner, 51, 70).
age_range(intermediate, 18, 30).
age_range(intermediate, 31, 50).
age_range(intermediate, 51, 70).
age_range(advanced, 18, 30).
age_range(advanced, 31, 50).
age_range(advanced, 51, 70).

% Define the possible genders
gender(male).
gender(female).
% Define the possible medical conditions
medical_condition(arthritis).
medical_condition(asthma).
medical_condition(diabetes).
medical_condition(high_blood_pressure).
medical_condition(osteoporosis).

% Define the available equipment
equipment(treadmill).
equipment(elliptical).
equipment(weight_machine).
equipment(free_weights).
equipment(resistance_bands).
% Define a predicate to check if the user is within the age range for their fitness level
within_age_range(FitnessLevel, Age) :-
    age_range(FitnessLevel, MinAge, MaxAge),
    Age >= MinAge,
    Age =< MaxAge.
% Define a predicate to recommend a workout routine based on the user's fitness level, goal, age, gender, and medical conditions
recommend_workout_routine(FitnessLevel, Goal, Age, Gender, MedicalConditions, Routine) :-
    fitness_level(FitnessLevel),
    workout_goal(Goal),
    within_age_range(FitnessLevel, Age),
    gender(Gender),
    findall(MedicalCondition, (member(MedicalCondition, MedicalConditions), medical_condition(MedicalCondition)), ValidMedicalConditions),
    length(MedicalConditions, NumMedicalConditions),
    length(ValidMedicalConditions, NumValidMedicalConditions),
    NumValidMedicalConditions =:= NumMedicalConditions,
    workout_routine(FitnessLevel, Goal, Routine),
    not((member(MedicalCondition, ValidMedicalConditions), member(MedicalCondition, Routine))).
