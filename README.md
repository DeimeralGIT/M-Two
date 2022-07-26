# M-TWO

Second Flutter Challenge Assignment for M-One

- Entire state management is built with MOBX
- user model consists of "username", "email" and "password"
- when accounts are created the model is stored in the application path directory
- if there is at least one stored account - the first will be autofilled when application starts
- during sign in, alerts will prompt if the username or email do not exist or if the password is incorrect
- when signing up - the username or email have to be unique and not used in another stored account
- all fields have default validation for not being empty, however e-mail field would need to pass a regex validation on sign up
- "forgot password" pushes navigator to a new page for recovering the password
- for receiving a verification code - user has to put an e-mail that's linked to a stored account
- verification code for resetting the password can be anything
- Both during signing up and changing password the "confirm password" and "password" fields need to be the same

UI
- the app theme brightness depends on system brightness (colors adjust automatically when brightness is changed from settings)
- the upper left icon has an animation that can be triggered by tapping on it
- for sign-in/sign-up fields and send email/verification code fields - AnimatedSwitcher widget was used (linked with mobx, as well as given unique keys)

cons
- there are no UI updates for loading states (meaning there is no loading animation for whenever accounts need to load)
- no params were given to inputs that might cause overflow (like max length or max lines)
- spaghetti code in some places
