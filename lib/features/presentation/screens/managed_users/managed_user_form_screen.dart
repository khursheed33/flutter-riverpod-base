import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_base/core/design/design.dart';
import 'package:flutter_riverpod_base/features/presentation/home/app_route_paths.dart';
import 'package:flutter_riverpod_base/features/presentation/providers/managed_users_notifier.dart';
import 'package:go_router/go_router.dart';

class ManagedUserFormScreen extends ConsumerStatefulWidget {
  const ManagedUserFormScreen({super.key, this.userId});

  final String? userId;

  @override
  ConsumerState<ManagedUserFormScreen> createState() => _ManagedUserFormScreenState();
}

class _ManagedUserFormScreenState extends ConsumerState<ManagedUserFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _name;
  late final TextEditingController _surname;
  late final TextEditingController _email;
  var _seededFromUser = false;

  @override
  void initState() {
    super.initState();
    _name = TextEditingController();
    _surname = TextEditingController();
    _email = TextEditingController();
  }

  @override
  void dispose() {
    _name.dispose();
    _surname.dispose();
    _email.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    final notifier = ref.read(managedUsersNotifierProvider.notifier);
    final id = widget.userId;
    final String? err;
    if (id == null) {
      err = await notifier.create(
        name: _name.text,
        surname: _surname.text,
        email: _email.text,
      );
    } else {
      err = await notifier.saveChanges(
        id: id,
        name: _name.text,
        surname: _surname.text,
        email: _email.text,
      );
    }
    if (!mounted) return;
    if (err != null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(err)));
      return;
    }
    if (id == null) {
      context.go(AppRoutePaths.homeUsers);
    } else {
      ref.invalidate(managedUserDetailProvider(id));
      context.go(AppRoutePaths.homeUser(id));
    }
  }

  @override
  Widget build(BuildContext context) {
    final id = widget.userId;
    if (id != null) {
      final async = ref.watch(managedUserDetailProvider(id));
      return async.when(
        loading: () => const Center(child: AppSpinner()),
        error: (_, __) => Center(
          child: AppButton(label: 'Back', onPressed: () => context.pop()),
        ),
        data: (user) {
          if (user == null) {
            return AppEmptyState(
              title: 'User not found',
              actionLabel: 'Back',
              onAction: () => context.go(AppRoutePaths.homeUsers),
            );
          }
          if (!_seededFromUser) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (!mounted || _seededFromUser) return;
              setState(() {
                _name.text = user.name;
                _surname.text = user.surname;
                _email.text = user.email;
                _seededFromUser = true;
              });
            });
          }
          return _form(context, isEdit: true);
        },
      );
    }
    return _form(context, isEdit: false);
  }

  Widget _form(BuildContext context, {required bool isEdit}) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppSpace.lg),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppTextField(
              controller: _name,
              label: 'First name',
              hint: 'Ada',
              validator: (v) =>
                  (v == null || v.trim().isEmpty) ? 'Required' : null,
            ),
            const SizedBox(height: AppSpace.md),
            AppTextField(
              controller: _surname,
              label: 'Surname',
              hint: 'Lovelace',
              validator: (v) =>
                  (v == null || v.trim().isEmpty) ? 'Required' : null,
            ),
            const SizedBox(height: AppSpace.md),
            AppTextField(
              controller: _email,
              label: 'Email',
              hint: 'ada@example.com',
              keyboardType: TextInputType.emailAddress,
              validator: (v) {
                if (v == null || v.trim().isEmpty) return 'Required';
                if (!v.contains('@')) return 'Enter a valid email';
                return null;
              },
            ),
            const SizedBox(height: AppSpace.lg),
            AppButton(
              label: isEdit ? 'Save changes' : 'Create user',
              onPressed: _submit,
            ),
            const SizedBox(height: AppSpace.sm),
            AppButton(
              label: 'Cancel',
              variant: AppButtonVariant.text,
              onPressed: () {
                if (context.canPop()) {
                  context.pop();
                } else {
                  context.go(AppRoutePaths.homeUsers);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
