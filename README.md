# Earthquake
App displaying a Master Detail view to display Earthquake data.

## Prerequisites

* Xcode

## Getting Started

1. Clone repo
2. Open in Xcode using the xcworkspace file

##

App fetches data from the following API:
- http://api.geonames.org/earthquakesJSON
- The app displays a SplitviewController with the the list of Earthquakes as the master view and the mapview shown in the details view
-  App supports orientation support. On iPad, iPhone 6 Plus, iPhone 7 Plus and iPhone 8 Plus using landscape mode will display both master and detail view.
- Table view can be refreshed using the pull-to-refresh action
- MVP architecture is used
- Repository pattern is used for the business logic
- All dependecies are injected and can be mocked
- Custom networking layer implemented
- Project structured into Data, Domain and UI layer
- Uses reactive and functional aspects and adheres to the SOLID principles


#### Tests
**NB** Make sure you have the iPhone 8 Plus selected as the target when running the tests otherwise they will fail.

- Unit tests are written for all business logic
- Snapshot tests added for UI testing and aiding TDD

Unit tests can be found in the `EarthquakesTests` folder.

Snapshot tests can be found in the `EarthquakesSnapshotTests` folder.

Run the tests by clicking the play icon next to each test class or `cmd + U` to run all tests.

If you've made any UI changes then you need to update the snapshot tests:
1. Click the scheme button in the top left corner of XCode.
2. Select "Edit Scheme". This should open a pop up. 
3. Select the "Run" tab and tick the environment variable for `RECORD_MODE`.
4. Run the tests that need updating. They'll still fail but the error should say that they've been run in record mode and the results recorded.
5. Untick the `RECORD_MODE` variable in the scheme again.
6. Run the updated tests again. They should now pass.

## Troubleshooting

### XCode fails to open the project properly
* Make sure you've run `pod install` before opening.
* Make sure you've opened the workspace file and not the project file.
* Make sure you have at least v11 of XCode.

### The iOS snapshot tests fail
* Make sure to use the iPhone 8 Plus simulator. The tests are set to a screen size so if you use a different device they fail.

