# Turing Backend Mod 2 Assessments

This repository is a practice exercise of a previous cohort's final assessment in Mod 2.

### Description
Hospitals have many Doctors, Doctors work for just one hospital. Doctors can have many patients, and patients can have many doctors.

## Database Information
* Hospitals have a name
* Doctors have a name, specialty, and university that they attended
* Patients have a name and age


## Instructions
​
Set up your database tables, models, and relationships. Then, complete the user stories.

## User Stories
​
```
User Story 1, Doctors Show Page
​
As a visitor
When I visit a doctor's show page
I see all of that doctor's information including:
 - name
 - specialty
 - university where they got their doctorate
And I see the name of the hospital where this doctor works
And I see the names of all of the patients this doctor has
```


```
User Story 2, Hospital Show Page

As a visitor
When I visit a hospital's show page
I see the hospital's name
And I see the number of doctors that work at this hospital
And I see a unique list of universities that this hospital's doctors attended
```


```
User Story 3, Remove a Patient from a Doctor
​
As a visitor
When I visit a Doctor's show page
Next to each patient's name, I see a button to remove that patient from that doctor's caseload
When I click that button for one patient
I'm brought back to the Doctor's show page
And I no longer see that patient's name listed
```

## Extensions

```
Extension, Patient Index Page

As a visitor
When I visit the patient index page
I see the names of all patients listed from oldest to youngest
