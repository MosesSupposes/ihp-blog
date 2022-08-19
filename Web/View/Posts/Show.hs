module Web.View.Posts.Show where

import qualified Text.Blaze.Html as Blaze
import qualified Text.MMark as MMark
import Web.View.Prelude

data ShowView = ShowView {post :: Include "comments" Post}

instance View ShowView where
  html ShowView {..} =
    [hsx|
        {breadcrumb}
        <h1>{get #title post}</h1>
        <p>{get #createdAt post |> timeAgo}</p>
        <div>{get #body post |> renderMarkdown}</div>
        <a href={ NewCommentAction (get #id post)} class="btn btn-primary">Add Comment</a>
        <div class="comments-section">
          {forEach (get #comments post) renderComment}
        </div>

    |]
    where
      breadcrumb =
        renderBreadcrumb
          [ breadcrumbLink "Posts" PostsAction,
            breadcrumbText "Show Post"
          ]

renderMarkdown :: Text -> Blaze.Html
renderMarkdown text = case text |> MMark.parse "" of
  Left error -> "Something went wrong"
  Right markdown -> MMark.render markdown |> tshow |> preEscapedToHtml

renderComment :: Comment -> Html
renderComment comment =
  [hsx|
      <div class="comment">
        <div class="comment-actions">
          <button class="btn-small btn-secondary">
            <a href={EditCommentAction (get #id comment)} style="color: white">Edit</a> 
          </button>
          <button class="btn-small btn-secondary">
            <a href={DeleteCommentAction $ get #id comment} style="color: white" class="js-delete">Delete</a></button>
        </div>
        <h5>{get #author comment}</h5>
        <p>{get #body comment}</p>
      </div>
|]
