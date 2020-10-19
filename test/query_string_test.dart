import 'package:test/test.dart';

import 'package:query_string/query_string.dart' as qs;

const raw1 = {
  'key1': 11,
  'key2': 'str',
  'key3': false,
  'key4': 0,
  'key5': {'cKey1': true},
  'key6': [0, 1],
  'key7': [
    {'cKey1': 233},
    {'cKey2': false}
  ]
};

const encode1 =
    'key_1=11&key_2=str&key_3=false&key_4=0&key_5.c_key_1=true&key_6=0&key_6=1&key_7.0.c_key_1=233&key_7.1.c_key_2=false';

const decode1 = {
  'key1': ['11'],
  'key2': ['str'],
  'key3': ['false'],
  'key4': ['0'],
  'key5': {
    'cKey1': ['true']
  },
  'key6': ['1'],
  'key7': [
    {
      'cKey1': ['233']
    },
    {
      'cKey2': ['false']
    }
  ]
};

void main() {
  test('encoder', () {
    final encoder = qs.Encoder();
    expect(encoder.encode(raw1), encode1);
  });

  test('decoder', () {
    final decoder = qs.Decoder();
    expect(decoder.decode(encode1), decode1);
  });
}
