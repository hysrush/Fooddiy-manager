/**
 * 생년월일에 자동 슬래쉬 추가
 */

function autoSlashBirth(str){
  str = str.replace(/[^0-9]/g, '');
  var tmp = '';
  if( str.length < 5){
    return str;
  }else if(str.length < 7){
    tmp += str.substr(0, 4);
    tmp += '/';
    tmp += str.substr(4, 2);
    return tmp;
  }else{
    tmp += str.substr(0, 4);
    tmp += '/';
    tmp += str.substr(4, 2);
    tmp += '/';
    tmp += str.substr(6, 2);
    return tmp;
  }
}