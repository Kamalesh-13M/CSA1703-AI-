% Facts: disease(Name).
disease(diabetes).
disease(hypertension).
disease(obesity).
disease(celiac).
disease(heart_disease).

% Facts: diet_recommendation(Disease, DietType).
diet_recommendation(diabetes, low_sugar).
diet_recommendation(hypertension, low_salt).
diet_recommendation(obesity, low_calorie).
diet_recommendation(celiac, gluten_free).
diet_recommendation(heart_disease, low_fat).

% Suggest a diet for a given disease
suggest_diet(Disease, Diet) :-
    disease(Disease),
    diet_recommendation(Disease, Diet).
