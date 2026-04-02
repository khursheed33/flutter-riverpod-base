import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_base/core/constants/app_text.dart';
import 'package:flutter_riverpod_base/core/design/design.dart';
import 'package:flutter_riverpod_base/features/presentation/home/app_route_paths.dart';
import 'package:flutter_riverpod_base/features/presentation/widgets/app_title.dart';
import 'package:go_router/go_router.dart';

/// Landing showcase for the shared `app_*` design system.
class AppWidgetGalleryScreen extends ConsumerStatefulWidget {
  const AppWidgetGalleryScreen({super.key});

  @override
  ConsumerState<AppWidgetGalleryScreen> createState() => _AppWidgetGalleryScreenState();
}

class _AppWidgetGalleryScreenState extends ConsumerState<AppWidgetGalleryScreen> {
  bool _chip = true;
  DateTime _date = DateTime.now();
  String _drop = 'Alpha';

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(AppSpace.md, AppSpace.md, AppSpace.md, 0),
          sliver: SliverToBoxAdapter(
            child: AppButton(
              label: 'Open manage users (Hive demo)',
              variant: AppButtonVariant.outlined,
              icon: Icons.people_outline,
              onPressed: () => context.go(AppRoutePaths.homeUsers),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(AppSpace.md),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              AppTitle(
                AppText.appName,
                variant: AppTitleVariant.headline,
              ),
              const SizedBox(height: AppSpace.xs),
              AppTitle(
                'Use these building blocks instead of one-off UI.',
                variant: AppTitleVariant.body,
                color: cs.onSurfaceVariant,
              ),
              const SizedBox(height: AppSpace.lg),
              const AppSectionHeader(title: 'Buttons'),
              AppButton(label: 'Filled', onPressed: () {}),
              const SizedBox(height: AppSpace.sm),
              AppButton(label: 'Tonal', onPressed: () {}, variant: AppButtonVariant.tonal),
              const SizedBox(height: AppSpace.sm),
              AppButton(label: 'Outlined', onPressed: () {}, variant: AppButtonVariant.outlined),
              const SizedBox(height: AppSpace.sm),
              AppButton(label: 'Text', onPressed: () {}, variant: AppButtonVariant.text),
              const SizedBox(height: AppSpace.sm),
              AppButton(label: 'Danger', onPressed: () {}, variant: AppButtonVariant.danger),
              const SizedBox(height: AppSpace.sm),
              AppButton(label: 'Loading', onPressed: () {}, isLoading: true),
              const SizedBox(height: AppSpace.sm),
              AppTextIconButton(label: 'Create item', onPressed: () {}),
              const SizedBox(height: AppSpace.lg),
              const AppSectionHeader(title: 'Form'),
              AppTextField(
                label: 'Email',
                hint: 'you@example.com',
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: AppSpace.md),
              AppDatePickerField(
                selectedDate: _date,
                onDateSelected: (d) => setState(() => _date = d),
                label: 'Pick a date',
              ),
              const SizedBox(height: AppSpace.md),
              AppDropdownSheetField<String>(
                items: const ['Alpha', 'Beta', 'Gamma'],
                selected: _drop,
                itemTitle: (s) => s,
                onChanged: (v) => setState(() => _drop = v),
                label: const AppTitle('Dropdown', variant: AppTitleVariant.label),
              ),
              const SizedBox(height: AppSpace.lg),
              const AppSectionHeader(title: 'Feedback'),
              const AppLinearProgressBar(),
              const SizedBox(height: AppSpace.sm),
              const AppLinearProgressBar(value: 0.65),
              const SizedBox(height: AppSpace.md),
              const Center(child: AppSpinner()),
              const SizedBox(height: AppSpace.lg),
              const AppSectionHeader(title: 'Surfaces'),
              AppCard(
                variant: AppCardVariant.filled,
                onTap: () {},
                child: const AppTitle('Tappable card', variant: AppTitleVariant.body),
              ),
              const SizedBox(height: AppSpace.sm),
              AppSurface(
                child: AppKeyValueLine(label: 'Status', value: 'Ready'),
              ),
              const SizedBox(height: AppSpace.sm),
              const AppTitleBanner(title: 'Banner title'),
              const SizedBox(height: AppSpace.lg),
              const AppSectionHeader(title: 'Chips & badges'),
              Wrap(
                spacing: AppSpace.sm,
                runSpacing: AppSpace.sm,
                children: [
                  AppFilterChip(
                    label: 'Filter',
                    selected: _chip,
                    onSelected: (v) => setState(() => _chip = v),
                  ),
                  const AppAssistChip(label: 'Assist', icon: Icons.add),
                  const AppBadge(label: '3'),
                ],
              ),
              const SizedBox(height: AppSpace.lg),
              const AppSectionHeader(title: 'Identity'),
              Row(
                children: const [
                  AppAvatar(initials: 'AB'),
                  SizedBox(width: AppSpace.sm),
                  AppAvatar(initials: 'CD', radius: 28),
                ],
              ),
              const SizedBox(height: AppSpace.lg),
              const AppSectionHeader(title: 'Empty state'),
              AppCard(
                child: AppEmptyState(
                  title: 'Nothing here',
                  message: 'Add your first item to get started.',
                  icon: Icons.inbox_outlined,
                  actionLabel: 'Add',
                  onAction: () {},
                ),
              ),
              const SizedBox(height: AppSpace.lg),
              const AppSectionHeader(title: 'Offline'),
              const AppOfflineRetry(onRetry: null),
              const SizedBox(height: AppSpace.xxl),
            ]),
          ),
        ),
      ],
    );
  }
}
