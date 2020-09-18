require("dotenv").config();
const express = require("express");
const router = express.Router();
const Post = require("./../Model/Post");

router.get("/", async (req, res) => {
  if (
    req.body.user == process.env.USER &&
    req.body.password == process.env.PASSWORD
  ) {
    try {
      const posts = await Post.find();
      res.json(posts);
    } catch (err) {
      res.json({ message: "error" });
    }
  } else {
    res.json({ message: "authentication failed" });
  }
});

module.exports = router;
