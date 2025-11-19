
import 'package:self_capture/l10n/app_localizations.dart';

enum CaptureStage {
  front,
  right45,
  left45,
  vertex,
  donor,
}

extension CaptureStageInfo on CaptureStage {
  String title(AppLocalizations l10n) {
    switch (this) {
      case CaptureStage.front:
        return l10n.captureStageFrontTitle;
      case CaptureStage.right45:
        return l10n.captureStageRight45Title;
      case CaptureStage.left45:
        return l10n.captureStageLeft45Title;
      case CaptureStage.vertex:
        return l10n.captureStageVertexTitle;
      case CaptureStage.donor:
        return l10n.captureStageDonorTitle;
    }
  }

  String baseInstruction(AppLocalizations l10n) {
    switch (this) {
      case CaptureStage.front:
        return l10n.captureStageFrontBaseInstruction;
      case CaptureStage.right45:
        return l10n.captureStageRight45BaseInstruction;
      case CaptureStage.left45:
        return l10n.captureStageLeft45BaseInstruction;
      case CaptureStage.vertex:
        return l10n.captureStageVertexBaseInstruction;
      case CaptureStage.donor:
        return l10n.captureStageDonorBaseInstruction;
    }
  }

  String reminder(AppLocalizations l10n) {
    switch (this) {
      case CaptureStage.front:
        return l10n.captureStageFrontReminder;
      case CaptureStage.right45:
        return l10n.captureStageRight45Reminder;
      case CaptureStage.left45:
        return l10n.captureStageLeft45Reminder;
      case CaptureStage.vertex:
        return l10n.captureStageVertexReminder;
      case CaptureStage.donor:
        return l10n.captureStageDonorReminder;
    }
  }
}



