<html>
<head>
    <meta name="viewport" content="width=device-width,initial-scale=1.0, maximum-scale=1.0"/>


	<script async="async" src='https://static-na.payments-amazon.com/OffAmazonPayments/us/sandbox/js/Widgets.js'>
  </script>
   <style>
  #addressBookWidgetDiv {
      min-width: 300px;
      width: 100%;
      max-width: 900px;
      min-height: 228px;
      height: 240px;
      max-height: 400px;
  }
  
  #walletWidgetDiv {
      min-width: 300px;
      width: 100%;
      max-width: 900px;
      min-height: 228px;
      height: 240px;
      max-height: 400px;
  }
 
  
  </style>

<script>
    window.onAmazonLoginReady = function () {
        amazon.Login.setClientId('amzn1.application-oa2-client.5bacbabdf3904a19bef63e179f32f751');
    };
    /*window.onAmazonPaymentsReady = function() {
                showButton();
    }; */
    
    window.onAmazonPaymentsReady = function() {

    	  addressBookWidget = new OffAmazonPayments.Widgets.AddressBook({
    	    sellerId: 'ALJHHA7432U96',
    		scope: 'SCOPE',
    	    onOrderReferenceCreate: function(orderReference) {
    	      // Here is where you can grab the Order Reference ID.
    	      orderReference.getAmazonOrderReferenceId();
    	    },
    		onAddressSelect: function(orderReference) {
    	      // Replace the following code with the action that you want
    	      // to perform after the address is selected. The 
    	      // amazonOrderReferenceId can be used to retrieve the address 
    	      // details by calling the GetOrderReferenceDetails operation. 
    	    },
    	    design: {
    	      designMode: 'responsive'
    	    },
    	    onReady: function(orderReference) {
    	      // Enter code here you want to be executed 
    	      // when the AddressBook widget has been rendered. 
    	    },

    	    onError: function(error) {
    	      // Your error handling code.
    	      // During development you can use the following
    	      // code to view error messages:
    	      // console.log(error.getErrorCode() + ': ' + error.getErrorMessage());
    	      // See "Handling Errors" for more information.
    	    }
    	  });
    	addressBookWidget.bind("addressBookWidgetDiv");
    	};
</script>

<script>
    function showButton() {               
        var authRequest;
        OffAmazonPayments.Button("AmazonPayButton", "ALJHHA7432U96", {
             type: "PwA",
             color: "Gold",
             size: "large",
             language: "en-UK",
             authorization: function () {
                loginOptions = { scope: "profile payments:widget payments:shipping_address", popup: true };
                authRequest = amazon.Login.authorize(loginOptions, "http://localhost:8080/AmazonPay/success.jsp");
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

</head>
<body>





<div id="AmazonPayButton"></div>


  <div id="Logout"> Logout </div>
</body>


</html>