const path = require("path");
const ejs = require("ejs");
const fs = require("fs");
const transporter = require("../config/nodemailerConfig");

const renderTemplate = (templateName, data) => {
  const filePath = path.join(__dirname, "..", "invoice", `${templateName}.ejs`);
  const template = fs.readFileSync(filePath, "utf-8");
  return ejs.render(template, data);
};

const sendInvoice = (data, callback) => {
  const { to, invoice_id, customer_name, customer_address, customer_email, customer_phone, amount_paid, currency = "USD", payment_status, items = [] } = data.body;

  const recipientEmail = to || customer_email || "default@example.com";

  const htmlContent = renderTemplate("invoice", {
    invoice_id,
    customer_name,
    customer_address: customer_address || "N/A",
    customer_email: customer_email || "N/A",
    customer_phone: customer_phone || "N/A",
    amount_paid: amount_paid.toFixed(2) + " " + currency,
    currency: currency.toUpperCase(),
    payment_status,
    items: items || [],
  });

  const mailOptions = {
    from: process.env.EMAIL,
    to: recipientEmail,
    subject: "Your Invoice",
    html: htmlContent,
  };

  transporter.sendMail(mailOptions, (error, info) => {
    if (error) {
      console.log("Error:", error);
      if (typeof callback === "function") {
        return callback("Unable to send invoice email", null);
      }
    } else {
      console.log("Invoice email sent:", info.response);
      if (typeof callback === "function") {
        return callback(null, "Invoice email sent successfully");
      }
    }
  });
};

module.exports = { sendInvoice };
