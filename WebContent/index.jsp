<html>
<head>

<style>
/* 
  Include the min-width, max-width, min-height 
  and max-height if you plan to use a relative CSS unit 
  measurement to make sure the widget renders in the 
  optimal size allowed.    
  */   
  
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
  
  
  /* The following are required only when you use the read-only widgets: */
  
  #readOnlyAddressBookWidgetDiv {
      min-width: 266px;
      width: 100%;
      max-width: 900px;
      min-height: 145px;
      height: 165px;
      max-height: 180px;
  }
  
  #readOnlyWalletWidgetDiv {
      min-width: 266px;
      width: 100%;
      max-width: 900px;
      min-height: 145px;
      height: 165px;
      max-height: 180px;
  }	
</style>

<script async="async"
	src='https://static-na.payments-amazon.com/OffAmazonPayments/us/sandbox/js/Widgets.js'>
  </script>

<script type='text/javascript'>
    window.onAmazonLoginReady = function() {
      amazon.Login.setClientId('amzn1.application-oa2-client.5bacbabdf3904a19bef63e179f32f751');
    };
    window.onAmazonPaymentsReady = function() {
    	 OffAmazonPayments.Button("AmazonPayButton", "ALJHHA7432U96", { 
    	        type:  "LwA", 
    	        color: "LightGray", 
    	        size:  "medium ", 
    	        language: "en-GB",
    		  });
    };
    
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

</head>


<body>

	

	


	<div id="Logout">Logout</div>
	<div id="AmazonPayButton"></div>
	<div id="addressBookWidgetDiv"> </div> 
	<script type="text/javascript">
     document.getElementById('Logout').onclick = function() {
       amazon.Login.logout();
     };
   </script>

	<script type="text/javascript">
		document.getElementById('AmazonPayButton').onclick = function() {
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





</body>
</html>