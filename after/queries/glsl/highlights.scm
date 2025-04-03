;extends

; when glsl is injected, @variables should take precedence over parent's @strings
((identifier) @variable
  (#set! priority 105))
