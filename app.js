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






