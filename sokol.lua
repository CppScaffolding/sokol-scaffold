-- scaffold geniefile for sokol

sokol_script = path.getabsolute(path.getdirectory(_SCRIPT))
sokol_root = path.join(sokol_script, "sokol")

sokol_includedirs = {
	path.join(sokol_script, "config"),
	sokol_root,
}

sokol_libdirs = {}
sokol_links = {}
sokol_defines = {}

----
return {
	_add_includedirs = function()
		includedirs { sokol_includedirs }
	end,

	_add_defines = function()
		defines { sokol_defines }
	end,

	_add_libdirs = function()
		libdirs { sokol_libdirs }
	end,

	_add_external_links = function()
		links { sokol_links }
	end,

	_add_self_links = function()
		links { "sokol" }
	end,

	_create_projects = function()

project "sokol"
	kind "StaticLib"
	language "C++"
	flags {}

	includedirs {
		sokol_includedirs,
	}

	defines {}

	files {
		path.join(sokol_script, "config", "**.h"),
		path.join(sokol_root, "**.h"),
		path.join(sokol_root, "**.cpp"),
	}

end, -- _create_projects()
}

---
