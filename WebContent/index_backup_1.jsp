<html>
<head>

	<script async="async" src='https://static-na.payments-amazon.com/OffAmazonPayments/us/sandbox/js/Widgets.js'>
  </script>
  
  <script type='text/javascript'>
    window.onAmazonLoginReady = function() {
      amazon.Login.setClientId('amzn1.application-oa2-client.5bacbabdf3904a19bef63e179f32f751');
    };
    window.onAmazonPaymentsReady = function() {
                showButton();
    };
  </script>

</head>
    

<body>

 <div id="AmazonPayButton">
 </div>

 <script type="text/javascript">
    function showButton(){
      var authRequest; 
      OffAmazonPayments.Button("AmazonPayButton", "ALJHHA7432U96", { 
        type:  "LwA", 
        color: "LightGray", 
        size:  "medium ", 
        language: "en-GB",

        authorization: function() { 
        //loginOptions = {scope: "payments:widget payments:shipping_address",       popup: "true"}; 
         loginOptions = { scope: "profile postal_code", popup: true };
           
        authRequest = amazon.Login.authorize (loginOptions, 
        	"http://localhost:8080/AmazonPay/"); 
        },  
        onError: function(error) { 
          // your error handling code.
         alert("The following error occurred: " 
                + error.getErrorCode() 
             + ' - ' + error.getErrorMessage());
        }  
        /*
        	 options = { scope: 'profile' };
             amazon.Login.authorize(options, function(response) {
               if ( response.error ) {
                   alert('oauth error ' + response.error);
                  return;
               }
             	alert('success: ' + response.access_token);
             });
             
             */
             
     });
    }; 
   </script>
 
 
  <div id="Logout"> Logout </div>
  <div id="LoginWithAmazon">
  Do Login
 </div>
   <script type="text/javascript">
     document.getElementById('Logout').onclick = function() {
       amazon.Login.logout();
     };
   </script>
   
   <script type="text/javascript">
		document.getElementById('LoginWithAmazon').onclick = function() {
		 setTimeout(window.doLogin, 1);
		 return false;
		};
		window.doLogin = function() {
		  options = {};
		  options.scope = 'profile';
		  options.popup = true ;
		  amazon.Login.authorize(options, function(response) {
		     if ( response.error ) {
		       alert('oauth error ' + response.error);
		       return;
		     }
		     amazon.Login.retrieveProfile(response.access_token, function(response) {
		         alert('Hello, ' + response.profile.Name);
		         alert('Your e-mail address is ' + response.profile.PrimaryEmail);
		         alert('Your unique ID is ' + response.profile.CustomerId);
		         if (window.console && window.console.log)
		         window.console.log(response);
		     });
		 });
		};
</script>
   
   

<!-- 

https://pay.amazon.com/us/developer/documentation/automatic/201757210

https://pay.amazon.com/us/developer/documentation/lpwa/201951060

Application Id: amzn1.application.8c5580bdddfa44209ffdeaa654479ead

{
"merchant_id":"ALJHHA7432U96",
"access_key":"AKIAJF4XMPQDZGMJVMIQ",
"secret_key":"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"
}

{
"merchant_id":"ALJHHA7432U96",
"access_key":"AKIAJF4XMPQDZGMJVMIQ",
"secret_key":"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",
"client_id":"amzn1.application-oa2-client.8273541ffe894b58b8d804907e1e654e",
"client_secret":"475177cd055b8f239bee03a7e4dcf7967c8d6a1fa6a509ee0b6ab593d2e44c43"
}

{
"merchant_id":"ALJHHA7432U96",
"access_key":"AKIAJF4XMPQDZGMJVMIQ",
"secret_key":"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",
"client_id":"amzn1.application-oa2-client.5bacbabdf3904a19bef63e179f32f751",
"client_secret":"947a661ebe5418afceb38206cd86589817ed9b23baaebe75518202c0115bf914"
}

https://sellercentral.amazon.co.uk/gp/contact-us/contact-amazon-form.html?ref=xx_contactus_foot_xx
https://pay.amazon.com/us/developer/documentation/automatic/201757280  --Security Concern 
https://pay.amazon.com/us/developer/documentation/apireference/201752040
 -->
 

</body>
</html>