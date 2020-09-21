if has("nvim")
    lua require("bran.main").main()
else
    echoerr "Bran: Requires Neovim."
endif
