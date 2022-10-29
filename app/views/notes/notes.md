# Minitest asserts used:

### `assert_response`

- Use `assert_response` to response to a request like get, post etc
- Example:
  `get root_path`
  `assert_response :success`

### `assert_template`

- Use `assert_template` for checking the relevant template is rendered
- Example:
  `assert_template 'static_pages/home'`

### `assert_select`

- Use `assert_select` when you need to check for a specific tag
- Example:
  `assert_select 'title', 'Hello World'`
  `assert_select 'a[href=?]', home_path, count: 2`
- There are still a lot of things we can do with `assert_select`, visit documentation for more.

### `assert`

- Use `assert` to check for truthy
- Example:
  `assert @user.valid?`
- It will return true if the user is valid

### `assert_not`

- Use `assert` to check for falsy
- Example:
  `assert_not @user.valid?`
- It will return true if the user is invalid

### `assert_equal`

- Use `assert_equal` to check for equality
- Example:
  `email = 'hello@gmail.com'`
  `assert_equal email, @user.email`
- It will return true when the `email` and `@user.email` are equal/same
