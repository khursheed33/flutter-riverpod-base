import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Demo app gate: widget gallery is shown only after the user taps Login.
///
/// Replace with real auth/session when you wire a backend.
final demoGallerySignedInProvider = StateProvider<bool>((ref) => false, name: 'demoGallerySignedIn');
