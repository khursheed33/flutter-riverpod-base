import 'package:flutter/material.dart';
import 'package:flutter_riverpod_base/core/design/app_text_overrides.dart';
import 'package:flutter_riverpod_base/core/design/app_ui_dimensions.dart';

extension AppDesignContext on BuildContext {
  AppUiDimensions get appDim {
    return Theme.of(this).extension<AppUiDimensions>() ?? AppUiDimensions.standard();
  }

  AppTextOverrides get appTextOverrides {
    final o = Theme.of(this).extension<AppTextOverrides>();
    assert(o != null, 'AppTextOverrides missing — use AppTheme.light/dark()');
    return o!;
  }
}
