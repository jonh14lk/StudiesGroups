require("dotenv").config();
const express = require("express");
const app = express();
const mongoose = require("mongoose");
const bodyParser = require("body-parser");
const cors = require("cors");
const GetAllRoute = require("./Queries/get_all");
const GetByIdRoute = require("./Queries/get_by_id");
const UpdateByIdRoute = require("./Queries/update_by_id");
const DeleteByIdRoute = require("./Queries/delete_by_id");
const CreatePostRoute = require("./Queries/create_post");

app.use(bodyParser.json());
app.use(cors());
app.use(
  "/",
  GetAllRoute,
  GetByIdRoute,
  UpdateByIdRoute,
  DeleteByIdRoute,
  CreatePostRoute
);

mongoose.connect(
  process.env.MONGO_URL,
  { useNewUrlParser: true, useUnifiedTopology: true },
  () => {
    console.log("connected do DB");
  }
);

app.listen(process.env.PORT);
