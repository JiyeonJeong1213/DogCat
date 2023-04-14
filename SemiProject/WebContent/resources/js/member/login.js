/**
 * 
 */
function submitLogin(){
   let userId = $("#login-form input[name=userId]").val();
   if($("#remember-check").is(":checked") ) {
    document.cookie = "remember-check="+userId+"; path=/; max-age="+60*60*24;     
   }else{
      document.cookie = "remember-check=; path=/; max-age=0;"
   }
   $("#login-form").submit();
}

function getCookie(){
   let value = "";
   if(document.cookie.length > 0){
      let index = document.cookie.indexOf("remember-check=");
      if(index != -1){ 
         index += "remember-check=".length;
         let end = document.cookie.indexOf(";",index);
         
         if(end == -1){
            value = document.cookie.substring(index);
         }else{
            value = document.cookie.substring(index,end );
         }
         $("#login-form input[name=userId]").val(value);
         $("#remember-check").attr("checked",true);
      }
   }
}
$(function(){
   getCookie();
});
