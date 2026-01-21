import type { Plugin } from "../type.ts";

export const codeCompanionPlugins: Plugin[] = [
  {
    url: "ravitemer/mcphub.nvim",
    profiles: ["neovim"],
    dependencies: [
      "nvim-lua/plenary.nvim",
    ],
    build: async ({ info }) => {
      if (!info.isUpdate || !info.isLoad) {
        return;
      }
      const cmd = new Deno.Command("npm", {
        args: ["install", "-g", "mcp-hub@latest"],
        cwd: info.dst,
      });
      const output = await cmd.output();
      console.log(new TextDecoder().decode(output.stdout));
    },
    cache: {
      after: `lua << EOB
        require("mcphub").setup({
          auto_approve = true,
          extensions = {
            codecompanion = {
              -- Show the mcp tool result in the chat buffer
              show_result_in_chat = false,
              -- Make chat #variables from MCP server resources
              make_vars = true,
              -- Create slash commands for prompts
              make_slash_commands = true,
            }
          }
        })
      EOB`,
    },
  },

  {
    url: "OXY2DEV/markview.nvim",
    profiles: ["neovim"],
    dependencies: ["olimorris/codecompanion.nvim"],
    cache: {
      after: `lua << EOB
        local presets = require("markview.presets");

        require("markview").setup({
          markdown = {
            headings = presets.headings.marker
          },
          preview = {
            filetypes = { "markdown" },
            ignore_buftypes = {},
          },
        });
      EOB`,
    },
  },

  //{
  //  url: "MeanderingProgrammer/render-markdown.nvim",
  //  profiles: ["neovim"],
  //  cache: {
  //    after: `lua << EOB
  //      require('render-markdown').setup({})
  //    EOB`,
  //  },
  //},

  {
    url: "echasnovski/mini.diff",
    profiles: ["neovim"],
    cache: {
      after: `lua << EOB
        local diff = require("mini.diff")
        diff.setup({
          source = diff.gen_source.none(),
        })
      EOB`,
    },
  },

  {
    url: "olimorris/codecompanion.nvim",
    profiles: ["neovim"],
    dependencies: [
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "ravitemer/mcphub.nvim",
      // OPTIONAL
      //"OXY2DEV/markview.nvim",
      "echasnovski/mini.diff",
    ],
    cache: {
      after: `lua << EOB
        --vim.keymap.set('n', '<Leader>ai', ':CodeCompanionActions<CR>', { noremap = true, silent = true })
        vim.keymap.set('n', '<Leader>ai', ':CodeCompanionChat<CR>', { noremap = true, silent = true })

        local function deep_merge(t1, t2)
          local t = {}
          for k, v in pairs(t1) do
            if type(v) == "table" and type(t2[k]) == "table" then
              t[k] = deep_merge(v, t2[k])
            else
              t[k] = v
            end
          end
          for k, v in pairs(t2) do
            if type(v) == "table" and type(t1[k]) == "table" then
              t[k] = deep_merge(t1[k], v)
            else
              t[k] = v
            end
          end
          return t
        end

        local default_config = {
          opts = {
            language = "Japanese",
          },
          strategies = {
            __chat = {
              adapter = "anthropic",
              --model = "claude-sonnet-4-20250514",
              model = "claude-sonnet-4-5-20250929-v1:0",
              keymaps = {
                send = {
                  modes = { n = "<C-s>", i = "<C-s>" }
                },
                close = {
                  modes = { n = "<C-c>", i = "<C-c>" },
                },
              },
              opts = {
                auto_submit_success = true,
              }
            },

            chat = {
              adapter = "copilot",
              --adapter = "acp",
              opts = {
                completion_provider = "coc", -- blink|cmp|coc|default
              },
              keymaps = {
                send = {
                  modes = { n = "<C-s>", i = "<C-s>" }
                },
                close = {
                  modes = { n = "<C-c>", i = "<C-c>" },
                },
              },
              slash_commands = {
                ["file"] = {
                  callback = "strategies.chat.slash_commands.file",
                  description = "Select a file using Telescope",
                  opts = {
                    provider = "telescope",
                    contains_code = true,
                  },
                },
              },
              tools = {
                ["mcp"] = {
                  -- Prevent mcphub from loading before needed
                  callback = function()
                    return require("mcphub.extensions.codecompanion")
                  end,
                  description = "Call tools and resources from the MCP Servers"
                },
                opts = {
                  auto_submit_success = true,
                }
              }
            },
            inline = {
              adapter = "copilot",
            },
            cmd = {
              adapter = "copilot",
            }
          },
          prompt_library = {
            ["docstring"] = {
              strategy = "inline",
              description = "Write documentation for me",
              opts = {
                index = 11,
                is_slash_cmd = false,
                auto_submit = false,
                short_name = "doc",
              },
              prompts = {
                {
                  role = "user",
                  content = "docstringを日本語で追加してください",
                },
              },
            },
          },
        }

        --local ok, private_config = pcall(require, "codecompanion_local")
        --if not ok then
        --  private_config = {}
        --end

        --local config = deep_merge(default_config, private_config)

        require("codecompanion").setup(default_config)
      EOB`,
    },
  },

  {
    url: "atusy/aibou.nvim",
    profiles: ["neovim"],
    dependencies: [
      "olimorris/codecompanion.nvim",
    ],
    cache: {
      after: `lua << EOB
        vim.keymap.set("n", "<leader>aI", function()
          require("aibou.codecompanion").start({
            user_prompt = "ペアプログラミングをしましょう！バッファの差分は都度送ります。あなたはゼノブレイドのノポン人のキャラクターになりきってください。",
          })
        end, { desc = "Start aibou" })
      EOB`,
    },
  },
];
