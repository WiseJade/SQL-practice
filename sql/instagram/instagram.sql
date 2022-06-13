CREATE TABLE [user] (
  [id] int PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [name] varchar(255) NOT NULL
)
GO

CREATE TABLE [post] (
  [id] int PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [userId] int,
  [postContent] varchar(255)
)
GO

CREATE TABLE [like] (
  [id] int PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [userId] int,
  [postId] int
)
GO

CREATE TABLE [hashtag] (
  [id] int PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [hashtagContent] varchar(255) NOT NULL
)
GO

CREATE TABLE [post_hashtag] (
  [id] int PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [postId] int,
  [hashtagId] int
)
GO

CREATE TABLE [comment] (
  [id] int PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [postId] int,
  [userId] int,
  [commentContent] varchar(255)
)
GO

CREATE TABLE [follower] (
  [id] int PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [following] int,
  [follower] int
)
GO

ALTER TABLE [post] ADD FOREIGN KEY ([userId]) REFERENCES [user] ([id]) ON UPDATE CASCADE
GO

ALTER TABLE [like] ADD FOREIGN KEY ([userId]) REFERENCES [user] ([id]) ON UPDATE CASCADE
GO

ALTER TABLE [like] ADD FOREIGN KEY ([postId]) REFERENCES [post] ([id]) ON UPDATE CASCADE
GO

ALTER TABLE [post_hashtag] ADD FOREIGN KEY ([postId]) REFERENCES [post] ([id]) ON UPDATE CASCADE
GO

ALTER TABLE [post_hashtag] ADD FOREIGN KEY ([hashtagId]) REFERENCES [hashtag] ([id]) ON UPDATE CASCADE
GO

ALTER TABLE [comment] ADD FOREIGN KEY ([postId]) REFERENCES [post] ([id]) ON UPDATE CASCADE
GO

ALTER TABLE [comment] ADD FOREIGN KEY ([userId]) REFERENCES [user] ([id]) ON UPDATE CASCADE
GO

ALTER TABLE [follower] ADD FOREIGN KEY ([following]) REFERENCES [user] ([id]) ON UPDATE CASCADE
GO

ALTER TABLE [follower] ADD FOREIGN KEY ([follower]) REFERENCES [user] ([id]) ON UPDATE CASCADE
GO
