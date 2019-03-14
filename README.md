#2 ReadMe

1. This application enable user input any text, then there will be a list of entities and their details returned over network. User can see output in grid/collection view with four columns. (It have two targets one for dev and other for prod, environment can be configured from AppConfig file)

----
2. This application uses lazy loading technique for best performance.

---

3. The architecture of the project is MVVM.
The project have plenty of unit test cases as well as a UI test case.

---

4. I am using simple in memory cache for saving imags from cloud.

---
5. I am using custom view for search and collection view, created programmatically. Have prefered programmatic autolayouting becuase it's less prone to conflicts, easy to reuse and share. Also saves development time as it does not hangs system.

---

6. I am using latest codable protocol for parsing json returned.

---
7. Main Classes:

  * ImageCache.swift
Created my own simple to use Image Cache. The very first time image will be saved from cloud into cache and next time will be fetched from cache only.

---

  * UtilityExtensions.swift
I love extensions most in swift, as they can be easily reused. Created one extension to show alert.

---

  * CollectionViewDataSourceHandler.swift
Have implementation of cellForRowAt method and numberOfRowsInSection.

---

  * CollectionViewDelegateHandler.swift
Have implementation of didSelectRowAt.

---

  * CollectionViewDelegateFlowLayoutHandler.swift
Implements delegate method related to positionings and margins of collection view cells.

---

  * SearchBarDelegateHandler.swift
Implements delegate method related to UISearchBar actions like didEndEditing, searchBarSearchButtonClicked.

---

  * APIHandler.swift
It takes care of networking, uses simple URLSession class.

---

  * CustomCollectionView.swift
I am using custom view for search and collection view, created programmatically. Have prefered programmatic autolayouting becuase it's less prone to conflicts, easy to reuse and share. Also saves development time as it does not hangs system.

---

  * ViewController.swift
This is the initial view controller. It is very lightweight and I am assigning my customview in load view.

---

I  * t have two targets - one development and other production. Based on configuration in folders "ProductionConfiguration" & "DevelopmentConfiguration".

---

  * Root.swift, Photo.swift and Photos.swift are the models and these are conforming to codable protocol

---

  * ViewModelFlicker.swift
This is where the business logic of th eapp resides.This is most important part od MVVM.

---
8. 12 Factors Apps

It have two targets - one development and other production. Based on configuration in folders "ProductionConfiguration" & "DevelopmentConfiguration".

---

9. Unit Testing

  * FlickerSearchTests: There are test files in test folder. As name claimed, each file responsible for different test cases.

  * APIHandlerTests.swift: include test for API request used in application

  * UISearchBarDelegateHandlerMock.swift: Mock a class that conform to Protocol, used for testing search bar tdid end editing.

  * SearchBarTests.swift: include test for UISearchBar and delegation.

  * InitializationTests.swift: Test basic initialization of some of the classes.

  * TestSingleton.swift: include test for singleton class


10. UI FlickerSearchUITests

  * FlickerSearchUITests.swift: inclused test case for UISearch bar search text entry and result
