const express = require("express");
const router = express.Router();
const Post = require("./../Model/Post");

router.get("/", async (req, res) => {
  try {
    const posts = await Post.find();
    res.json(posts);
  } catch (err) {
    res.json({ message: "error" });
  }
});

module.exports = router;
