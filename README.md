Add your own google json file.

Add manually admin details as shown in the below image. 

![firebase main firestore page](https://user-images.githubusercontent.com/64288579/147439157-e7f34530-a4b0-45bf-aa08-86d451b3aaaf.PNG)

you can add products from the admin page.

Please set the Firestore and firebase Storage rule to below rules.


rules_version = '2';

service cloud.firestore {

  match /databases/{database}/documents {

    match /{document=**} {

      allow read, write: if true;

    }

  }

}

