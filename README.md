# query_string

Encode json to query string or decode query string to json.

## Encode

```dart
import 'package:query_string/query_string.dart' as qs;

const json = {
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
}

const result = 'key_1=11&key_2=str&key_3=false&key_4=0&key_5.c_key_1=true&key_6=0&key_6=1&key_7.0.c_key_1=233&key_7.1.c_key_2=false';

final encoder = qs.Encoder();
final str = encoder.encode(json);  
// str == result
```

## Decode

```dart
import 'package:query_string/query_string.dart' as qs;

const str == 'key_1=11&key_2=str&key_3=false&key_4=0&key_5.c_key_1=true&key_6=0&key_6=1&key_7.0.c_key_1=233&key_7.1.c_key_2=false';

const result = {
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

final decoder = qs.Decoder();
final json = decoder.decode(str);
// json == result 
```
