(module bran.main
        {require { a aniseed.string 
                  core aniseed.core
                  nvim aniseed.nvim}}) 

(def this :bran.main)

(defn build-list [mystring range ?pad ?sep]
  "build a list of one or more line(s)"
  ; nil concat error if table empty and sep is not newline
  (var x [""]) 
  (let [opt (or ?sep "\n")
        p   (or ?pad "%00d")]
    (for [i 1 range]
      ; Lua throws error if you add newline to string
      (match opt
        ; table.insert adds a blank line
        "\n"  (tset x i (.. mystring (string.format p i))) 
        _     (tset x 1 (.. (. x 1) mystring (string.format p i) opt))))
  x))

(defn cursor-line-pos []
  "Return the cursor's current line number"
  ; returns (row, column)
  (let [pos (nvim.win_get_cursor 0)]
    (. pos 1)))

(defn bran-bran [mystring range ?pad ?sep] 
  "Build list w/supplied args"
  (var lines (build-list mystring range ?pad ?sep))
    (let [pos (- (cursor-line-pos) 1)]
      (nvim.buf_set_lines 0 pos pos false lines)))

(defn echoerr [...]
  (nvim.err_write (.. (a.join " " ["Bran:" ...]) "\n")))

(defn init []
  (nvim.ex.command_
    :-nargs=* :-complete=command :Bran :lua
    "require('bran.main')['bran-bran'](<f-args>)"))

(init [])
