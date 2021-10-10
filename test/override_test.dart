import 'package:test/test.dart';
import 'package:mockito/mockito.dart';

import 'package:typesense/src/override.dart';

import 'test_utils.mocks.dart';

void main() {
  group('Override', () {
    late Override override;
    late MockApiCall mock;

    setUp(() {
      mock = MockApiCall();
      override = Override(
        'companies',
        'customize-apple',
        mock,
      );
    });

    test('delete() calls ApiCall.delete()', () async {
      when(
        mock.delete(
          '/collections/companies/overrides/customize-apple',
        ),
      ).thenAnswer((realInvocation) => Future.value({"id": "customize-apple"}));
      expect(await override.delete(), equals({"id": "customize-apple"}));
    });
    test('retrieve() calls ApiCall.get()', () async {
      final overrideMap = {
        "id": "customize-apple",
        "company_name": "Stark Industries",
        "num_employees": 5215,
        "country": "USA"
      };

      when(
        mock.get(
          '/collections/companies/overrides/customize-apple',
        ),
      ).thenAnswer((realInvocation) => Future.value(overrideMap));
      expect(await override.retrieve(), equals(overrideMap));
    });
  });
}
