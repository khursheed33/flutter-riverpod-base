import 'package:flutter/material.dart';
import 'package:flutter_riverpod_base/core/design/app_theme_context.dart';
import 'package:flutter_riverpod_base/core/design/app_tokens.dart';
import 'package:flutter_riverpod_base/features/presentation/widgets/app_title.dart';

/// Bottom-sheet picker for a list of items of type [T].
class AppDropdownSheetField<T> extends StatefulWidget {
  const AppDropdownSheetField({
    super.key,
    required this.items,
    required this.selected,
    required this.itemTitle,
    required this.onChanged,
    this.label,
    this.onIndexChanged,
    this.backgroundColor,
  });

  final List<T> items;
  final T? selected;
  final String Function(T item) itemTitle;
  final ValueChanged<T> onChanged;
  final Widget? label;
  final ValueChanged<int>? onIndexChanged;
  final Color? backgroundColor;

  @override
  State<AppDropdownSheetField<T>> createState() => _AppDropdownSheetFieldState<T>();
}

class _AppDropdownSheetFieldState<T> extends State<AppDropdownSheetField<T>> {
  bool _open = false;

  T get _effective =>
      widget.selected ??
      (widget.items.isNotEmpty ? widget.items.first : throw StateError('empty items'));

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    if (widget.items.isEmpty) {
      return const SizedBox.shrink();
    }
    return LayoutBuilder(
      builder: (context, c) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.label != null) widget.label!,
            Material(
              color: widget.backgroundColor ?? cs.surfaceContainerLow,
              borderRadius: BorderRadius.circular(AppRadius.sm),
              child: InkWell(
                borderRadius: BorderRadius.circular(AppRadius.sm),
                onTap: () async {
                  setState(() => _open = true);
                  await showModalBottomSheet<void>(
                    context: context,
                    showDragHandle: true,
                    builder: (ctx) {
                      return SafeArea(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: widget.items.length,
                          itemBuilder: (_, i) {
                            final item = widget.items[i];
                            return ListTile(
                              title: AppTitle(
                                widget.itemTitle(item),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                variant: AppTitleVariant.body,
                                style: ctx.appTextOverrides.dropdownValue,
                              ),
                              onTap: () {
                                widget.onChanged(item);
                                widget.onIndexChanged?.call(i);
                                Navigator.pop(ctx);
                              },
                            );
                          },
                        ),
                      );
                    },
                  );
                  setState(() => _open = false);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppSpace.sm, vertical: AppSpace.sm),
                  child: Row(
                    children: [
                      Expanded(
                        child: AppTitle(
                          widget.itemTitle(_effective),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          variant: AppTitleVariant.body,
                          style: context.appTextOverrides.dropdownValue,
                        ),
                      ),
                      Icon(
                        _open ? Icons.expand_less_rounded : Icons.expand_more_rounded,
                        color: cs.onSurfaceVariant,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
