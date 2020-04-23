# What is this

This is lack middleware to override POST method.

# Use

## html

Example of use.

```html
<form method="POST">
  <input type="hidden" name="_method" value="PUT">
  <intpu type="submit" value="send">
</form>
```

POST is overridden by PUT.

# Test

```
$ qlot install
$ qlot exec ros run -e '(asdf:load-system :prove) (prove:run :lack-middleware-method-override)' -q
```
