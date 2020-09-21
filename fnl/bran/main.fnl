(module bran.main
  {require { a aniseed.string 
             core aniseed.core
             nvim aniseed.nvim}}) 

(defn build-list [mystring range ?sep]
  "build a list of one or more line(s)"
  (var x [""])
  (let [opt (or ?sep "\n")]
    (if (= opt "\n")
      ; each line is a value in the seq table
      (for [i 1 range]
        (tset x i (.. mystring i)))
      ; concat everything into one val in the table
      (for [i 1 range]
        (tset x 1 (.. (. x 1) mystring i opt)))))
  x)

(defn cursor-line-pos []
  "Return the cursor's current line number"
  (let [pos (nvim.win_get_cursor 0)]
    (. pos 1)))

(var lines (build-list "user_0" 10 "\n"))
(let [pos (+ 1 (cursor-line-pos))]
  (nvim.buf_set_lines 0 pos pos false lines))

(defn main []
  (nvim.ex.command_
    :-nargs=3 :Bran :lua
    "require('bran.main')['build-list'](<q-args>)"))

; This works. Now I need to figure out how to
; 1. Figure out how to pass args to function 
; 2. Setup mappings
; 3. load the module
; 4. incorporate the pastery functionality

