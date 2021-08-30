'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "version.json": "34a71560155c28db11247a5856e64eba",
"index.html": "9be5916a7cd4eb4d5831afc459837bf5",
"/": "9be5916a7cd4eb4d5831afc459837bf5",
"main.dart.js": "17d217288fe72c8c61882daed93fc908",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "ea5839b12a475ba2e2a42a3d03fd7c55",
".git/config": "eb2bc993b194cb20da05a4c58c228fd7",
".git/objects/95/b6763e75d23996d9f3b33431d675d4446527c4": "ccafe8494e6468f230ba40c084337685",
".git/objects/35/dbb0938edbd8516d210ddcc579f8d1e116a74d": "7788d46480e83db5f880034e1dd953ba",
".git/objects/ab/0e98497a51ead7821d1da35a24968ff314e50f": "557c35fe3928eb2af403d1b3926bb9ba",
".git/objects/e5/951dfb943474a56e611d9923405cd06c2dd28d": "c6fa51103d8db5478e1a43a661f6c68d",
".git/objects/f2/5787c93ad00665f0f797a43ab397f0628a273e": "59e425d1456034072d902c75d18ec75f",
".git/objects/20/5bb5db271c6d8de8399864c7bb9b917f638893": "c993b22f115d7f3ae6d5b7b212806539",
".git/objects/27/033ce90d2491bc19c00556b1ddbd5539a088aa": "744f88fb373a840a55dd754c727b86a1",
".git/objects/pack/pack-55f6793927da2c18587eb632c4c75b80a97820df.idx": "54442abfdd8b5ab921229167f780d805",
".git/objects/pack/pack-55f6793927da2c18587eb632c4c75b80a97820df.pack": "7649ccf1534e8e24dfd37dba242b735d",
".git/objects/7d/cff41aedd46fb7169ec7f744d36bdc295686a3": "5cda5a60a99242ea6be204043e0416ed",
".git/objects/1a/3bbfd388f1b30859bfd25fb461f98fe1083cf6": "84b67cd5dde0c47ff3d803db9a39cd1b",
".git/objects/8a/aa46ac1ae21512746f852a42ba87e4165dfdd1": "1d8820d345e38b30de033aa4b5a23e7b",
".git/objects/88/cfd48dff1169879ba46840804b412fe02fefd6": "e42aaae6a4cbfbc9f6326f1fa9e3380c",
".git/objects/96/53e34ca91786495e8380758620b38502c3cd86": "44979c927a4dd83a8fa9325fba44b496",
".git/objects/53/0940edffc0b7b0d7a4a55d173994760cd989ea": "81726ce4830eef42081f4feb78db46ea",
".git/objects/01/986758a842052946f68de63b193df8c34978ed": "3807d97fb12df7ebc32ed3cec70d04ed",
".git/objects/0a/f5c1daca9ed662b854b0a83b76f0b3d2f8a272": "8faf73166618fb1bd510c1704e83a256",
".git/objects/d4/bbb1d237305fcd4d82c514c298fed1b46c7bb3": "a2e8596de319ed036a2a2400e1e05203",
".git/objects/ba/d29ee65a14f1b95f38328cc5993240256ae333": "68257a3178834d78d0cc3f22b5df6031",
".git/objects/af/1640e9d72ae65a86cd3e82232ff777d2a35c94": "e28d0d9d7c4bd67de2409cd71d5f98de",
".git/objects/b7/49bfef07473333cf1dd31e9eed89862a5d52aa": "36b4020dca303986cad10924774fb5dc",
".git/objects/a8/3a17d54b6dc2156c855c6580301cefc9c8d017": "6525101be8d70b808a809af9c83fa4ad",
".git/objects/de/8bab52135addce1e19e3c0c40121c8b114339e": "c49a2c8c8f5061820d4a49f8228769f6",
".git/objects/b9/34264254463d1568f3d45d199e011bd3222346": "2c39eda3d1a47e93195ca3b47a543c79",
".git/objects/a1/3837a12450aceaa5c8e807c32e781831d67a8f": "bfe4910ea01eb3d69e9520c3b42a0adf",
".git/objects/e8/23b2519366adfdbdaecca8cc84a53c170459f5": "d445f3cde71b38a56837681608544784",
".git/objects/46/4ab5882a2234c39b1a4dbad5feba0954478155": "2e52a767dc04391de7b4d0beb32e7fc4",
".git/objects/2c/1e9e860d8661f044b8b77eff8daaab81cc0e2e": "446df4d05f378761c4a0e12fe72a3a6c",
".git/objects/79/ba7ea0836b93b3f178067bcd0a0945dbc26b3f": "f3e31aec622d6cf63f619aa3a6023103",
".git/objects/2d/2650bc759999653410b6b57e62f9309c2a47d5": "2b4b99b56ff646f964f6732ab1023d51",
".git/objects/1d/3b585644c330fb516e84b0b1255c67540dfd08": "ea4f65d71b0ec175f5dfcc7191a4d039",
".git/objects/7a/bde781c04191231d3dbb2343a08ab87a912701": "be47b8b02a3d151a322a3544d2b61c7d",
".git/HEAD": "4cf2d64e44205fe628ddd534e1151b58",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "5f0523b2ac7f85428aebab6b14d94ec7",
".git/logs/refs/heads/master": "5f0523b2ac7f85428aebab6b14d94ec7",
".git/logs/refs/remotes/origin/master": "1369227c4954a24c4b91fdb74966d777",
".git/logs/refs/remotes/origin/main": "abae54c8ed7a2a7887503e38fc1011ca",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-commit.sample": "e4db8c12ee125a8a085907b757359ef0",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/fsmonitor-watchman.sample": "ecbb0cb5ffb7d773cd5b2407b210cc3b",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-push.sample": "3c5989301dd4b949dfa1f43738a22819",
".git/hooks/update.sample": "517f14b9239689dff8bda3022ebd9004",
".git/refs/heads/master": "610e8eb4b8ffa373b6009f23071a972d",
".git/refs/remotes/origin/master": "3eaa61c55f02aed34357db82a317976f",
".git/refs/remotes/origin/main": "033ba01750b51f6b66b8cfd0bbd058f2",
".git/index": "752b13bb7413534332fedec16ceae933",
".git/COMMIT_EDITMSG": "e5e1c95f2e820ebdf3129d82e5cb85c6",
".git/FETCH_HEAD": "d41d8cd98f00b204e9800998ecf8427e",
"assets/annoying_alarm.wav": "b48bdbc122e0b8b5f288c8ee79e62927",
"assets/timer_icon.png": "839393b67af386546b78e50566171516",
"assets/AssetManifest.json": "2d07b75c16a55015198bed0026827204",
"assets/ticking.m4a": "5deb90ca44dfa5d121a9177688077041",
"assets/next_participant.wav": "cf81c32b9e6e2dfc77e42f55b431c7be",
"assets/NOTICES": "d20c8549e9c2c8826b3b5194afee054c",
"assets/gong.wav": "987df0124937d5d2b2d3bb72f962f024",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/alarm.wav": "66c4d279e9f6ae33e27b3025bacb0147",
"assets/fonts/MaterialIcons-Regular.otf": "1288c9e28052e028aba623321f7826ac",
"assets/assets/ticking.wav": "4a998715b7a109ce93e24505b2e2d34e",
"assets/assets/timer_icon.png": "839393b67af386546b78e50566171516",
"assets/assets/next_participant.wav": "cf81c32b9e6e2dfc77e42f55b431c7be",
"assets/assets/gong.wav": "987df0124937d5d2b2d3bb72f962f024",
"assets/assets/alarm.wav": "66c4d279e9f6ae33e27b3025bacb0147"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value + '?revision=' + RESOURCES[value], {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
