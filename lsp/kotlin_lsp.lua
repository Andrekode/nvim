---@brief
---
--- https://github.com/Kotlin/kotlin-lsp
---
--- JetBrains' official Kotlin language server, built on the IntelliJ IDEA
--- Kotlin plugin. Installed via mason as `kotlin-lsp`, which exposes the
--- native launcher as `intellij-server` (bundles its own JBR).
---
--- Still alpha: needs a real Gradle/Maven project root, so single-file
--- buffers are unsupported. KMP projects are not handled yet.
---

---@type vim.lsp.Config
return {
	cmd = { "intellij-server", "--stdio" },
	filetypes = { "kotlin" },
	root_markers = {
		"settings.gradle",
		"settings.gradle.kts",
		"pom.xml",
		"build.gradle",
		"build.gradle.kts",
		"workspace.json",
	},
	single_file_support = false,
}
