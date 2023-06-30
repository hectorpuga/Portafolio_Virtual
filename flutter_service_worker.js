'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/NOTICES": "e72acc3e045626005d303bf16064c19d",
"assets/assets/loading.gif": "9080607321ab98fa3e70dd24b2513a20",
"assets/assets/tecnologias.png": "dd05e2f903f1fd15ea1ac065f3e08b46",
"assets/assets/img/proyectos/curetopia.svg": "7eb45c2061dc9a1ba8579c606fd56b1c",
"assets/assets/img/proyectos/memorama.svg": "bb842975cfbcf3b4c4f5eba24201c9c6",
"assets/assets/img/proyectos/evaluacion-docente.svg": "b03c57887d618ee7eb27092313d3538d",
"assets/assets/img/proyectos/veterinaria.svg": "aa0ac158a629e4fc1639dfd41ff6cdc6",
"assets/assets/img/proyectos/tienda.svg": "d4c266fc9e8719abe9ee62c9b27efa5c",
"assets/assets/img/proyectos/ecommerce.svg": "b2ff2059d1422ad94cbcff24c2f3f3ca",
"assets/assets/img/proyectos/juego_de_mesa.svg": "7f70edcfb3843147eb42587f925e4ee8",
"assets/assets/img/tecnologias/javascript.svg": "13b08ec848a7bf314ad5ef542a473899",
"assets/assets/img/tecnologias/nodejs.svg": "a98dd17c72989eda6e744ce66b8a7f73",
"assets/assets/img/tecnologias/java.svg": "f6f4838fd642c09e71f283618f20dea7",
"assets/assets/img/tecnologias/c%2523.svg": "7c7b5c5d64e2cbf159407803c25465dc",
"assets/assets/img/tecnologias/Sin%2520confirmar%2520436526.crdownload": "2cc5afb09a120a6748f0692fe1bedbf6",
"assets/assets/img/tecnologias/flutter.svg": "6ddc8d6c1b5bb7174fb72cd37c3afeac",
"assets/assets/img/tecnologias/postman.svg": "a98b433cc0912850b15dc1b1f3a14ae7",
"assets/assets/img/tecnologias/bash.svg": "dfc6223a3c0cbca0bfda9cced6d0a7ba",
"assets/assets/img/tecnologias/github.svg": "0821ff48e52e57897375ee97e0e529f5",
"assets/assets/img/tecnologias/dart.svg": "1148b0dc0889dd8eeddf1811ee0ec5c2",
"assets/assets/img/tecnologias/visual-studio-code.svg": "4a13687e39cd63aee9038b05f6c36774",
"assets/assets/img/tecnologias/express.svg": "b5609d8ca7ac150be04f4a6d9203b3f8",
"assets/assets/home.svg": "731d58e69f7d48db034ff5ee1be4a9a9",
"assets/assets/home.png": "e37b79c3ff5d9100cfc8634701df7e24",
"assets/assets/proyectos.png": "7490429c3155b9f3a8558d06b92ece1d",
"assets/assets/acerca_de_mi.png": "0e5db2527cd42d123a346bdd92c33cd8",
"assets/assets/inicio.png": "4e60417cce94a2a0012ee4d7865de460",
"assets/data/info_proyectos.json": "353af2d25bf5ec4758e24a10437818fe",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"assets/AssetManifest.bin": "047d9b8e095993e9ba45aca40c9f9017",
"assets/AssetManifest.json": "4863309376fd1442e10381c99b127dce",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "57d849d738900cfd590e9adc7e208250",
"assets/fonts/MaterialIcons-Regular.otf": "d48ae68ef9df81e5583d292120dc195a",
"index.html": "adb96989addb7911d40d7fa34c46c56a",
"/": "adb96989addb7911d40d7fa34c46c56a",
"main.dart.js": "98743b7a9f645f2ab4128881009c5d7c",
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
