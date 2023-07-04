'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/NOTICES": "3fa2e92cc344dfea3540e77cd31cc408",
"assets/assets/example.gif": "0e8edbcaef3e22718de6334626ed6d25",
"assets/assets/loading.gif": "9080607321ab98fa3e70dd24b2513a20",
"assets/assets/tecnologias.png": "dd05e2f903f1fd15ea1ac065f3e08b46",
"assets/assets/img/proyectos/curetopia.svg": "7eb45c2061dc9a1ba8579c606fd56b1c",
"assets/assets/img/proyectos/memorama.svg": "4cab9d83418ce148bbd8f67430a71e89",
"assets/assets/img/proyectos/memorama3.svg": "bb842975cfbcf3b4c4f5eba24201c9c6",
"assets/assets/img/proyectos/ecommerce3.svg": "c24df14301b2102bf1d28b8833fcb540",
"assets/assets/img/proyectos/curetopia2.svg": "09fc62dcc6d2c2358f3ca2145a4fd90b",
"assets/assets/img/proyectos/juego_de_mesa3.svg": "d92e533caed57f11fbd1ec614b67a024",
"assets/assets/img/proyectos/juego_de_mesa2.svg": "4e08c94bf9b3f0df9223571391bf9770",
"assets/assets/img/proyectos/evaluacion-docente3.svg": "0c652ee0e7ffd98c02bb3936620d21d8",
"assets/assets/img/proyectos/veterinaria4.svg": "1f0723804f1b5100c325d89edda9b51b",
"assets/assets/img/proyectos/veterinaria3.svg": "d045131c7404c270d4d50ebe21e07bf9",
"assets/assets/img/proyectos/evaluacion-docente.svg": "b03c57887d618ee7eb27092313d3538d",
"assets/assets/img/proyectos/veterinaria.svg": "aa0ac158a629e4fc1639dfd41ff6cdc6",
"assets/assets/img/proyectos/tienda.svg": "d4c266fc9e8719abe9ee62c9b27efa5c",
"assets/assets/img/proyectos/memorama2.svg": "c9860d943c1b8879ce38249f76d98773",
"assets/assets/img/proyectos/ecommerce2.svg": "0f8ecd3f088314c7aeeed03767eb4500",
"assets/assets/img/proyectos/veterinaria2.svg": "49feccc9a3be6510e2608b1c5c87929b",
"assets/assets/img/proyectos/curetopia3.svg": "b3c96cc174c847e0cdb1d3fbb3a368db",
"assets/assets/img/proyectos/ecommerce.svg": "b2ff2059d1422ad94cbcff24c2f3f3ca",
"assets/assets/img/proyectos/juego_de_mesa4.svg": "7f70edcfb3843147eb42587f925e4ee8",
"assets/assets/img/proyectos/ecommerce4.svg": "f82893a18bf5c197d33a3948bf5d3156",
"assets/assets/img/proyectos/evaluacion-docente2.svg": "5a5e0bbfc408dff8fd73fb966badcee7",
"assets/assets/img/proyectos/juego_de_mesa.svg": "493ae1b2da1d2b4c09f8533a5d0a348b",
"assets/assets/img/proyectos/memorama4.svg": "3d93a872554b8425b594b3def1e238f7",
"assets/assets/img/tecnologias/git.svg": "fcaf709f096f99e82de84d95bd214a19",
"assets/assets/img/tecnologias/node-js.svg": "943a50a99d826af3704658f7f78e4c47",
"assets/assets/img/tecnologias/vim.svg": "e95ede11c17afd2ecc035770ab858d2e",
"assets/assets/img/tecnologias/javascript.svg": "dc4d2b87bc19419eba96023d2997173a",
"assets/assets/img/tecnologias/figma.svg": "1e1bb3abe493f6686a57cd1e53bb20aa",
"assets/assets/img/tecnologias/java.svg": "e6b6c57786845400518b1489334b1458",
"assets/assets/img/tecnologias/c%2523.svg": "46bed75b5a02d433778195aa53a026b3",
"assets/assets/img/tecnologias/flutter.svg": "f02fb7e5e7c8a531b3d313c2c7582916",
"assets/assets/img/tecnologias/postman.svg": "02d6460cae95c4832bc5d9da2b620d06",
"assets/assets/img/tecnologias/dart.svg": "d39ef972d1595b7f9922b98ad21dd38f",
"assets/assets/img/tecnologias/visual-studio-code.svg": "951a965ef3b2b33829c23bb772f3dd32",
"assets/assets/img/tecnologias/spring.svg": "1068097fa4b1ee1db097ae44421c3add",
"assets/assets/img/tecnologias/react.svg": "57ef1e149ca014955576bd2d39d32218",
"assets/assets/img/tecnologias/express.svg": "aaa842cd9c4daedae90906c48b96e989",
"assets/assets/img/tecnologias/git-bash.svg": "f3981ff9790ecba82f360a59fa9dee13",
"assets/assets/home.svg": "731d58e69f7d48db034ff5ee1be4a9a9",
"assets/assets/home.png": "e37b79c3ff5d9100cfc8634701df7e24",
"assets/assets/proyectos.png": "7490429c3155b9f3a8558d06b92ece1d",
"assets/assets/acerca_de_mi.png": "0e5db2527cd42d123a346bdd92c33cd8",
"assets/assets/phone.png": "bd3114c53c7a8218d5e72d5b2511713e",
"assets/assets/inicio.png": "4e60417cce94a2a0012ee4d7865de460",
"assets/data/info_proyectos.json": "e21e1fd91277444f740569913d67904d",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"assets/AssetManifest.bin": "7dde427aec3246e43f4595764b836cac",
"assets/AssetManifest.json": "31d9ae350ade32e6658ed10647122105",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "57d849d738900cfd590e9adc7e208250",
"assets/fonts/MaterialIcons-Regular.otf": "d48ae68ef9df81e5583d292120dc195a",
"index.html": "39baadd91886e512296781cdc1066585",
"/": "39baadd91886e512296781cdc1066585",
"main.dart.js": "23a0a727e318dbee58111ae9e3579e3c",
"flutter.js": "6fef97aeca90b426343ba6c5c9dc5d4a",
"canvaskit/canvaskit.js": "76f7d822f42397160c5dfc69cbc9b2de",
"canvaskit/skwasm.worker.js": "19659053a277272607529ef87acf9d8a",
"canvaskit/skwasm.js": "1df4d741f441fa1a4d10530ced463ef8",
"canvaskit/skwasm.wasm": "6711032e17bf49924b2b001cef0d3ea3",
"canvaskit/chromium/canvaskit.js": "8c8392ce4a4364cbb240aa09b5652e05",
"canvaskit/chromium/canvaskit.wasm": "fc18c3010856029414b70cae1afc5cd9",
"canvaskit/canvaskit.wasm": "f48eaf57cada79163ec6dec7929486ea",
"version.json": "29cf846e56754da2a44a26c2e390070d",
"manifest.json": "e3d30ed92c10198dfc09b985782f8d50",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"favicon.png": "5dcef449791fa27946b3d35ad8803796"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
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
        // Claim client to enable caching on first launch
        self.clients.claim();
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
      // Claim client to enable caching on first launch
      self.clients.claim();
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
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
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
