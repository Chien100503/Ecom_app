const express = require("express");
const bodyParser = require("body-parser");
const stripeRouter = require("./src/routes/stripeRoutes");
const { sendInvoice } = require("./src/controllers/invoiceController");

const app = express();
app.use(bodyParser.json());

app.post("/send-invoice", async (req, res) => {
  try {
    const invoiceData = req.body;
    console.log("Invoice data received:", invoiceData);

    sendInvoice({ body: invoiceData }, (error, message) => {
      if (error) {
        console.error("Error sending invoice:", error);
        res.status(500).json({ success: false, message: "Error sending invoice" });
      } else {
        console.log(message);
        res.status(200).json({ success: true, message });
      }
    });
  } catch (error) {
    console.error("Error sending invoice:", error);
    res.status(500).json({ success: false, message: "Error sending invoice" });
  }
});

app.use("/webhook", stripeRouter);

app.listen(3000, () => {
  console.log("Server is running on port 3000");
});
