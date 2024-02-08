import { LightningElement,wire } from 'lwc';
import RazorpayPaymentController from '@salesforce/apex/RazorpayPaymentController.createOrder';
import razorpayPaymentButtonScript from '@salesforce/resourceUrl/razorpayPaymentButtonScript';


export default class RazorpayPaymentButton extends LightningElement {
    isScriptLoaded = false;

    @wire(RazorpayPaymentController)
    orderData;

    renderedCallback() {
        if (this.isScriptLoaded) {
            return;
        }

        // Load the Razorpay script
        Promise.all([(this, razorpayPaymentButtonScript)])
            .then(() => {
                this.isScriptLoaded = true;
                console.log('Razorpay script loaded successfully'+razorpayPaymentButtonScript);
                // Uncomment the line below to initialize Razorpay
               // this.initializeRazorpay();
            })
            .catch(error => {
                console.error('Error loading Razorpay script:', error);
            });
    }

    initializeRazorpay() {

        RazorpayPaymentController.createOrder()
        console.log( RazorpayPaymentController.createOrder());
          

      /*  const razorpay = window.Razorpay;

        if (razorpay) {
            // Perform Razorpay initialization here
            console.log('Initializing Razorpay...');
            
            // Example: Create a new instance of Razorpay
            const options = {
                key: 'rzp_test_8JfAtgTIJ03qk2',
                amount: 50, // Example amount in paise (50 INR)
                currency: 'INR',
                name: 'Your Company Name',
                description: 'Test Payment',
                image: 'your-company-logo-url',
                handler: function(response) {
                    console.log('Payment successful!', response);
                },
                prefill: {
                    name: 'John Doe',
                    email: 'john@example.com',
                    contact: '9876543210'
                }
            };

            const razorpayInstance = new razorpay(options);
            razorpayInstance.open();
        } else {
            console.error('Razorpay not found. Please check the script loading.');
        }*/
    }
}
