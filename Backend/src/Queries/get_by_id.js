const express = require("express");
const router = express.Router();
const Post = require("./../Model/Post");

router.get("/:postId", async (req, res) => {
  try {
    const post = await Post.findById(req.params.postId);
    res.json(post);
  } catch (err) {
    res.json({ message: "user not found" });
  }
});

module.exports = router;
