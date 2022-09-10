import 'package:flutter/widgets.dart';

// Insets
const kPaddingS = 8.0;
const kPaddingM = 16.0;
const kPaddingL = 32.0;
const kPaddingXL = 48.0;

// Colors
const kOrange = Color(0xffffa93a);
const kBlue = Color.fromARGB(255, 28, 117, 249);
const kPurple = Color.fromARGB(255, 132, 88, 208);
const kGrey = Color.fromARGB(255, 235, 235, 235);
const kLightBlue = Color(0xffc3d2ff);

// Animations
const kClickAnimDuration = Duration(milliseconds: 150);
const kShortAnimDuration = Duration(milliseconds: 300);
const kDefaultAnimDuration = Duration(milliseconds: 500);
const kLongAnimDuration = Duration(milliseconds: 750);

const kDefaultAnimCurve = Curves.ease;
const kClickAnimCurve = Curves.fastOutSlowIn;

// Auth
const kCredentials = {
  'type': 'service_account',
  'project_id': 'flash-359510',
  'private_key_id': 'fd32ca4de5c5a7334fc62aabef31957632bd1ad6',
  'private_key':
      '-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDJmP1k5V6nn9R+\nupmpwA3tjOv1VCj/vM9htDtBLg1qpdHEQq4gBi8AR7ygWflLClL+4T62tUGgt0ii\nrZ7wj9MBsm8MkScoMat6kYoDsVGvPwilpzIs00exWGlNdsfSAggisVwl1nBvEI4N\nmTT0lqFDhWQ5zKK3XQiu0okNXWE2SE4kjWr/doJ26FsTo7KvKAjlywYaog6gPxcF\nsB8VOSE93VLoiDQOapv4lzNiaaVKcDY7+rR7iDKabnNXaOJTZIyQs6bhcSmt432c\nBUJtcSWeROectyo9BwmIl5EP7OjYsoBUggeM0SWWh30jEIx71PDTUe2fByiDuUjO\nWqyw1H8HAgMBAAECggEAYNRA8VNSMYUNVYlfAS+kAPNs6jrwLlWL7kvZIidyfkUD\nChdU90DBFoteSE6u9KIS1yVtL+jDiuQ92RU3gCg0m14PBKQ7gIzK5mY9OiTTLS9D\ngf1aljks+DuU6IYi1/Xt3mv97JahDlePQ2zRCKHI91t8ll550US4RPAOsAKoDJ+3\nhasIL2mbxaE5oLNeMZbwO1Afnb04JrM1kBthgVFIMEmQ4YRay2wuBoEn7JfiIqeh\n2+kj6rnXw5fOoHpo7hnNgQ0MXXCNkimHmcq970gPfmXEpiqBkwem2vPq8egkREVC\npCJWNOTm7S1GTFZNPhyzujA9TzG5dxuSG21vctXt8QKBgQDwQU7CCSqdWWZcMfwd\nRsTtpeg9zWVlRtzG7pyupxorBfCsr/nSb3SpEUMV5X0A3p+qam/mUhN9aTlzKTPL\nCuFkv051BtskPGmXzjuXec15dsc+DFJzhNCeZ3s9xzbG5strLI5TLTLu1aLhDqOY\nNa3kG0nJznX9TYiT0IjQqpDdhQKBgQDWzyLlcwEhQR7pzV0Y8AwKIuoYIg/eIXw8\n1mngVHbQmaot/r05EsMPInnY5i3LlWxY+hE5MFq2OLV2ZQNbPFLZyUY/H1UETIMr\nu+jNRXhiVqZqLbfyDyxeEDiQEakmxbrZjG5kJJUGgoe01rnxAFeaXcrCNgm9Ad9e\n15mXL/k6GwKBgQDA2ctcWXtJfr95de4HmgztLeVz5nFjkDQbwuEmGKAatNPx6ffA\ngRLFu0N8Sg/DKPBFHNbhrDRU0Kf61rHqY7t04VMbAPva5FtmLXcMKgtTWpKoLb/p\nVk0XOb1lY4mGsy/JwaQlA/0EVZw+xz9uKHiCx5y9TurK/veInzWTOba6+QKBgEYL\nQPvEpmerjmL6nhLVo3diryazZK0wCgzkdZ26rQuUL9PTruv/XC+BNG4vkFtEHBJf\naGJXjBzDHRjAE3oaj4GIiilnFBfUwyjtmxnkPz8Btj4FLmf13qfFbkw8FgYYj7cE\nfbKV4yo+QfYL1pHpZKdnUghGCqLhC28nqmOMNx5lAoGBAIfTRUWzrmXds5cW6htv\nNCQA25VyLfP/Myv3uGd83AeDO6daGGbC5J976RlpngKKyKhwKyV3dddbc5FbInl3\nLtaYpynvsdyOaiaQvdsxndSyFMYESWJYEE956EFQGEVWQMvaROTyhv8/Fww/eJyp\nqop3mCyScINI7YFe6nTbJMPa\n-----END PRIVATE KEY-----\n',
  'client_email': 'flash-user@flash-359510.iam.gserviceaccount.com',
  'client_id': '102085194309125773059',
  'auth_uri': 'https://accounts.google.com/o/oauth2/auth',
  'token_uri': 'https://oauth2.googleapis.com/token',
  'auth_provider_x509_cert_url': 'https://www.googleapis.com/oauth2/v1/certs',
  'client_x509_cert_url':
      'https://www.googleapis.com/robot/v1/metadata/x509/flash-user%40flash-359510.iam.gserviceaccount.com'
};

// Hive
const kStateKey = 'state';

const kProfileBox = 'profile';
