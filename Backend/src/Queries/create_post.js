const express = require("express");
const router = express.Router();
const Post = require("./../Model/Post");

router.post("/", async (req, res) => {
  const post = new Post({
    title: req.body.title,
    description: req.body.description,
    whatsapp: req.body.whatsapp,
  });
  try {
    const savedPost = await post.save();
    res.json(savedPost);
  } catch (err) {
    res.json({ message: "error" });
  }
});

module.exports = router;
