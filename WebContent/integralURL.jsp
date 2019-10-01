<html>
<head>
  <script type='text/javascript'>
    window.onAmazonLoginReady = function() {
      amazon.Login.setClientId('amzn1.application.8c5580bdddfa44209ffdeaa654479ead');
    };
    window.onAmazonPaymentsReady = function() {
                showButton();
    };
  </script>
    <script async="async" src='https://static-na.payments-amazon.com/OffAmazonPayments/us/sandbox/js/Widgets.js'>
  </script>
</head>

<body>

 <div id="AmazonPayButton">
 </div>

 <script type="text/javascript">
    function showButton(){
      var authRequest; 
      OffAmazonPayments.Button("AmazonPayButton", "ALJHHA7432U96", { 
        type:  "PwA", 
        color: "Gold", 
        size:  "small", 

        authorization: function() { 
        loginOptions = {scope: "profile", 
          popup: "true"}; 
        // loginOptions = { scope: "profile postal_code payments:widget payments:shipping_address", popup: true };
           
        authRequest = amazon.Login.authorize (loginOptions, 
          "/AmazonProcessing"); 
        }, 
 
        onError: function(error) { 
          // your error handling code.
          // alert("The following error occurred: " 
          //        + error.getErrorCode() 
          //        + ' - ' + error.getErrorMessage());
        } 
     });
    }; 
   </script>
 
   <script type="text/javascript">
     document.getElementById('Logout').onclick = function() {
       amazon.Login.logout();
     };
   </script>

https://pay.amazon.com/us/developer/documentation/automatic/201757210

https://pay.amazon.com/us/developer/documentation/lpwa/201951060

{
"merchant_id":"ALJHHA7432U96",
"access_key":"AKIAJF4XMPQDZGMJVMIQ",
"secret_key":"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"
}


</body>

</html>