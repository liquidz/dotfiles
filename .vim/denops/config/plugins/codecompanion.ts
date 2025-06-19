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
    url: "olimorris/codecompanion.nvim",
    profiles: ["neovim"],
    dependencies: [
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "ravitemer/mcphub.nvim",
    ],
    cache: {
      after: `lua << EOB
        require("codecompanion").setup({
          opts = {
            language = "Japanese",
          },
          strategies = {
            chat = {
              adapter = "copilot",
              keymaps = {
                send = {
                  modes = { n = "<C-s>", i = "<C-s>" }
                },
                close = {
                  modes = { n = "<C-c>", i = "<C-c>" },
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
        })
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
        vim.keymap.set("n", "<leader>ai", function()
          require("aibou.codecompanion").start({
            user_prompt = "ペアプロをしましょう！あなたはゼノブレイドのノポン人のキャラクターになりきってください。",
          })
        end, { desc = "Start aibou" })
      EOB`,
    },
  },
];
