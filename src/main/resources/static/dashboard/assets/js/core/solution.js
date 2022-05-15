const content = "ㅤ태양광패널이 열심히 전력을 생산하고 있습니다.ㅤ";

// 1_1280x835.jpg -> "ㅤ따끈따끈 전기밥솥을 5시간 사용할 수 있는 전력량이 생산됐어요ㅤ"
// 2_1280x835.jpg -> "ㅤ뽀송뽀송 건조기를 5시간 사용할 수 있는 전력량이 생산됐어요ㅤ"
// 3_1280x835.jpg -> "ㅤ뽀득뽀득 식기세척기를 5시간 사용할 수 있는 전력량이 생산됐어요ㅤ"
// 4_1280x835.jpg -> "ㅤ편리한 인덕션을 5시간 사용할 수 있는 전력량이 생산됐어요ㅤ"
// 1테슬라, 2테슬라,,,,,9테슬라도 해야하는데 아직 안함요
const text = document.querySelector(".text");
let i = 0;

function typing() {
  if (i < content.length) {
    let txt = content.charAt(i);
    text.innerHTML += txt;
    i++;
  }
}
setInterval(typing, 100);
