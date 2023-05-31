local alpha = require("alpha")

local col = function(strlist, opts)
  -- strlist is a TABLE of TABLES, representing columns of text
  -- opts is a text display option

  -- column spacing
  local padding = 12
  -- fill lines up to the maximim length with 'fillchar'
  local fillchar = ' '
  -- columns padding char (for testing)
  local padchar = ' '

  -- define maximum string length in a table
  local maxlen = function(str)
    local max = 0
    for i in pairs(str) do
      if #str[i] > max then
        max = #str[i]
      end
    end
    return max
  end

  -- add as much right-padding to align the text block
  local pad = function(str, max)
    local strlist = {}
    for i in pairs(str) do
      if #str[i] < max then
        local newstr = str[i] .. string.rep(fillchar, max-#str[i])
        table.insert(strlist, newstr)
      else
        table.insert(strlist, str[i])
      end
    end
    return strlist
  end

  -- this is a table for text strings
  local values = {}
  -- process all the lines
  for i=1,maxlen(strlist) do
    local str = ''
    -- process all the columns but last, because we dont wand extra padding
    -- after last column
    for column=1,#strlist-1 do
      local maxstr = maxlen(strlist[column])
      local padded = pad(strlist[column], maxstr)
      if strlist[column][i] == nil then
        str = str .. string.rep(fillchar, maxstr) .. string.rep(padchar, padding)
      else
        str = str .. padded[i] .. string.rep(padchar, padding)
      end
    end

    -- lets process the last column, no extra padding
    do
      local maxstr = maxlen(strlist[#strlist])
      local padded = pad(strlist[#strlist], maxstr)
      if strlist[#strlist][i] == nil then
        str = str .. string.rep(fillchar, maxlen(strlist[#strlist]))
      else
        str = str .. padded[i]
      end
    end

    -- insert result into output table
    table.insert(values, { type = "text", val = str, opts = opts })
  end

  return values
end

local my_unimpaired = {
  "<leader> = ,",
  "hjkl       left/down/up/right move the cursor",
  "e          move to end of current word",
  "b          move to begin of current word",
  "gg         move to first line",
  "G          move to last line",
  ":<Number>  move to <Number> line",
  "n          next match symbol",
  "<Ctrl-\\>            open or close terminal",
  "<num><Ctrl-\\>    open different terminal ",
  "<leader>q            close opened terminal",
  "<leader>q  exit nvim",
}

local vim_signature = {
  "Telescope            ",
  "<leader>f            find files",
  "<leader>s            find symbol in current cursor", 
  "<leader>g            find symbol using RipGrep", 
  "<leader>b            find files in buffers",
  "<Ctrl-v>             go to file selection as a vsplit",
  "<Ctrl-x>             go to file selection as a split",
  "<Ctrl-j>             next item",
  "<Ctrl-k>             previous item",
  "<Ctrl-u>             scroll up in preview window",
  "<Ctrl-d>             scroll down in preview window",
  "<Esc>                Close Telescope",
}

local my_alts = {
  "NvimTree",
  "<F4>           open nvimtree",
  "a              create new file",
  "d              delete file ",
  "c              copy file",
  "p              paste file",
  "r              rename",
  "s              search",
  "o              open",
}

local fzf_vim = {
  "CTRL-F B        \\\\  Buffers",
  "                //  Current buffer lines filtering",
  "                ??  Buffer lines filtering",
  "                ||  Windows manager",
  "                ''  Registers manager",
  "CTRL-F F            Files",
  "CTRL-F R            RipGrep files from current directory",
  "CTRL-F G            Files in Git repository",
  "CTRL-F M        ``  Marks",
  "CTRL-F H            History",
  "CTRL-F :            Commands history",
  "CTRL-F /            Search history",
  "CTRL-F T            File types",
  "CTRL-F SHIFT-T      Tags with word under cursor",
  "CTRL-F W            List buffer lines with word under cursor",
  "CTRL-F C            Commands",
  "CTRL-F SHIFT-C      Commits",
  "CTRL-F SHIFT-B      Buffer commits",
  "CTRL-F SHIFT-M      Keyboard mappings",
}

local fkeys = {
  "F2                Save file",
  "SHIFT-F2          Save all files",
  "F3                Toggle quickfix list",
  "SHIFT-F3          Toggle location list",
  "F5                Toggle tree-sitter window",
  "F6                Toggle undo tree window",
  "F7                Enable spellchecking engine",
  "F10               Quit",
  "SHIFT-F10         Quit all",
  "CTRL-SHIFT-F10    Quit all (no save)",
  "SHIFT-F7          Enable Vale linter",
  "F11               Toggle tree-sitter highlight floater",
  "SHIFT-F11         Toggle current word dynamic highlighter",
  "CTRL-F11          Enable current word highlight :Quickhl*",
  "F12               Close current buffer (no window close)",
}

local bookmarks = {
"bm         bookmark toggle",
"bi         bookmark annotate",
"bp bn      prev/next bookmark",
"ba         show all bookmarks",
"bc bx      clear (all) bookmark(s)",
"bkk bjj    move bookmark up (down)",
}

local others = {
  "[m ]m          Headers in RST",
  "[p ]p [k ]k    ???",
}


local head = {
    type = "text",
    val = {
      [[███    ██ ███████  ██████  ██    ██ ██ ███    ███]],
      [[████   ██ ██      ██    ██ ██    ██ ██ ████  ████]],
      [[██ ██  ██ █████   ██    ██ ██    ██ ██ ██ ████ ██]],
      [[██  ██ ██ ██      ██    ██  ██  ██  ██ ██  ██  ██]],
      [[██   ████ ███████  ██████    ████   ██ ██      ██]]
    },
    opts = {
        position = "center",
        hl = "Type",
    },
}

local foot = {
    type = "text",
    val = "footer",
    opts = {
        position = "center",
        hl = "Number",
    },
}

local block1 = {
    type = "group",
    val = col({my_unimpaired, vim_signature}, { position = "center", hl = {{"Comment", 0, -1}, { "Title", 92, 97 }, { "Title", 137, 154 }} }),
    opts = {
        spacing = 0
    },
}

local block2 = {
    type = "group",
    val = col({fzf_vim, fkeys}, { position = "center", hl = {{"Comment", 0, -1}, { "Title", 94, 108 }, { "Title", 166, 180 }} }),
    opts = {
        spacing = 0
    },
}

local block3 = {
    type = "group",
    val = col({my_alts, bookmarks, others}, { position = "center", hl = {{"Comment", 0, -1}, { "Title", 89, 100 }, { "Title", 152, 159 }, {"Title", 198, 209}} }),
    opts = {
        spacing = 0
    },
}

local opts = {
    layout = {
        { type = "padding", val = 2 },
        head,
        { type = "padding", val = 2 },
        block1,
        { type = "padding", val = 2 },
        block2,
        { type = "padding", val = 2 },
        block3,
    },
    opts = {
        noautocmd = true,
        margin = 5,
    },
}

alpha.setup(opts)
