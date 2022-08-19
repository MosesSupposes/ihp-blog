module Web.View.Posts.Edit where

import Web.View.Prelude

data EditView = EditView {post :: Post}

instance View EditView where
  html EditView {..} =
    [hsx|
        {breadcrumb}
        <h1>Edit Post</h1>
        {renderForm post}
    |]
    where
      breadcrumb =
        renderBreadcrumb
          [ breadcrumbLink "Posts" PostsAction,
            breadcrumbText "Edit Post"
          ]

renderForm :: Post -> Html
renderForm post =
  formFor
    post
    [hsx|
    {(textField #title)}
    {(textareaField #body) { helpText = "You can use Markdown here" }}
    {submitButton}
    <a href={ShowPostAction (get #id post)} class="btn btn-secondary ml-2">View Post</a>
|]
