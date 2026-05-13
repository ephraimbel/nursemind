# NurseMind — Privacy Policy

**Effective Date:** May 13, 2026
**Last Updated:** May 13, 2026

**NurseMind** ("we," "our," or "us") operates the NurseMind iOS application (the "App"). This Privacy Policy explains what data we collect, how we use it, and the choices you have. It applies to your use of the App and any related online services. By using the App, you agree to the practices described here.

NurseMind is designed with a privacy-first architecture: we collect the minimum data needed to operate the Service, we never collect Protected Health Information (PHI) by design, and on-device processing is preferred wherever feasible.

---

## 1. What We Collect

### 1.1 Account Identifiers

When you first launch the App, we create an anonymous internal user record using a randomly generated UUID. This record is associated with you only via your device's Keychain — we do not know your name, email, phone number, or any other identifying information at this stage.

If you choose to **Sign in with Apple**, we additionally receive:

- Your Apple-provided email address, which may be a relay address you control via Apple
- A stable Apple user identifier scoped to our App

This information is used solely to link your data across your devices and is not shared with third parties for marketing.

### 1.2 Profile Information (Optional, Provided by You)

If you choose to fill in your profile, we store:

- Display name (whatever you type — does not need to be your real name)
- Role (Student, RN, LPN, CNA, Other)
- Primary unit (Med-Surg, ICU, ED, OB, Peds, NICU, etc.)
- ICU sub-specialty (when applicable)
- Years of experience
- Notification and appearance preferences

This information is stored on your device and synchronized to our cloud database so it follows you across devices. It is not shared with third parties.

### 1.3 Library Activity

To provide the App's bookmark, pinning, and "recently viewed" features, we sync:

- Identifiers of library entries you pin or bookmark
- Identifiers of calculators you pin or use
- A history of saved AI answers (the question, the answer, the citations) that you have explicitly bookmarked
- Conversation history for your AI sessions

This activity is associated with your anonymous user ID and synced for your access across devices. It is not shared with third parties or used for advertising.

### 1.4 AI Questions

When you submit a question to the Ask NurseMind feature:

- The question is **scrubbed for Protected Health Information (PHI) on your device** before any network transmission. The scrubber removes patterns matching names, dates of birth, medical record numbers, social security numbers, phone numbers, addresses, and other identifying markers.
- The scrubbed question is transmitted to our Anthropic-powered AI processing endpoint over TLS 1.2+ encrypted connections.
- We retain the question text and the AI's response only within the conversation history described in Section 1.3.
- We do not use your questions to train AI models. Per our agreement with Anthropic, your questions are not used to train Anthropic's models.

### 1.5 Subscription Information

If you purchase NurseMind Pro:

- Subscription purchase events are handled by Apple and RevenueCat. We receive a record of your subscription tier (free, Pro Monthly, Pro Yearly) and renewal status.
- We do not receive your full Apple ID, payment method, billing address, or any other purchase details. Apple manages all financial information.

### 1.6 Voice Input

If you use the voice input feature:

- **Audio is transcribed entirely on your device** using Apple's on-device Speech framework.
- Audio is not stored, transmitted, or sent to any server, including ours.
- Only the resulting text transcript is treated as a normal question (Section 1.4), subject to the same PHI scrubbing before transmission.

### 1.7 Diagnostic Data

We collect anonymous crash reports and error diagnostics through Apple's OSLog framework. These logs include:

- The error type and stack trace
- Your anonymous user ID (so we can correlate errors that affect specific users)
- App version and iOS version

We do not collect:

- Your name, email, phone number, or other identifying information in diagnostic logs
- Your IP address (Apple processes diagnostics before they reach us)
- The contents of your questions, library activity, or any other content

You may opt out of diagnostic data collection in iOS Settings → Privacy & Security → Analytics & Improvements.

### 1.8 Flag Reports

If you tap the flag icon on an AI answer to report it as inaccurate, we receive:

- The question and answer text you flagged
- Your optional reason for flagging
- Your anonymous user ID

This data is used solely for internal review and quality improvement of the App's content and AI responses.

## 2. What We Do NOT Collect

We never collect or process:

- **Protected Health Information (PHI)** about any patient. The App is architecturally designed to refuse and scrub PHI before transmission. The PHI scrubber operates on your device, before any network connection is made.
- **Patient identifiers** of any kind — names, dates of birth, medical record numbers, social security numbers, addresses, or other identifying details.
- **Health or fitness data** about you personally (heart rate, steps, etc.).
- **Sensitive personal information** about you beyond what you optionally provide in your profile.
- **Location data** — we do not request or use location services.
- **Contacts** — we do not access your address book.
- **Photos, camera, or media** — the App does not request access to any of these.
- **Voice recordings** — voice transcription is on-device; no audio is transmitted or stored.

## 3. How We Use Your Data

We use the data described in Section 1 to:

- Operate the App and provide its core features
- Synchronize your data across your devices
- Process AI questions and return responses
- Process subscription purchases and grant subscription benefits
- Improve the App through analysis of anonymous diagnostic data
- Review flagged content for accuracy
- Communicate with you about service-related matters (if you have provided an email through Sign in with Apple)

We do **not**:

- Sell your data to anyone
- Share your data with advertisers
- Use your data for advertising or tracking purposes
- Use your AI questions to train AI models
- Build a profile of you for marketing

## 4. Third-Party Services

The App relies on the following third parties. We have data processing agreements with each, and we encourage you to review their privacy policies:

| Service | Purpose | Data Shared |
|---|---|---|
| **Apple Inc.** | App Store, In-App Purchase, Sign in with Apple, Speech Recognition (on-device), Push Notifications | Subscription details (Apple manages payments), Apple ID identifier if you sign in with Apple |
| **Supabase, Inc.** | Authentication, database, serverless backend functions | Anonymous user ID, profile data, library state, AI conversation history, flag reports |
| **Anthropic, PBC** | AI text generation (Claude) | Scrubbed questions, scrubbed conversation context, retrieved library snippets for grounding |
| **RevenueCat, Inc.** | Subscription management and analytics | Anonymous user ID, subscription tier, purchase events |

We do not use marketing or advertising trackers such as Google Analytics, Facebook SDK, or third-party advertising networks.

## 5. Data Security

We protect your data using industry-standard practices:

- All data transmission uses TLS 1.2 or higher
- Your local device data is encrypted at rest by iOS using AES-256 (Data Protection / Keychain)
- Server-side data is encrypted at rest using AES-256 disk encryption (managed by Supabase / AWS)
- Subscription data is encrypted in transit and at rest by RevenueCat
- AI traffic is proxied through an authenticated server-side endpoint so our AI provider's keys never leave our backend

No method of transmission over the internet or method of electronic storage is 100% secure. We cannot guarantee absolute security but we apply commercially reasonable safeguards.

## 6. Data Retention

We retain your data for as long as your account is active and for the period required to provide the Service. Specifically:

- **Profile and library state**: retained until you delete your account
- **AI conversation history and saved answers**: retained until you delete them or delete your account
- **Subscription records**: retained per Apple and RevenueCat retention policies
- **Flag reports**: retained for internal quality review for up to **24 months**, then anonymized or deleted
- **Diagnostic logs**: retained for up to **90 days** for debugging purposes

When you delete your account, we delete all your associated profile data, library state, and conversation history within **30 days**. Backups may persist for an additional **30 days** before being purged. Anonymized aggregate data (e.g., total flag report counts) may be retained indefinitely.

## 7. Your Rights and Choices

### 7.1 Access, Correction, Deletion

You may at any time:

- **Edit your profile** information in the App's Profile tab
- **Delete individual saved answers** in the Library tab
- **Sign out** in the Profile tab, which terminates your session on this device
- **Delete your account and all associated data** by contacting us at the email below

### 7.2 GDPR (For Users in the European Economic Area, UK, and Switzerland)

If you are located in the EEA, UK, or Switzerland, you have additional rights under the General Data Protection Regulation:

- The right to **access** your personal data
- The right to **rectify** inaccurate or incomplete data
- The right to **erase** your data (the "right to be forgotten")
- The right to **restrict processing** of your data
- The right to **data portability**
- The right to **object** to processing based on legitimate interest
- The right to **lodge a complaint** with a supervisory authority

To exercise any of these rights, contact us at the email below.

Our lawful basis for processing personal data is your consent (when you create an account) and our legitimate interest in providing the Service.

### 7.3 CCPA (For Users in California)

Under the California Consumer Privacy Act, you have rights to:

- Know what personal information we collect, use, disclose, and sell
- Delete your personal information
- Opt out of the sale of your personal information (**we do not sell personal information**)
- Non-discrimination for exercising these rights

To exercise these rights, contact us at the email below.

## 8. Children's Privacy

The Service is intended for users **13 years of age or older**. We do not knowingly collect personal information from children under 13. If you believe a child under 13 has provided information to us, please contact us and we will promptly delete it.

The Service is not directed at children and is intended for nursing students and licensed nursing professionals.

## 9. International Users

We are based in the United States. If you access the Service from outside the U.S., you understand that your data will be transferred to and processed in the United States, where data protection laws may differ from those in your jurisdiction. By using the Service, you consent to this transfer.

## 10. Changes to This Policy

We may update this Privacy Policy from time to time. Material changes will be announced through the App or by other reasonable means. The "Last Updated" date at the top of this document reflects the most recent revision. Your continued use of the Service after changes take effect constitutes acceptance of the revised Policy.

## 11. Contact

Privacy-related questions, requests to exercise your rights, or complaints can be directed to:

**NurseMind**
Privacy email: privacy@nursemind.app

For users in the EEA, UK, or Switzerland, you may also lodge a complaint with your local data protection authority.

---

**A note on our architecture**: NurseMind was built to be a clinical reference tool that nurses can trust to never collect patient information. The PHI scrubber runs *on your device*, before any data is transmitted, as a deliberate architectural choice. Voice input is processed *on your device*. Subscription payments are processed by *Apple*, not by us. These decisions are intentional and reflect our commitment to minimizing your privacy exposure even as we provide a useful clinical reference tool.
