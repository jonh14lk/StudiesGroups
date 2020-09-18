require("dotenv").config();
const express = require("express");
const router = express.Router();
const Post = require("./../Model/Post");

router.get("/:postId", async (req, res) => {
  if (
    req.body.user == process.env.USER &&
    req.body.password == process.env.PASSWORD
  ) {
    try {
      const post = await Post.findById(req.params.postId);
      res.json(post);
    } catch (err) {
      res.json({ message: "user not found" });
    }
  } else {
    res.json({ message: "authentication failed" });
  }
});

module.exports = router;
