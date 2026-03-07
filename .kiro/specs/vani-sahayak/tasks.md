# Implementation Plan: Vani-Sahayak

## Overview

This implementation plan breaks down the Vani-Sahayak mobile application into discrete, incremental coding tasks. The approach follows a bottom-up strategy: establishing core infrastructure first, then building individual modules, and finally integrating them into complete user flows. Each task builds on previous work, ensuring no orphaned code.

## Tasks

- [x] 1. Project setup and core infrastructure
  - Create Flutter project with Material 3 configuration
  - Set up Riverpod for state management
  - Configure Firebase (Auth, Firestore, Storage)
  - Define Indian Flag color theme constants
  - Set up project structure (lib/models, lib/services, lib/providers, lib/screens, lib/widgets)
  - Configure dependencies (firebase_core, firebase_auth, cloud_firestore, firebase_storage, riverpod, camera, http, hive)
  - _Requirements: 7.1, 7.2, 7.3, 7.4, 7.5, 8.1_

- [ ] 2. Implement data models and serialization
  - [x] 2.1 Create core data model classes
    - Implement FormStructure, FormField, FieldType enum
    - Implement Session, SessionStatus enum
    - Implement User, Language models
    - Implement AudioData, ImageData models
    - Add JSON serialization/deserialization for all models
    - _Requirements: 1.3, 3.3, 4.3_
  
  - [x] 2.2 Write property test for data model serialization
    - **Property: Serialization Round-Trip**
    - **Validates: Requirements 1.3, 3.4**
    - Test that for any model instance, serializing to JSON then deserializing produces an equivalent object

- [ ] 3. Implement authentication module
  - [x] 3.1 Create AuthService with Firebase Auth integration
    - Implement signInWithGoogle() method
    - Implement signInWithPhone() method
    - Implement signOut() method
    - Implement authStateChanges stream
    - Implement currentUser getter
    - _Requirements: 1.1, 1.2_
  
  - [x] 3.2 Create AuthStateProvider using Riverpod
    - Define StreamProvider for auth state
    - Handle auth state changes
    - _Requirements: 1.2, 8.2_
  
  - [x] 3.3 Create LoginScreen UI
    - Design Material 3 UI with Indian Flag theme
    - Add Google sign-in button (Green color)
    - Add phone authentication option
    - Handle authentication callbacks
    - _Requirements: 1.1, 7.1, 7.2, 7.3, 7.4, 7.5_
  
  - [-] 3.4 Write property test for authentication session creation
    - **Property 2: Authentication Creates Session**
    - **Validates: Requirements 1.2**
    - Test that for any successful authentication, a session record is created in Firebase
  
  - [ ] 3.5 Write unit tests for AuthService
    - Test Google sign-in flow
    - Test phone authentication flow
    - Test sign-out behavior
    - _Requirements: 1.1, 1.2_

- [ ] 4. Implement session management module
  - [ ] 4.1 Create SessionService with Firestore integration
    - Implement createSession() method
    - Implement updateSession() method
    - Implement getSession() method
    - Implement getUserSessions() method
    - Implement deleteSession() method
    - _Requirements: 1.3, 1.4, 1.5, 10.1, 10.4_
  
  - [ ] 4.2 Create SessionProvider using Riverpod
    - Define StateNotifierProvider for current session
    - Handle session state updates
    - Implement session persistence to Firestore
    - _Requirements: 1.3, 1.4, 8.2, 8.3_
  
  - [ ] 4.3 Implement local storage with Hive
    - Set up Hive boxes (auth_box, session_box, settings_box, queue_box)
    - Implement save/restore methods for session state
    - _Requirements: 1.4, 1.5, 8.4, 8.5_
  
  - [ ] 4.4 Write property test for session state persistence
    - **Property 1: Session State Round-Trip Persistence**
    - **Validates: Requirements 1.4, 1.5, 8.4, 8.5**
    - Test that for any session state, saving then restoring produces equivalent state
  
  - [ ] 4.5 Write property test for session creation
    - **Property 3: Form Scanning Creates Session Record**
    - **Validates: Requirements 1.3**
    - Test that for any scanned form, a session record is created in Firestore

- [ ] 5. Checkpoint - Ensure authentication and session management work
  - Ensure all tests pass, ask the user if questions arise.

- [ ] 6. Implement Bhashini API integration for voice interface
  - [ ] 6.1 Create BhashiniService API client
    - Implement speechToText() method with API integration
    - Implement textToSpeech() method with API integration
    - Implement getSupportedLanguages() method
    - Add authentication header handling
    - Add error handling and retry logic with exponential backoff
    - _Requirements: 2.2, 2.3, 9.2_
  
  - [ ] 6.2 Create VoiceController for audio recording and playback
    - Implement audio recording using microphone
    - Implement audio playback for TTS responses
    - Handle audio permissions
    - _Requirements: 2.3, 2.2_
  
  - [ ] 6.3 Create LanguageProvider using Riverpod
    - Define StateProvider for selected language
    - Implement language persistence to local storage
    - _Requirements: 2.1, 2.5_
  
  - [ ] 6.4 Write property test for voice interface language consistency
    - **Property 4: Voice Interface Language Consistency**
    - **Validates: Requirements 2.2, 2.3**
    - Test that for any selected language, all voice operations use that language
  
  - [ ] 6.5 Write property test for speech recognition error handling
    - **Property 5: Speech Recognition Error Handling**
    - **Validates: Requirements 2.4**
    - Test that for any failed ASR result, the system requests a repeat
  
  - [ ] 6.6 Write property test for language switching
    - **Property 6: Language Switching Continuity**
    - **Validates: Requirements 2.5**
    - Test that for any language change, the session continues without data loss
  
  - [ ] 6.7 Write unit tests for BhashiniService
    - Test TTS with sample text in multiple languages
    - Test ASR with sample audio files
    - Test error handling for API failures
    - _Requirements: 2.2, 2.3, 2.4_

- [ ] 7. Implement form scanner module with Gemini Vision
  - [ ] 7.1 Create CameraService for image capture
    - Implement camera initialization
    - Implement image capture with quality settings
    - Handle camera permissions
    - _Requirements: 3.1_
  
  - [ ] 7.2 Create GeminiVisionService API client
    - Implement analyzeForm() method with Gemini 2.0 Flash Vision API
    - Add image encoding and transmission
    - Add authentication header handling
    - Implement rate limit handling
    - _Requirements: 3.2, 9.1_
  
  - [ ] 7.3 Create FormParser to convert Gemini responses
    - Parse Gemini JSON response to FormStructure
    - Extract field labels, types, coordinates, and required status
    - Validate extracted data completeness
    - _Requirements: 3.3_
  
  - [ ] 7.4 Create ScanScreen UI
    - Design camera view with guidance overlay
    - Add capture button (Green color)
    - Add loading indicator for processing
    - Handle image quality validation
    - _Requirements: 3.1, 3.5, 7.6, 7.7_
  
  - [ ] 7.5 Write property test for form image transmission
    - **Property 7: Form Image Transmission**
    - **Validates: Requirements 3.2**
    - Test that for any captured image, it is sent to Gemini API
  
  - [ ] 7.6 Write property test for field extraction completeness
    - **Property 8: Field Extraction Completeness**
    - **Validates: Requirements 3.3**
    - Test that for any Gemini response, all required field data is extracted
  
  - [ ] 7.7 Write property test for multi-page form merging
    - **Property 9: Multi-Page Form Merging**
    - **Validates: Requirements 3.6**
    - Test that for any multi-page form, fields are merged without duplicates
  
  - [ ] 7.8 Write property test for form data persistence
    - **Property 10: Form Data Persistence**
    - **Validates: Requirements 3.4, 4.5**
    - Test that for any extracted form data, it is stored in Firestore
  
  - [ ] 7.9 Write unit tests for form scanner
    - Test camera initialization
    - Test image capture and encoding
    - Test Gemini API integration with sample forms
    - _Requirements: 3.1, 3.2, 3.3_

- [ ] 8. Checkpoint - Ensure form scanning works end-to-end
  - Ensure all tests pass, ask the user if questions arise.

- [ ] 9. Implement conversation engine with Gemini
  - [ ] 9.1 Create GeminiConversationService API client
    - Implement generateQuestion() method with Gemini 2.0 Flash API
    - Implement validateResponse() method
    - Add context management for conversation history
    - Add authentication and rate limit handling
    - _Requirements: 4.1, 4.3, 9.1_
  
  - [ ] 9.2 Create ValidationService for field validation
    - Implement date validation logic
    - Implement numeric validation logic
    - Implement required field validation logic
    - Implement field-type-specific validation
    - _Requirements: 5.1, 5.2, 5.3_
  
  - [ ] 9.3 Create ConversationController using Riverpod
    - Define StateNotifierProvider for conversation state
    - Implement question generation flow
    - Implement response processing flow
    - Implement field navigation (next/previous)
    - Implement field editing capability
    - _Requirements: 4.1, 4.2, 4.3, 4.4, 4.5, 4.7_
  
  - [ ] 9.4 Create ConversationScreen UI
    - Design voice interaction UI with waveform animation
    - Add VoiceButton widget with listening/processing states
    - Display current question text
    - Show filled data summary
    - Add edit buttons for previous fields
    - _Requirements: 4.2, 7.6, 7.7_
  
  - [ ] 9.5 Write property test for question generation completeness
    - **Property 11: Question Generation Completeness**
    - **Validates: Requirements 4.1**
    - Test that for any form fields, questions are generated for all required fields
  
  - [ ] 9.6 Write property test for question vocalization
    - **Property 12: Question Vocalization**
    - **Validates: Requirements 4.2**
    - Test that for any question, it is spoken in the user's language
  
  - [ ] 9.7 Write property test for response validation
    - **Property 13: Response Validation by Field Type**
    - **Validates: Requirements 4.3, 5.1, 5.2, 5.3**
    - Test that for any response and field type, validation occurs correctly
  
  - [ ] 9.8 Write property test for invalid response clarification
    - **Property 14: Invalid Response Clarification**
    - **Validates: Requirements 4.4, 5.4**
    - Test that for any invalid response, a clarifying question is asked
  
  - [ ] 9.9 Write property test for field editing
    - **Property 15: Field Edit Capability**
    - **Validates: Requirements 4.7**
    - Test that for any field edit request, the value is updated in Firestore
  
  - [ ] 9.10 Write property test for required field validation
    - **Property 16: Required Field Non-Empty Validation**
    - **Validates: Requirements 5.3**
    - Test that for any required field, empty inputs are rejected
  
  - [ ] 9.11 Write unit tests for conversation engine
    - Test question generation for different field types
    - Test response validation for various inputs
    - Test conversation flow state transitions
    - _Requirements: 4.1, 4.3, 4.4_

- [ ] 10. Implement offline support and sync
  - [ ] 10.1 Create SyncService for background synchronization
    - Implement operation queue for offline actions
    - Implement automatic retry when connection restored
    - Add network connectivity monitoring
    - _Requirements: 5.5_
  
  - [ ] 10.2 Add offline indicators to UI
    - Display offline status in AppBar
    - Show queued operations count
    - Add manual sync button
    - _Requirements: 5.5_
  
  - [ ] 10.3 Write property test for offline operation queueing
    - **Property 17: Offline Operation Queueing**
    - **Validates: Requirements 5.5**
    - Test that for any operation while offline, it is queued and retried when online

- [ ] 11. Checkpoint - Ensure conversation flow works end-to-end
  - Ensure all tests pass, ask the user if questions arise.

- [ ] 12. Implement PDF generation with AWS Lambda
  - [ ] 12.1 Create Python Lambda function for PDF generation
    - Implement lambda_handler() function
    - Add PyMuPDF integration for PDF creation
    - Implement text overlay logic with coordinate mapping
    - Add S3 upload functionality
    - Handle different field types (text, checkbox, date)
    - Add error handling and logging
    - _Requirements: 6.2, 6.3_
  
  - [ ] 12.2 Create LambdaService API client in Flutter
    - Implement generatePDF() method
    - Add request serialization
    - Add response parsing
    - Implement timeout handling
    - Add retry logic for Lambda cold starts
    - _Requirements: 6.1, 6.4, 9.3_
  
  - [ ] 12.3 Create PDFService to coordinate PDF generation
    - Implement PDF generation flow orchestration
    - Handle Firebase Storage URL retrieval
    - Add progress tracking
    - _Requirements: 6.1, 6.3, 6.4_
  
  - [ ] 12.4 Write property test for PDF generation pipeline
    - **Property 18: PDF Generation Pipeline**
    - **Validates: Requirements 6.1, 6.2, 6.3, 6.4**
    - Test that for any confirmed form data, the complete pipeline executes successfully
  
  - [ ] 12.5 Write property test for PDF text overlay accuracy
    - **Property 19: PDF Text Overlay Accuracy**
    - **Validates: Requirements 6.2**
    - Test that for any field data with coordinates, text is overlaid correctly
  
  - [ ] 12.6 Write unit tests for PDF generation
    - Test Lambda invocation
    - Test PDF overlay with sample data
    - Test Firebase Storage upload
    - Test error handling for Lambda timeouts
    - _Requirements: 6.1, 6.2, 6.3_

- [ ] 13. Implement PDF viewing and download
  - [ ] 13.1 Create PDFViewScreen UI
    - Add PDF preview widget
    - Add download button (Green color)
    - Add share button
    - Display file size and metadata
    - _Requirements: 6.5_
  
  - [ ] 13.2 Implement PDF download functionality
    - Add file download to device storage
    - Handle storage permissions
    - Show download progress
    - Notify user on completion
    - _Requirements: 6.6_
  
  - [ ] 13.3 Write property test for PDF download persistence
    - **Property 20: PDF Download Persistence**
    - **Validates: Requirements 6.6**
    - Test that for any PDF download, the file is accessible after app restart

- [ ] 14. Implement form history and management
  - [ ] 14.1 Create HistoryScreen UI
    - Display list of completed forms with thumbnails
    - Show form completion dates
    - Add sort by date (most recent first)
    - Add delete button for each form
    - _Requirements: 10.2, 10.5_
  
  - [ ] 14.2 Implement form history data fetching
    - Query Firestore for user's completed sessions
    - Load form thumbnails from Firebase Storage
    - Implement pagination for large lists
    - _Requirements: 10.2_
  
  - [ ] 14.3 Implement form deletion
    - Delete session data from Firestore
    - Delete PDF from Firebase Storage
    - Update UI after deletion
    - _Requirements: 10.4_
  
  - [ ] 14.4 Write property test for form completion metadata storage
    - **Property 28: Form Completion Metadata Storage**
    - **Validates: Requirements 10.1**
    - Test that for any completed form, metadata is saved to Firestore
  
  - [ ] 14.5 Write property test for historical form access
    - **Property 29: Historical Form Access**
    - **Validates: Requirements 10.3**
    - Test that for any selected historical form, details and PDF are accessible
  
  - [ ] 14.6 Write property test for form deletion completeness
    - **Property 30: Form Deletion Completeness**
    - **Validates: Requirements 10.4**
    - Test that for any deletion, both Firestore data and Storage PDF are removed
  
  - [ ] 14.7 Write property test for form history sorting
    - **Property 31: Form History Sorting**
    - **Validates: Requirements 10.5**
    - Test that for any list of forms, they are sorted by date descending

- [ ] 15. Implement ReviewScreen for form confirmation
  - [ ] 15.1 Create ReviewScreen UI
    - Display all filled fields with values
    - Add edit button for each field
    - Add confirm button (Green color)
    - Show form thumbnail
    - _Requirements: 4.6_
  
  - [ ] 15.2 Implement field editing from review
    - Navigate back to specific field in conversation
    - Update conversation state
    - Return to review after edit
    - _Requirements: 4.7_

- [ ] 16. Implement HomeScreen and navigation
  - [ ] 16.1 Create HomeScreen UI
    - Add language selector widget
    - Add "New Form" button (Green color)
    - Add "History" button
    - Display user profile info
    - Use Saffron AppBar with Navy Blue icons
    - _Requirements: 2.1, 7.1, 7.2, 7.5_
  
  - [ ] 16.2 Implement app navigation with routes
    - Set up named routes for all screens
    - Implement navigation flow: Home → Scan → Conversation → Review → PDF
    - Handle back navigation properly
    - Preserve state during navigation
    - _Requirements: 1.5_

- [ ] 17. Implement shared widgets and UI components
  - [ ] 17.1 Create VoiceButton widget
    - Add listening animation (pulsing effect)
    - Add processing state indicator
    - Use Navy Blue for icon
    - _Requirements: 7.6_
  
  - [ ] 17.2 Create FormFieldCard widget
    - Display field label and value
    - Add edit button
    - Use White background with subtle shadow
    - _Requirements: 7.3_
  
  - [ ] 17.3 Create LanguageSelector widget
    - Display supported languages with native names
    - Highlight selected language
    - Use Green for selection indicator
    - _Requirements: 2.1, 2.5_
  
  - [ ] 17.4 Create LoadingIndicator widget
    - Show progress for AI requests
    - Display status messages
    - Use Indian Flag colors for progress bar
    - _Requirements: 7.7_

- [ ] 18. Implement API error handling and resilience
  - [ ] 18.1 Create ErrorHandler utility class
    - Implement withRetry() method with exponential backoff
    - Implement getUserFriendlyMessage() for error translation
    - Add error logging
    - _Requirements: 9.2, 9.4_
  
  - [ ] 18.2 Add error handling to all API services
    - Wrap all API calls with retry logic
    - Validate all API responses before processing
    - Display user-friendly error messages
    - _Requirements: 9.1, 9.2, 9.3, 9.4, 9.5_
  
  - [ ] 18.3 Write property test for API authentication headers
    - **Property 24: API Authentication Headers**
    - **Validates: Requirements 9.1, 9.2, 9.3**
    - Test that for any API call, authentication headers are included
  
  - [ ] 18.4 Write property test for API retry mechanism
    - **Property 25: API Retry with Exponential Backoff**
    - **Validates: Requirements 9.2**
    - Test that for any failed API request, retries occur with exponential backoff
  
  - [ ] 18.5 Write property test for API response validation
    - **Property 26: API Response Validation**
    - **Validates: Requirements 9.5**
    - Test that for any API response, structure is validated before processing
  
  - [ ] 18.6 Write property test for failed API error display
    - **Property 27: Failed API Error Display**
    - **Validates: Requirements 9.4**
    - Test that for any failed API call, a user-friendly error is displayed

- [ ] 19. Implement state management with Riverpod
  - [ ] 19.1 Wire all providers together
    - Create ProviderScope at app root
    - Set up provider dependencies
    - Implement provider observers for debugging
    - _Requirements: 8.1, 8.2_
  
  - [ ] 19.2 Write property test for state change propagation
    - **Property 22: State Change Propagation**
    - **Validates: Requirements 8.2**
    - Test that for any data change, providers update and widgets re-render
  
  - [ ] 19.3 Write property test for critical data persistence
    - **Property 23: Critical Data Immediate Persistence**
    - **Validates: Requirements 8.3**
    - Test that for any critical data change, it is persisted immediately

- [ ] 20. Implement loading indicators for AI operations
  - [ ] 20.1 Add loading state to all AI service calls
    - Show loading indicator during Gemini API calls
    - Show loading indicator during Bhashini API calls
    - Show loading indicator during Lambda calls
    - _Requirements: 7.7_
  
  - [ ] 20.2 Write property test for loading indicator display
    - **Property 21: Loading Indicator Display**
    - **Validates: Requirements 7.7**
    - Test that for any AI API request, a loading indicator is displayed

- [ ] 21. Final integration and end-to-end testing
  - [ ] 21.1 Test complete user flow
    - Test: Launch app → Authenticate → Scan form → Fill via voice → Generate PDF → Download
    - Verify all components work together
    - Test with multiple languages
    - Test with different form types
    - _Requirements: All_
  
  - [ ] 21.2 Write integration tests
    - Test camera → vision → conversation → PDF pipeline
    - Test offline mode with sync on reconnection
    - Test multi-page form scanning and merging
    - _Requirements: 3.2, 3.6, 4.1, 5.5, 6.1_

- [ ] 22. Final checkpoint - Ensure all tests pass and app is ready
  - Ensure all tests pass, ask the user if questions arise.

## Notes

- Tasks marked with `*` are optional and can be skipped for faster MVP
- Each task references specific requirements for traceability
- Property tests validate universal correctness properties across random inputs
- Unit tests validate specific examples and edge cases
- The implementation follows a bottom-up approach: infrastructure → modules → integration
- All code should follow Flutter best practices and Material 3 design guidelines
- Indian Flag color palette should be consistently applied throughout the UI
