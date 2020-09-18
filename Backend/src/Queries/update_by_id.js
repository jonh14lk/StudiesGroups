require("dotenv").config();
const express = require("express");
const router = express.Router();
const Post = require("./../Model/Post");

router.patch("/:postId", async (req, res) => {
  if (
    req.body.user == process.env.USER &&
    req.body.password == process.env.PASSWORD
  ) {
    try {
      const UpdatedPost = await Post.updateOne(
        { _id: req.params.postId },
        {
          $set: {
            title: req.body.title,
            description: req.body.description,
            whatsapp: req.body.whatsapp,
          },
        }
      );
      res.json(UpdatedPost);
    } catch (err) {
      res.json({ message: "user not found" });
    }
  } else {
    res.json({ message: "authentication failed" });
  }
});

module.exports = router;
