# Create Codeship Build - GitHub Action

Simple action that creates an auth token and calls the Codeship API to [create a build](https://apidocs.codeship.com/v2/builds/create-build) for a specific project.

Required `ENV` variables:

* `CODESHIP_USERNAME`
* `CODESHIP_PASSWORD`
* `CODESHIP_ORG_UUID`
* `CODESHIP_PROJECT_UUID`
* `CODESHIP_API_URL` (optional)
* `CODESHIP_PROJECT_REF` (optional, defaults to `master`)
