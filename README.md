# Holdy

Holdy is an app for saving personal user accounts such as Facebook, Instagram, Google, and Twitter Accounts and ensuring the security of user personal data. This app is built using Clean Architecture and BLoC state management for high-performance and reliable state management. The back-end is implemented using .NET Core API for scalability and security.

## Key Features

- **Modern UI to ease user experience.**
- **Create, edit platform**: Choose the name and color for its icon.
- **Create, edit account**: Add account name and dynamic account fields.
- **Dynamic account fields**: Pairs of {"keys": "values"} e.g., {"email": "email@yahoo.com"} with easy UI to learn.
- **Remove account or platform.**
- **Login, register, forgot password**: Using OTP with client and server-side validations.
- **Dark and Light mode.**
- **Online server database.**
- **High security**: Holdy provides a high level of security for the user and all the data are encrypted depending on the user's PIN and other factors so the encryption key is unique per user No one can access the users' data or their PINs from the cloud database because the PIN is saved and hashed for verifications only and the data are encrypted with the original PIN.
- **PIN creation**: Mandatory at registration and required each time the app starts.
- **Generate strong random password**: Securely create complex passwords for accounts.

## Flow of the Program

1. **User Registration and PIN Creation**:
   - Register a new user and create a mandatory PIN.
   
   ![Register](https://github.com/ahmed-taha1/Holdy-front-end/blob/master/screen%20shots/Register.png)
   ![Pin](https://github.com/ahmed-taha1/Holdy-front-end/blob/master/screen%20shots/Pin.png)

2. **Login and Authentication**:
   - User login with PIN verification.

   ![Login](https://github.com/ahmed-taha1/Holdy-front-end/blob/master/screen%20shots/Login.png)

3. **Home Screen and Navigation**:
   - Access the home screen and navigate through the app.

   ![Home](https://github.com/ahmed-taha1/Holdy-front-end/blob/master/screen%20shots/Home.png)

4. **Platform and Account Management**:
   - Create, edit, and manage platforms.
   - Create, edit, and manage accounts within those platforms.

   ![Create Platform](https://github.com/ahmed-taha1/Holdy-front-end/blob/master/screen%20shots/Create%20Platform.png)
   ![Facebook Platform](https://github.com/ahmed-taha1/Holdy-front-end/blob/master/screen%20shots/Facebook%20Platform.png)
   ![Create Account](https://github.com/ahmed-taha1/Holdy-front-end/blob/master/screen%20shots/Create%20Account.png)
   ![Account](https://github.com/ahmed-taha1/Holdy-front-end/blob/master/screen%20shots/Account.png)

5. **Generate Strong Random Password**:
   - Securely generate strong random passwords for your accounts.

   ![Create Random Password](https://github.com/ahmed-taha1/Holdy-front-end/blob/master/screen%20shots/Create%20Random%20Password.png)

6. **Settings and Personalization**:
   - Customize app settings, including Dark and Light modes.

   ![Settings](https://github.com/ahmed-taha1/Holdy-front-end/blob/master/screen%20shots/Settings.png)

7. **Offline Mode**:
   - Functionality to handle offline scenarios.

   ![Offline](https://github.com/ahmed-taha1/Holdy-front-end/blob/master/screen%20shots/Offline.png)
