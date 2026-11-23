# Task Week 8 — Login + Home Profil Firebase

Halaman login + home page yang nampilin profil, terintegrasi Firebase.
Project Firebase: MyProjectFirebase (`myprojectfirebase-11020`).

## Yang sudah jadi

| File | Isi |
| --- | --- |
| `lib/main.dart` | `main()` init Firebase dulu sebelum `runApp`, route `/` login, `/home` home. |
| `lib/firebase_options.dart` | Config Android project `myprojectfirebase-11020` (web belum didaftarkan, `web` throw `UnsupportedError`). |
| `lib/screens/login_page.dart` | Form email + password, validator, tombol LOGIN, `signInWithEmailAndPassword`, dialog sukses berisi UID + Email, habis login pindah ke `/home`. Habis login, dokumen profil di Firestore dibuat kalau belum ada. |
| `lib/screens/home_page.dart` | Home profil: nama + role dibaca dari Firestore (`users/<uid>`), email + UID dari Firebase Auth, tombol Edit Profil (nyimpan nama ke Firestore) + Logout. |
| `test/login_page_test.dart` | Tes widget: form tampil, validasi kosong, email tidak valid, password kurang dari 6 karakter. |

## Cara jalanin

### 1. Install Firebase (sekali saja)

```bash
npm install -g firebase-tools
firebase login
firebase projects:list
```

### 2. Android — taruh google-services.json

Di Firebase Console, Project Settings > Your apps > Android, download
`google-services.json`, taruh di `android/app/google-services.json`.
Package name Android di project ini: `com.example.flutter_notes`.

Alternatif (menimpa `lib/firebase_options.dart` dengan appId Android
yang benar):

```bash
dart pub global activate flutterfire_cli
flutterfire configure --project=myprojectfirebase-11020
```

Pilih android saja (web belum didaftarkan di project ini).

Pastikan di Console: Authentication > Sign-in method > Email/Password ON,
dan Firestore Database sudah dibuat (mode production, rules sesuaikan
kebutuhan).

### 3. Ambil package + jalanin

```bash
flutter pub get
flutter run
```

Web belum bisa jalan: `firebase_options.dart` belum punya config web
(`web` throw `UnsupportedError`). Tambah Web app dulu di Firebase
Console, baru jalankan `flutterfire configure` lagi.
Android butuh langkah 2 dulu, kalau tidak halaman awal akan menampilkan
error init Firebase.

## Uji koneksi pakai Postman (REST API)

Register:

```http
POST https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=API_KEY
Content-Type: application/json

{"email": "user@example.com", "password": "password123", "returnSecureToken": true}
```

Login: endpoint yang sama, ganti ke `accounts:signInWithPassword`.
Response sukses berisi `idToken`, `refreshToken`, `localId`, `expiresIn`.

## Alur

Buat project di Console → tambah app Android/Web → download config
(`google-services.json` / `firebase_options.dart`) → tambah SDK
(`firebase_core`, `firebase_auth`, `cloud_firestore`) →
`Firebase.initializeApp()` → aktifin Auth + Firestore → app jalan →
user login → Firebase validasi → home baca profil dari Firestore.

## Rencana commit (3 hari, jangan sekaligus)

| Hari | Isi commit |
| --- | --- |
| Hari 1 | Setup Firebase: project Console, `firebase_options.dart`, `google-services.json`, tambah package Firebase, `main.dart` init |
| Hari 2 | Halaman login (`screens/login_page.dart`) + halaman home profil dari Firestore (`screens/home_page.dart`) + tes widget login |
| Hari 3 | README |
