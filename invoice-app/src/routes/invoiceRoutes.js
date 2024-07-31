  const express = require("express");
  const stripe = require("stripe")(process.env.STRIPE_SECRET_KEY);
  const { sendInvoice } = require("../controller/invoiceController");

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

    // Xử lý sự kiện của Stripe
    if (event.type === "invoice.payment_succeeded") {
      const invoice = event.data.object;

      // Gửi hóa đơn qua email
      sendInvoice(
        {
          body: {
            to: "trungvipqn12@gmail.com", // Thay đổi thành địa chỉ email của khách hàng
            invoice_id: invoice.id,
            customer_name: invoice.customer_name || "Customer",
            amount_paid: invoice.amount_paid,
            currency: invoice.currency,
          },
        },
        res
      );
    } else {
      console.log(`Unhandled event type ${event.type}`);
    }

    res.json({ received: true });
  });

  module.exports = router;
