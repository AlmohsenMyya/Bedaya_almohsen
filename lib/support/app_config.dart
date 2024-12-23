// basic app configurations
// follow instructions in help document to get configuration for this file
// This is the mobile app configuration file content you can make
// changes to the file as per your requirements
// do not change start -------------------------------------------

const String baseUrl = 'https://bedaya.com.tr/public/';
const String baseApiUrl = '${baseUrl}api/';

// key for form encryption/decryptions
const String publicKey = '''-----BEGIN PUBLIC KEY-----
MFwwDQYJKoZIhvcNAQEBBQADSwAwSAJBAPJwwNa//eaQYxkNsAODohg38azVtalE
h7Lw4wxlBrbDONgYaebgscpjPRloeL0kj4aLI462lcQGVAxhyh8JijsCAwEAAQ==
-----END PUBLIC KEY-----''';

// ------------------------------------------- do not change end

// if you want to enable debug mode set it to true
// for the production make it false
const bool debug = false;
const String version = '1.8.0';
const Map configItems = {
    'debug': debug,
    'appTitle': 'Bedaya',
    // ads will work based on No ads feature settings
    'ads': {
        'enable': false,
        // banner ad on other user's profile page
        'profile_banner_ad': {
            'enable': false,
          // sample test ads
          'android_ad_unit_id': 'ca-app-pub-3940256099942544/6300978111',
          'ios_ad_unit_id': 'ca-app-pub-3940256099942544/2934735716',
          // live
          // 'android_ad_unit_id': '',
          // 'ios_ad_unit_id': '',
        },
        // fullscreen ads that will display to user at certain frequency
        'interstitial_id': {
            'enable': false,
          // sample test ads
           'android_ad_unit_id': 'ca-app-pub-3940256099942544/1033173712',
          'ios_ad_unit_id': 'ca-app-pub-3940256099942544/4411468910',
          // live
          // 'android_ad_unit_id': '',
          // 'ios_ad_unit_id': '',
          'frequency_in_seconds': 300,
        }
      },
    'creditPackages': {
        // as of now in app purchase for iOS is not available and will be available soon.
        'enablePurchase': true,
        'productIds': [
        // credit package uids, you should use it for product ids in Google In App
        '3cf5f6d8_36b7_4d7e_bd5c_7eaf771ba93b'
        '03408e11_189a_4336_b3f7_a62aba82eb3e'
        '1b31f462_9d4e_4f36_a514_1430613b5ed5'


                                ],
    },
    'services': {
        'agora': {
            'appId': '174e8f928daa4755b4c24d375734257b',
        },
        'pusher': {
            'apiKey': '68c04db9318b188b2138',
            'cluster': 'eu',
        },
        'giphy': {
            'enable': false,
            'apiKey': '',
            'features': {
                'showEmojis': true,
                'showStickers': true,
                'showGIFs': true,
            }
        }
    },
    'social_logins': {
        'google': {
            // if enabled you need to configure as suggested in help guide
            'enable': false,
            // mostly directly useful for iOS
            'client_id':''
          },
        'facebook': {
          // if enabled you need to configure it for android and ios as suggested in help guide
          'enable': false,
        }
    }
};
