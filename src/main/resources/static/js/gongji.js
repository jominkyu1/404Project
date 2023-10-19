/**
 * gongji.js
 */
 
 function gw_check(){ 
    
    if($.trim($('#board_title').val()) == ''){
      alert('공지 제목을 입력하세요!');
      $("#board_title").val("").focus();
      return false;
    } 
    
    
    if($.trim($('#board_cont').val()) == ''){
      alert('공지 내용을 입력하세요!');
      $("#board_cont").val("").focus();
      return false;
    }  
 }
 
 
 
 
 
 