require("dotenv").config();
const express = require("express");
const router = express.Router();
const Post = require("./../Model/Post");

router.post("/", async (req, res) => {
  if (
    req.body.user == process.env.USER &&
    req.body.password == process.env.PASSWORD
  ) {
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
  } else {
    res.json({ message: "authentication failed" });
  }
});

module.exports = router;
