const express = require("express");
const router = express.Router();
const Post = require("./../Model/Post");

// list all posts
router.get("/", async (req, res) => {
  try {
    const posts = await Post.find();
    res.json(posts);
  } catch (err) {
    res.json({ message: "error" });
  }
});

// create new post
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

// find post by id
router.get("/:postId", async (req, res) => {
  try {
    const post = await Post.findById(req.params.postId);
    res.json(post);
  } catch (err) {
    res.json({ message: "user not found" });
  }
});

// delete post by id
router.delete("/:postId", async (req, res) => {
  try {
    const removedPost = await Post.remove({ _id: req.params.postId });
    res.json(removedPost);
  } catch (err) {
    res.json({ message: "user not found" });
  }
});

// update post by id
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
