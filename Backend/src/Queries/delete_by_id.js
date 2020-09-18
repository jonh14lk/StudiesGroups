require("dotenv").config();
const express = require("express");
const router = express.Router();
const Post = require("./../Model/Post");

router.delete("/:postId", async (req, res) => {
  if (
    req.body.user == process.env.USER &&
    req.body.password == process.env.PASSWORD
  ) {
    try {
      const removedPost = await Post.remove({ _id: req.params.postId });
      res.json(removedPost);
    } catch (err) {
      res.json({ message: "user not found" });
    }
  } else {
    res.json({ message: "authentication failed" });
  }
});

module.exports = router;
