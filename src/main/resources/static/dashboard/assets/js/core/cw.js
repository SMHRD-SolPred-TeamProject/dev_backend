const content = "ㅤNCT DREAM 앨범을 사보는 건 어떨까요?ㅤ";
const text = document.querySelector(".text");
let i = 0;

function typing() {
  if (i < content.length) {
    let txt = content.charAt(i);
    text.innerHTML += txt;
    i++;
  }
}
setInterval(typing, 200);
