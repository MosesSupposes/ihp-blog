module Web.View.Comments.Edit where

import Web.View.Prelude

data EditView = EditView {comment :: Comment}

instance View EditView where
  html EditView {..} =
    [hsx|
        {breadcrumb}
        <h1>Edit Comment</h1>
        {renderForm comment}
    |]
    where
      breadcrumb =
        renderBreadcrumb
          [ breadcrumbLink "Back To Post" (ShowPostAction (get #postId comment)),
            breadcrumbText "Edit Comment"
          ]

renderForm :: Comment -> Html
renderForm comment =
  formFor
    comment
    [hsx|
    {(hiddenField #postId)}
    {(textField #author)}
    {(textField #body)}
    {submitButton}

|]
