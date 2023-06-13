local skeld = require("skel-nvim.defaults")

local function cs_namespace_callback(config)
    local currentBuffer = vim.api.nvim_get_current_buf()
    local bufferName = vim.api.nvim_buf_get_name(currentBuffer)
    local filePath = vim.fn.fnamemodify(bufferName, ":p")
    local currentDirectory = vim.fn.fnamemodify(filePath, ":h")
    local namespace = ""

    while true do
        local csprojFiles = vim.fn.glob(currentDirectory .. "/*.csproj", true, true)
        if #csprojFiles > 0 then
            local csprojFileName = vim.fn.fnamemodify(csprojFiles[1], ":t:r")
            namespace = csprojFileName .. "."

            local projectFolderPath = vim.fn.fnamemodify(csprojFiles[1], ":.")
            projectFolderPath = string.gsub(projectFolderPath, "[/\\]" .. csprojFileName .. ".csproj$", "")

            local relativeFilePath = vim.fn.fnamemodify(filePath, ":.")
            relativeFilePath = string.gsub(relativeFilePath, "\\", "/")
            relativeFilePath = string.gsub(relativeFilePath, "^[^/]+/", "")
            relativeFilePath = string.gsub(relativeFilePath, "/[^/]+$", "")

            local fileNamespace = string.gsub(relativeFilePath, "/", ".")
            namespace = namespace .. fileNamespace
            break
        else
            local parentDirectory = vim.fn.fnamemodify(currentDirectory, ":h")
            if parentDirectory == currentDirectory then
                -- Reached root directory, break the loop
                break
            end
            currentDirectory = parentDirectory
        end
    end

    return namespace
end
local function file_name_without_extension()
    local filePath = vim.fn.expand("%:p")
    local fileName = vim.fn.fnamemodify(filePath, ":t:r")
    return fileName
end

require("skel-nvim").setup{
  templates_dir = vim.fn.stdpath("config") .. "/skeleton",

  skel_enabled = true,

  apply_skel_for_empty_file = true,

  mappings = {
    ['*Enum.cs'] = "Enumcs.skel",
    ['I*.cs'] = "Ics.skel",
    ['*.cs'] = "cs.skel"
  },

  substitutions = {
    ['FILENAME']             = file_name_without_extension,
    ['DATE']                 = skeld.get_date,
    ['CS_NAMESPACE']         = cs_namespace_callback
  },
}
