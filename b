const title = document.getElementById("title");
const subtitle = document.getElementById("subtitle");
const categories = document.getElementById("categories");
const timer = document.getElementById("timer");

const scenes = [
  {
    time: 0,
    title: "KINOLAR<br>SHU YERDA!",
    subtitle: "Siz sevgan kinolar — bir joyda!",
    categories: ["🎥 KINOLAR", "📺 SERIALLAR"]
  },
  {
    time: 6,
    title: "SARGUZASHT<br>BOSHLANADI!",
    subtitle: "Har bir kadrda yangi hayajon!",
    categories: ["⚡ AKSIYA", "🌌 FANTASTIKA"]
  },
  {
    time: 12,
    title: "SEVIMLI<br>OLAMINGIZ!",
    subtitle: "O'zingizga yoqqan janrni tanlang!",
    categories: ["😂 KOMEDIYA", "🎭 DRAMA"]
  },
  {
    time: 18,
    title: "KATTA EKRAN<br>KAYFIYATI!",
    subtitle: "Kino zavqini his eting!",
    categories: ["🎬 KINO", "✨ SARGUZASHT"]
  },
  {
    time: 24,
    title: "KINOLAR<br>SHU YERDA!",
    subtitle: "Siz sevgan kinolar — bir joyda!",
    categories: ["▶ TOMOSHA", "★ YANGI OLAM"]
  }
];

let startTime;
let finished = false;

function showScene(scene) {
  title.innerHTML = scene.title;
  subtitle.textContent = scene.subtitle;
  categories.innerHTML = scene.categories
    .map(item => <span>${item}</span>)
    .join("");
}

function animate(now) {
  if (startTime === undefined) startTime = now;

  const elapsed = (now - startTime) / 1000;
  const seconds = Math.floor(elapsed);

  timer.textContent = Math.max(0, 30 - seconds);

  const scene = [...scenes]
    .reverse()
    .find(item => seconds >= item.time);

  if (scene) {
    const current = scenes.indexOf(scene);

    if (animate.lastScene !== current) {
      showScene(scene);
      animate.lastScene = current;
    }
  }

  if (elapsed < 30) {
    requestAnimationFrame(animate);
  } else if (!finished) {
    finished = true;
    title.innerHTML = "KINOLAR<br>SHU YERDA!";
    subtitle.textContent = "Reklama yakunlandi!";
    timer.textContent = "0";
  }
}

function startAd() {
  startTime = undefined;
  finished = false;
  animate.lastScene = -1;
  requestAnimationFrame(animate);
}

document.addEventListener("click", () => {
  if (finished) startAd();
});

startAd();







<!DOCTYPE html>
<html lang="uz">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Kinolar Shu Yerda!</title>
  <link rel="stylesheet" href="style.css">
</head>
<body>
  <div class="scene">
    <div class="light light1"></div>
    <div class="light light2"></div>

    <div class="film film1">🎞</div>
    <div class="film film2">🎬</div>

    <div class="content">
      <div class="logo">▶ KINO</div>

      <h1 id="title">KINOLAR<br>SHU YERDA!</h1>

      <p id="subtitle">
        Siz sevgan kinolar — bir joyda!
      </p>

      <div class="line"></div>

      <div class="categories" id="categories">
        <span>🎥 KINOLAR</span>
        <span>📺 SERIALLAR</span>
        <span>🎨 MULTFILMLAR</span>
      </div>
    </div>

    <div class="bottom">TOMOSHA BOSHLANADI...</div>
    <div class="timer" id="timer">30</div>

    <!-- QR-KOD VA MA'LUMOT -->
    <div class="qr-box">
      <div class="qr-placeholder">
        <div id="qr"></div>
      </div>
      <div class="qr-info">
        <h2>BATAFSIL MA'LUMOT</h2>
        <p>Telefoningiz bilan<br>QR-kodni skaner qiling!</p>
        <small>Sayt tez orada ishga tushadi.</small>
      </div>
    </div>
  </div>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/qrcodejs/1.0.0/qrcode.min.js"></script>
  <script src="app.js"></script>
  <script>
    // Hozircha sayt manzili o'rniga oddiy ma'lumot
    new QRCode(document.getElementById("qr"), {
      text: "KINOLAR SHU YERDA! Sayt tez orada ishga tushadi.",
      width: 90,
      height: 90,
      colorDark: "#000000",
      colorLight: "#ffffff"
    });
  </script>
</body>
</html>

* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

body {
  background: #03040b;
  color: white;
  font-family: Arial, sans-serif;
  overflow: hidden;
}

.scene {
  width: 100vw;
  height: 100vh;
  min-height: 400px;
  position: relative;
  display: flex;
  justify-content: center;
  align-items: center;
  overflow: hidden;
  background:
    radial-gradient(ellipse at center,
    #182c59 0%, #080c20 45%, #020207 100%);
}

.content {
  position: relative;
  z-index: 2;
  text-align: center;
  padding: 20px;
  animation: appear 2s ease both;
}

.logo {
  color: #ff303d;
  font-size: clamp(24px, 4vw, 50px);
  font-weight: 900;
  letter-spacing: 8px;
  text-shadow: 0 0 25px #ff172f;
  margin-bottom: 25px;
}

h1 {
  font-size: clamp(38px, 8vw, 105px);
  font-weight: 1000;
  line-height: 1.05;
  color: white;
  text-shadow:
    0 4px 0 #8a101a,
    0 8px 0 #4b0810,
    0 0 30px #ff183d;
  animation: pulse 2s infinite alternate;
}

p {
  font-size: clamp(16px, 2.5vw, 30px);
  margin-top: 25px;
  color: #b9d7ff;
}

.line {
  width: 0;
  height: 5px;
  background: #ff233e;
  margin: 25px auto;
  box-shadow: 0 0 20px red;
  animation: lineMove 2s 1s forwards;
}

.categories {
  display: flex;
  justify-content: center;
  flex-wrap: wrap;
  gap: 20px;
  font-size: clamp(10px, 1.5vw, 20px);
  font-weight: bold;
  opacity: 0;
  animation: appear 2s 2s forwards;
}

.light {
  position: absolute;
  width: 40vw;
  height: 40vw;
  border-radius: 50%;
  filter: blur(100px);
  opacity: .4;
  animation: moveLight 8s infinite alternate;
}

.light1 {
  background: #ff003c;
  top: -20%;
  left: -15%;
}

.light2 {
  background: #006aff;
  bottom: -25%;
  right: -15%;
  animation-delay: 2s;
}

.film {
  position: absolute;
  font-size: clamp(50px, 10vw, 130px);
  opacity: .25;
  animation: rotate 12s linear infinite;
}

.film1 {
  top: 8%;
  left: 5%;
}

.film2 {
  bottom: 8%;
  right: 5%;
  animation-direction: reverse;
}

.bottom {
  position: absolute;
  bottom: 25px;
  font-size: clamp(10px, 1.5vw, 18px);
  letter-spacing: 4px;
  color: #ff5266;
}

.timer {
  position: absolute;
  top: 20px;
  right: 25px;
  color: #ffffff80;
  font-size: 18px;
}

@keyframes appear {
  from { opacity: 0; transform: translateY(35px); }
  to { opacity: 1; transform: translateY(0); }
}

@keyframes pulse {
  from { transform: scale(1); }
  to { transform: scale(1.04); }
}

@keyframes lineMove {
  to { width: 80%; }
}

@keyframes moveLight {
  from { transform: translate(-10%, -10%); }
  to { transform: translate(30%, 20%); }
}

@keyframes rotate {
  to { transform: rotate(360deg); }
}

.qr-box {
  position: absolute;
  right: 25px;
  bottom: 65px;
  z-index: 10;
  display: flex;
  align-items: center;
  gap: 12px;
  padding: 12px;
  background: rgba(3, 7, 20, 0.92);
  border: 2px solid #ff354d;
  border-radius: 12px;
  box-shadow: 0 0 20px #ff354d55;
}

.qr-placeholder {
  background: white;
  padding: 5px;
  border-radius: 5px;
}

.qr-info h2 {
  font-size: 15px;
  color: #ff5369;
  margin-bottom: 8px;
}

.qr-info p {
  font-size: 12px;
  color: white;
  line-height: 1.5;
  margin: 0 0 6px;
}

.qr-info small {
  color: #aab8d9;
  font-size: 10px;
}

@media (max-width: 650px) {
  .qr-box {
    right: 8px;
    bottom: 45px;
    transform: scale(0.7);
    transform-origin: bottom right;
  }
}


