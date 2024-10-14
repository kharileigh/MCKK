# MCKK : Final Engineering Project


## User Story
A user can register and submit an application for a small business loan

## MVP Interactions
- Register (email verification)
- Login (2FA)
- Submit Loan Application
- View Status of Loan

## Models
#### USER
##### Validations :
-  Username is not taken
-  Password is valid (8 characters min : including 1 num, 1 special character)
-  Email is valid
-  MFA
-  Google_secret

#### LOAN
##### Validations :
- Company name is unique
- Description is under total characters
- Net income > 0
- Years in Operations >= 3


##### Loan Application Form :
- `Company Name` : **text**
- `Industry` :
    - Construction — Catering — Retail — Service — Other (**dropdown**)
- `Description` : **text**
- `Yearly Revenue` : **integer**
- `Net Income` : **integer**
- `Loan Amount` : **integer**
    - **small :**  100,000 — 200, 000 — 300, 000 — 400, 000 — 500, 000 (**dropdown**)
    - **large :** 600,000 — 700,000 — 800,000 — 900, 000, — 1,000,000 (**dropdown**)
- `Operating Expenses` : **integer**
- `Years In Business` :
    - 0 - 2yrs — under 5yrs — under 10yrs — 10yrs+ (**dropdown**)

