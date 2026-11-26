import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_tepe_tirmanisi/oyun_tepe_tirmanisi.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(tepeConfig.title.length, 33);
    expect(tepeConfig.tagline.length, 33);
    for (final s in tepeConfig.tutorial) {
      expect(s.text.length, 33);
    }
  });

  test('bölümler üretilir ve bot tarafından geçilir', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(tepeRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: tepeId, optionalMechanics: tepeRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(tepeRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
