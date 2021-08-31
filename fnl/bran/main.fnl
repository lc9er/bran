(module bran.main
        {require { a bran.aniseed.string 
                  core bran.aniseed.core
                  nvim bran.aniseed.nvim}}) 

(defn build-list [mystring range pad sep]
  "build a list of one or more line(s)"
  (var x [""])
  (let [opt sep]
    (if (= opt "\n")
      ; each line is a value in the seq table
      (for [i 1 range]
        (tset x i (.. mystring (string.format pad i))))
      ; concat everything into one val in the table
      (for [i 1 range]
        (tset x 1 (.. (. x 1) mystring (string.format pad i) opt)))))
  x)

; (defn build-list [mystring range pad sep]
;   "build a list of one or more line(s)"
;   (var x [])
;   (for [i 0 (- range 1)]
;     (tset x 1 (.. (. x 1) mystring (string.format pad i) sep)))
;   x)

(defn cursor-line-pos []
  "Return the cursor's current line number"
  (let [pos (nvim.win_get_cursor 0)]
    (. pos 1)))

(defn bran-bran [mystring range ?pad ?sep] 
  "Build list w/supplied args"
  (var lines (build-list mystring range (or ?pad "%00d") (or ?sep "\n"))
    (let [pos (+ 1 (cursor-line-pos))]
      (nvim.buf_set_lines 0 pos pos false lines))))

(defn echoerr [...]
  (nvim.err_write (.. (a.join " " ["Bran:" ...]) "\n")))

(defn init []
  (nvim.ex.command_
    :-nargs=* :-complete=command :Bran :lua
    "require('bran.main')['bran-bran'](<f-args>)"))

(init "user_0" 10 nil ":")

; This works. Now I need to figure out how to
; 1. Figure out how to pass args to function 
; 2. Setup mappings
; 3. load the module
; 4. incorporate the pastery functionality

