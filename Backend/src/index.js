const express = require("express");
const app = express();
const mongoose = require("mongoose");
const bodyParser = require("body-parser");
const cors = require("cors");
const Route = require("./Queries/posts");

app.use(bodyParser.json());
app.use(cors());
app.use("/", Route);

mongoose.connect(
  "mongodb+srv://joao:password@first.wiayh.gcp.mongodb.net/first?retryWrites=true&w=majority",
  { useNewUrlParser: true, useUnifiedTopology: true },
  () => {
    console.log("connected do DB");
  }
);

app.listen(3000);
