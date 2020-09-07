const express = require("express");
const router = express.Router();
const Post = require("./../Model/Post");

router.patch("/:postId", async (req, res) => {
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
});

module.exports = router;
