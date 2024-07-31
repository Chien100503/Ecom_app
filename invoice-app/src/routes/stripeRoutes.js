const express = require("express");
const stripe = require("stripe")(process.env.STRIPE_SECRET_KEY);
const { sendInvoice } = require("../controllers/invoiceController");

const router = express.Router();

// Endpoint Stripe Webhook
router.post("/stripe-webhook", express.raw({ type: "application/json" }), (req, res) => {
  const sig = req.headers["stripe-signature"];
  const webhookSecret = process.env.STRIPE_WEBHOOK_SECRET;

  let event;

  try {
    event = stripe.webhooks.constructEvent(req.body, sig, webhookSecret);
  } catch (err) {
    console.error("Webhook error:", err.message);
    return res.status(400).send(`Webhook Error: ${err.message}`);
  }

  // Handle Stripe event
  if (event.type === "invoice.payment_succeeded") {
    const invoice = event.data.object;
    sendInvoice(
      {
        body: {
          to: invoice.customer_email,
          invoice_id: invoice.id,
          customer_email: invoice.customer_email || "N/A",
          customer_name: invoice.customer_name || "Customer",
          customer_address: invoice.customer_address || "N/A",
          amount_paid: invoice.amount_paid / 100,
          currency: invoice.currency,
          payment_status: invoice.payment_status,
          items: [{ product_name: invoice.product_name, price: invoice.price, quantity: invoice.quantity }],
        },
      },
      (error, message) => {
        if (error) {
          console.error("Error sending invoice:", error);
        } else {
          console.log(message);
        }
      }
    );
  } else {
    console.log(`Unhandled event type ${event.type}`);
  }

  res.json({ received: true });
});

module.exports = router;
