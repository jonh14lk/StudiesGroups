const express = require("express");
const router = express.Router();
const Post = require("./../Model/Post");

router.delete("/:postId", async (req, res) => {
  try {
    const removedPost = await Post.remove({ _id: req.params.postId });
    res.json(removedPost);
  } catch (err) {
    res.json({ message: "user not found" });
  }
});

module.exports = router;
