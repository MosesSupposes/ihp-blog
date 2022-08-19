module Web.View.Posts.Index where

import Web.View.Prelude

data IndexView = IndexView {posts :: [Post]}

instance View IndexView where
  html IndexView {..} =
    [hsx|
        {breadcrumb}

        <a href={pathTo NewPostAction} class="btn btn-primary">+ New</a>
        <div class="table-responsive">
          <table class="table">
              <thead>
                  <tr>
                      <th>Post</th>
                      <th>Publish Date</th>
                      <th>Actions</th>
                  </tr>
              </thead>
              <tbody>{forEach posts renderPost}</tbody>
          </table>
        </div>
    |]
    where
      breadcrumb =
        renderBreadcrumb
          [ breadcrumbLink "Posts" PostsAction
          ]

renderPost :: Post -> Html
renderPost post =
  [hsx|
    <tr>
        <td><a href={ShowPostAction (get #id post)}>{get #title post}</a></td>
        <td>{get #createdAt post |> dateTime}</td>
        <td><a href={EditPostAction (get #id post)} class="text-muted">Edit</a></td>
        <td><a href={DeletePostAction (get #id post)} class="js-delete text-muted">Delete</a></td>
    </tr>
|]
