import 'package:flutter/material.dart';
import '../widgets/conversation_card.dart';

/// 🚀 TokTok First Launch — just 2 cards, then done
class TokTokLauncher {
  final BuildContext _ctx;

  TokTokLauncher(this._ctx);

  Future<void> run() async {
    // Card 1: Welcome
    await _show(
      'TokTok에 오신 것을 환영합니다.',
      'AI가 먼저 말을 걸어요. ○나 ✕만 누르면 됩니다.\n일주일이면 당신을 완벽히 알게 돼요.',
      '시작', '나중에',
    );

    // Card 2: Mic (only permission needed)
    await _show(
      '마이크만 허용해 주세요.',
      '▲ 버튼으로 음성 명령을 할 수 있어요. 물론 텍스트로도 가능합니다.',
      '허용', '나중에',
    );

    // Done. AI starts talking.
  }

  Future<void> _show(String statement, String back, String pos, String neg) async {
    final completer = Completer<void>();
    showCard(_ctx,
      type: CardType.preference,
      statement: statement, backAnswer: back,
      pos: pos, neg: neg,
      onResult: (_) => completer.complete(),
    );
    return completer.future;
  }
}
