'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "790b42716e40eb8deff91b33530c2e02",
"version.json": "3948edf8dc7f3e371a8437c965c17802",
"index.html": "89d66aad6aeb940d53c9a8d19f62da8a",
"/": "89d66aad6aeb940d53c9a8d19f62da8a",
"main.dart.js": "d4c0fc3b5f16a724dda83a95e7b2c984",
"flutter.js": "4b2350e14c6650ba82871f60906437ea",
"favicon.png": "515be4551b780c6b383d739fe141bb5b",
"icons/Icon-192.png": "07ca56c22a435d757522ed4fa218c7f0",
"icons/Icon-maskable-512.png": "1422d837c38f856fefa4e6619054cf21",
"icons/Icon-512.png": "1422d837c38f856fefa4e6619054cf21",
"icons/Icon-maskable-192.png": "07ca56c22a435d757522ed4fa218c7f0",
"manifest.json": "21f6e4b9c0cd45f965291985b28d1541",
"assets/AssetManifest.bin.json": "b15af1de6ae2326e0fd7fbdd24881b23",
"assets/AssetManifest.json": "3f9491d632965b2bb9e1741b02cc589d",
"assets/png_one.png": "80c002139b59b5e0ec5b51c20510889d",
"assets/NOTICES": "1e65503fb66248eab9d0c56cc1f435c9",
"assets/FontManifest.json": "eea7fad4bee576cfbafea1c0e9896ce8",
"assets/json_gif.gif": "b4916bc83bc6300391243cc7fde9abe7",
"assets/png_one_edit.png": "80c002139b59b5e0ec5b51c20510889d",
"assets/golden_hour.mp3": "d651aa86c5a2abffd3df789e5156e28d",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/packages/map_launcher/assets/icons/mappls.svg": "1a75722e15a1700115955325fe34502b",
"assets/packages/map_launcher/assets/icons/citymapper.svg": "58c49ff6df286e325c21a28ebf783ebe",
"assets/packages/map_launcher/assets/icons/naver.svg": "ef3ef5881d4a2beb187dfc87e23b6133",
"assets/packages/map_launcher/assets/icons/tencent.svg": "4e1babec6bbab0159bdc204932193a89",
"assets/packages/map_launcher/assets/icons/yandexNavi.svg": "bad6bf6aebd1e0d711f3c7ed9497e9a3",
"assets/packages/map_launcher/assets/icons/yandexMaps.svg": "3dfd1d365352408e86c9c57fef238eed",
"assets/packages/map_launcher/assets/icons/copilot.svg": "b412a5f02e8cef01cdb684b03834cc03",
"assets/packages/map_launcher/assets/icons/truckmeister.svg": "416d2d7d2be53cd772bc59b910082a5b",
"assets/packages/map_launcher/assets/icons/googleGo.svg": "cb318c1fc31719ceda4073d8ca38fc1e",
"assets/packages/map_launcher/assets/icons/mapyCz.svg": "f5a198b01f222b1201e826495661008c",
"assets/packages/map_launcher/assets/icons/tmap.svg": "50c98b143eb16f802a756294ed04b200",
"assets/packages/map_launcher/assets/icons/petal.svg": "76c9cfa1bfefb298416cfef6a13a70c5",
"assets/packages/map_launcher/assets/icons/here.svg": "aea2492cde15953de7bb2ab1487fd4c7",
"assets/packages/map_launcher/assets/icons/tomtomgofleet.svg": "5b12dcb09ec0a67934e6586da67a0149",
"assets/packages/map_launcher/assets/icons/mapswithme.svg": "87df7956e58cae949e88a0c744ca49e8",
"assets/packages/map_launcher/assets/icons/osmandplus.svg": "31c36b1f20dc45a88c283e928583736f",
"assets/packages/map_launcher/assets/icons/doubleGis.svg": "ab8f52395c01fcd87ed3e2ed9660966e",
"assets/packages/map_launcher/assets/icons/google.svg": "cb318c1fc31719ceda4073d8ca38fc1e",
"assets/packages/map_launcher/assets/icons/kakao.svg": "1c7c75914d64033825ffc0ff2bdbbb58",
"assets/packages/map_launcher/assets/icons/osmand.svg": "639b2304776a6794ec682a926dbcbc4c",
"assets/packages/map_launcher/assets/icons/tomtomgo.svg": "493b0844a3218a19b1c80c92c060bba7",
"assets/packages/map_launcher/assets/icons/flitsmeister.svg": "44ba265e6077dd5bf98668dc2b8baec1",
"assets/packages/map_launcher/assets/icons/baidu.svg": "22335d62432f9d5aac833bcccfa5cfe8",
"assets/packages/map_launcher/assets/icons/apple.svg": "6fe49a5ae50a4c603897f6f54dec16a8",
"assets/packages/map_launcher/assets/icons/sygicTruck.svg": "242728853b652fa765de8fba7ecd250f",
"assets/packages/map_launcher/assets/icons/waze.svg": "311a17de2a40c8fa1dd9022d4e12982c",
"assets/packages/map_launcher/assets/icons/amap.svg": "00409535b144c70322cd4600de82657c",
"assets/packages/fluttertoast/assets/toastify.js": "56e2c9cedd97f10e7e5f1cebd85d53e3",
"assets/packages/fluttertoast/assets/toastify.css": "a85675050054f179444bc5ad70ffc635",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "43b82a42e8a87bb1554ac0b3d2679c45",
"assets/fonts/MaterialIcons-Regular.otf": "ec5dc7f6a559cf1e125753bc8caccb4c",
"assets/assets/svg/svg_arrow_down.svg": "bbea461fe1c803c1a80eb74cbe39f3a0",
"assets/assets/svg/svg_flower.svg": "e406c5988084227a3733c3e4a1ef9074",
"assets/assets/svg/svg_face.svg": "1ef28e72af841f6644545b4a664fac21",
"assets/assets/svg/svg_new_logo.svg": "40db6ebefa5ddca91e823b65f81873e8",
"assets/assets/svg/svg_zalo.svg": "20228c702d9d3d578dbc97d72f952740",
"assets/assets/svg/svg_menu.svg": "ee8e01956826bef1e9cffcec74926ca5",
"assets/assets/svg/svg_logo.svg": "ca0a77fdfc626358e0551b1a3b3c4002",
"assets/assets/svg/svg_phone.svg": "df7b87e722313ec27ab0d07a74b93e1f",
"assets/assets/png/png_anhthinh.png": "c022cb49393023023fdacd33a2d59ffd",
"assets/assets/png/png_new_logo.png": "eca96deb6b00fb4534803ab067e35d17",
"assets/assets/png/png_address1.jpg": "7804a8f57b26af00ceb9ef93bd6844dc",
"assets/assets/png/png_address3.png": "9e25cf43faed1933f96b2c225649939d",
"assets/assets/png/png_chinha.png": "9787f0627e165cb98257c3a4913e709e",
"assets/assets/png/png_address2.png": "f192180057e01d0519235097304a93ca",
"assets/assets/png/png_one.png": "80c002139b59b5e0ec5b51c20510889d",
"assets/assets/png/png_en.png": "cd3556adc6fad703c1c8b994cf3cafd8",
"assets/assets/png/pmg_address2_mobile.png": "4ee4f2ab12b18cb05e4f7b95f57a8aae",
"assets/assets/png/png_address1_mobile.jpg": "a59bbdc5aa2e15313d0a2766f292b084",
"assets/assets/png/png_flower.png": "99aee47ae4847812c53fad9f52ee9f1c",
"assets/assets/png/png_test.png": "c09360d0fd7bfb7e968f49e644114921",
"assets/assets/png/png_mobile.png": "0d35ca48e00196499640f00b5b618785",
"assets/assets/png/png_range.png": "149b327bdb4acf556c14bf76b6201ff6",
"assets/assets/png/png_vn.png": "9b094dae21f19325ed358c12a1d670e0",
"assets/assets/png/png_waring.png": "16146fd0e7abcacf4856880a887c7341",
"assets/assets/png/png_success.png": "4e05c29de71e66183c171b49bf2b049c",
"assets/assets/png/png_one_mobile.png": "0a3f496c2eb0d1be0b89e1e89a966bb0",
"assets/assets/png/png_coanfirm.png": "b8e7e97c260b40eea6d51ee8ecbcd8e7",
"assets/assets/png/png_confirm.png": "198e0c93d2c1aab63005c83269d2a2a1",
"assets/assets/png/png_zalo.png": "cffb7cdfa87288e7f4c1e1b55f3b4776",
"assets/assets/json/json_menu_white.json": "686bae17101ed96dbf7f10e83188a7a9",
"assets/assets/json/json_volume.json": "f91162cf829672a6acde6e6286c90880",
"assets/assets/json/You%2520X%2520Ventures%2520Wedding%2520Website.png": "0d35ca48e00196499640f00b5b618785",
"assets/assets/json/json_gif.gif": "b4916bc83bc6300391243cc7fde9abe7",
"assets/assets/json/json_loading_dot.json": "f713b6b29e83f9fe8aa470ead6ff0fef",
"assets/assets/json/json_menu.json": "5140d2258e43915d4a09adb070a487f4",
"assets/assets/mp3/golden_hour.mp3": "d651aa86c5a2abffd3df789e5156e28d",
"assets/assets/fonts/NotoColorEmoji-Regular.ttf": "c358f057ef2a35624d091fb9562e8e7e",
"canvaskit/skwasm.js": "ac0f73826b925320a1e9b0d3fd7da61c",
"canvaskit/skwasm.js.symbols": "96263e00e3c9bd9cd878ead867c04f3c",
"canvaskit/canvaskit.js.symbols": "efc2cd87d1ff6c586b7d4c7083063a40",
"canvaskit/skwasm.wasm": "828c26a0b1cc8eb1adacbdd0c5e8bcfa",
"canvaskit/chromium/canvaskit.js.symbols": "e115ddcfad5f5b98a90e389433606502",
"canvaskit/chromium/canvaskit.js": "b7ba6d908089f706772b2007c37e6da4",
"canvaskit/chromium/canvaskit.wasm": "ea5ab288728f7200f398f60089048b48",
"canvaskit/canvaskit.js": "26eef3024dbc64886b7f48e1b6fb05cf",
"canvaskit/canvaskit.wasm": "e7602c687313cfac5f495c5eac2fb324",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
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
