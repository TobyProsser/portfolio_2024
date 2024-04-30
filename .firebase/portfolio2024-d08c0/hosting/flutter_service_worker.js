'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "03c2761e22b26ec7950657b6bed9b3b4",
"assets/AssetManifest.bin.json": "994ec430fecf8c6ee7077232f0779201",
"assets/AssetManifest.json": "fafc2bc1230bdf906706be2b0fd56b49",
"assets/assets/images/ArcMastermindText1.png": "016b9873c18597a1bd4e6d5d81a76a1a",
"assets/assets/images/blueprints1.png": "76015b547c88fce4322f04c2f1378345",
"assets/assets/images/blueprints2.png": "4cf42ca41bdf55aea6f98cbbdcd47f31",
"assets/assets/images/BSIDev/BSIDEV1.png": "8fc345671afe90e7ac3a1f38886dd383",
"assets/assets/images/BSIDev/BSIDEV2.png": "ab5680cebfc38ba2a6f7c85a4752c8c2",
"assets/assets/images/BSIInfo/Slide1.jpg": "cee47b5b6bdc12bcd04067742e373776",
"assets/assets/images/BSIInfo/Slide2.jpg": "f442447963a28c13dfef0e7819713ab8",
"assets/assets/images/BSIInfo/Slide3.PNG": "9923d53fb8b915c8150be3f70686137b",
"assets/assets/images/BSIInfo/Slide4.PNG": "27b44e25bb45416fef1882c93969737d",
"assets/assets/images/BSIInfo/Slide5.PNG": "32944685f2b1e5dc89a9876a31b81475",
"assets/assets/images/EyeDrawing.jpg": "fc4710ab583d961961c2cd80857eb86e",
"assets/assets/images/GamesGallery1.png": "6f30070d9bd006b89b70fe3a439d2480",
"assets/assets/images/GamesGallery2.png": "635456ceba1ddd7644563ae298c960d6",
"assets/assets/images/Hanger18/dropDown.PNG": "a65f846e02a22357813f381e131ec09a",
"assets/assets/images/Hanger18/Hanger18Letter.png": "ee2f68adcaf964815e39c8f4357b27a2",
"assets/assets/images/Hanger18/homeScreen.PNG": "6ec129fbd8f197fc5eb945986f1ea399",
"assets/assets/images/Hanger18/login.PNG": "7bde1f6854caa58b647f94a97b1896d2",
"assets/assets/images/Hanger18/register.PNG": "d4dd2ab19da083de4309fb549cdd7070",
"assets/assets/images/PortfolioDev/RiveSS1.JPG": "5040daf4f20ffd886ab98310f1e28aca",
"assets/assets/images/PortfolioDev/RiveSS2.JPG": "939be82a5cab9e7ec7cfcc395506c42e",
"assets/assets/images/ResumePic1.png": "43d1c6a71bf43fa10737753a1b6f205c",
"assets/assets/images/ResumePic2.png": "9887cf6010b9248bf2db3abfeabb0a24",
"assets/assets/images/ReviewBookDesign.png": "7ecbefc1d26592167ae8356886b030a6",
"assets/assets/images/RubixText1.png": "8f18b03bc774e788e03177d615666f97",
"assets/assets/images/RubixText2.png": "be0e7e1ecf9d1c87015f8e313fe23d8e",
"assets/assets/images/ShellDrawing.jpeg": "c3ab835122c966e4ac181fb0cfceca30",
"assets/assets/images/SquareCardPattern.png": "22c36205a8d2df7a1b8faf0a844052d0",
"assets/assets/images/Stars.png": "24b0be93f75a874c858f417b526a43c9",
"assets/assets/images/Tiles1.png": "4b77fc876735ad36a01dcec9bfd70d19",
"assets/assets/images/Tiles2.png": "47e64b494dda094eb2310640c00fbec8",
"assets/assets/images/videoCovers/ArcMastermind.png": "72ece70ba09f888ac36f7ce2dc6a70a1",
"assets/assets/images/videoCovers/BallDropModel.png": "7a22f040faf378baeada70ed1cb1d4fb",
"assets/assets/images/videoCovers/BSIDashboard.png": "14a7bc5d5a11fcfe20f2e709759392df",
"assets/assets/images/videoCovers/BSIResponsive.png": "6602b9ef6124712d9b72034be584412d",
"assets/assets/images/videoCovers/LofiIslandsCover.png": "54519126e3342080090c6056a720041b",
"assets/assets/images/videoCovers/PlanetWalker.png": "fbcf903290787dddc57a3ed3537dcd21",
"assets/assets/images/videoCovers/RobotWalking.png": "df5228a294d426bf12e191f3cab2abbb",
"assets/assets/images/videoCovers/RubixSurvival.png": "c4a27fd4c2c62e2dddc2368305cffebd",
"assets/assets/images/videoCovers/SliceyJump.png": "1326b3aa9a2b2fd2d7705d33503426a6",
"assets/assets/images/videoCovers/SpeedTour.png": "4a111d71c7992442b1178923828eab23",
"assets/assets/images/videoCovers/TruckModel.PNG": "0db833a643fd3e93d49b81e724521240",
"assets/assets/pdfs/ArcMastermind_EpicGrantApplication.pdf": "18f4fc35524e6dbe69d8de3cd08d7294",
"assets/assets/portfoliocontrol.riv": "05c97fbddff6b5e363af8c08629bbf5f",
"assets/assets/sounds/EngineHum.wav": "4d2ec6576c390a060542c8b9a037da56",
"assets/assets/sounds/FutureToPlanet.wav": "016ef43818b4fb63375dc385ee5bf15c",
"assets/assets/sounds/FutureToPlanetClip.mp3": "2c0183b2a7a0f46aa61fd224238295e5",
"assets/assets/sounds/Laser.flac": "b2eed4943bc241aaa48564721252e956",
"assets/assets/sounds/Laser.mp3": "f66e7a0e94a7e56f321e87cd59b98ba5",
"assets/assets/sounds/MoveToSide.wav": "e50593309e8ae4570445b5072169ead8",
"assets/assets/sounds/MoveToSideClip.mp3": "19c580dfd70bd455556288db5a69d8fe",
"assets/assets/sounds/NewLaser.wav": "43d92e59ccca8114e9505e8b46414618",
"assets/assets/sounds/NewLaserClip.mp3": "91267738a8d4ba87f6d9ef1f1834d3a9",
"assets/assets/sounds/Select1.mp3": "426dc33a5301d2598c1691100ebc1dfc",
"assets/assets/sounds/Select1.wav": "c664ec179e8bbeafd06f5b4601211575",
"assets/assets/sounds/Select2.wav": "57c3156fa0bbf8245a76428189255660",
"assets/assets/sounds/SwooshToPlanet.wav": "328ebc7460bc35d638b5f699707529c3",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "2dea70979bb3f44c90386feacb5ecd0a",
"assets/NewLaserClip.mp3": "91267738a8d4ba87f6d9ef1f1834d3a9",
"assets/NOTICES": "1801b14c43abda36a573dae3a3d9d94b",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/packages/youtube_player_iframe/assets/player.html": "dc7a0426386dc6fd0e4187079900aea8",
"assets/shaders/ink_sparkle.frag": "4096b5150bac93c41cbc9b45276bd90f",
"canvaskit/canvaskit.js": "eb8797020acdbdf96a12fb0405582c1b",
"canvaskit/canvaskit.wasm": "73584c1a3367e3eaf757647a8f5c5989",
"canvaskit/chromium/canvaskit.js": "0ae8bbcc58155679458a0f7a00f66873",
"canvaskit/chromium/canvaskit.wasm": "143af6ff368f9cd21c863bfa4274c406",
"canvaskit/skwasm.js": "87063acf45c5e1ab9565dcf06b0c18b8",
"canvaskit/skwasm.wasm": "2fc47c0a0c3c7af8542b601634fe9674",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "59a12ab9d00ae8f8096fffc417b6e84f",
"flutter_web_init.js": "dcc405dc6a1ebe02f2603ae964063f97",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "34a47643cffb2e4dae7e4856a4f784b1",
"/": "34a47643cffb2e4dae7e4856a4f784b1",
"main.dart.js": "b18f7be6ba8280520048b60fe7363267",
"manifest.json": "01dd59f21aa6f181c40338248238a741",
"version.json": "25826202bdc14de19c35d088d68e528f"};
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
