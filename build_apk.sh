# Checking firebase cli toold are installed or not
# Won't work in case of windows
# Only work in Mac and Linux
curl -sL https://firebase.tools | bash

# You will also need to login to firebase CLI via Google Chrome
# To login via differnt account just user firebase logout 
# and re run this script

# Avoiding login through browser and using CI with token
# firebase login

# Building dev apk on the current branch

echo "Current checkout branch is..."

git branch

bash prcheck.sh

if [ -z $1 ]
then
      FLAVOR="development"
else
      FLAVOR=$1
fi

echo "Building $FLAVOR APK file"

if flutter build apk; then
    # SECRETS FROM GITHUB
    FIREBASE_TOKEN="${{ secrets.FIREBASE_TOKEN }}"
    APP_ID="${{ secrets.FIREBASE_APP_ID }}"

    echo "Build Success"

    echo "Distributing the $FLAVOR APK File to firebase"

    firebase appdistribution:distribute build/app/outputs/flutter-apk/app-release.apk --app APP_ID --groups "qa" --token FIREBASE_TOKEN

else
    echo "Build Failed"

fi