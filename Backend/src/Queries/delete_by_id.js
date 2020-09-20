require("dotenv").config();
const express = require("express");
const router = express.Router();
const Post = require("./../Model/Post");

router.delete("/", async (req, res) => {
  var user = req.query.user;
  var password = req.query.password;
  var id = req.query.id;
  if (user == process.env.USER && password == process.env.PASSWORD) {
    try {
      const removedPost = await Post.remove({ _id: id });
      res.json(removedPost);
    } catch (err) {
      res.json({ message: "user not found" });
    }
  } else {
    res.json({ message: "authentication failed" });
  }
});

module.exports = router;
