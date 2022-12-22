#pragma once

namespace swiftwinrt
{
    static void write_root_cmake(std::map<std::string, std::vector<std::string_view>>& namespaces, settings_type const& settings)
    {
        writer w;
        auto filename{ w.root_directory() };
        filename += "CMakeLists.txt";
        if (!settings.has_project_type(project_type::cmake))
        {
            std::filesystem::remove(filename);
            return;
        }
        w.write("add_subdirectory(CWinRT)\n");
        for (auto&& [module, _] : namespaces)
        {
            w.write("add_subdirectory(%)\n", module);
        }   

        w.flush_to_file(filename);
    }

    static void write_cmake_lists(std::string_view const& module, std::set<std::string> const& depends, std::vector<std::string_view> const& namespaces)
    {
        writer w;
        w.type_namespace = module;
        auto filename{ w.project_directory() };
        filename += "CMakeLists.txt";

        if (!settings.has_project_type(project_type::cmake))
        {
            std::filesystem::remove(filename);
            return;
        }
        auto content = R"(
set(GENERATED_FILES_DIR ${CMAKE_CURRENT_SOURCE_DIR})
set(SWIFTWINRT_GENERATED_FILES
%)
%
add_library(% SHARED
  ${SWIFTWINRT_GENERATED_FILES}%
  )

install(TARGETS %
  ARCHIVE DESTINATION lib
  LIBRARY DESTINATION lib
  RUNTIME DESTINATION bin
  COMPONENT lib)

target_link_libraries(% PRIVATE
  %
  %)

target_include_directories(%
  INTERFACE ${CMAKE_CURRENT_SOURCE_DIR}
  PRIVATE ${CMAKE_CURRENT_BINARY_DIR})

target_include_directories(%
  INTERFACE ${CMAKE_CURRENT_SOURCE_DIR}
  PRIVATE ${GENERATED_FILES_DIR})

)";
        w.write(content,
            bind_each([&](writer& w, const std::string_view ns) {
                w.write("  %.swift\n", ns);
                w.write("  %+ABI.swift\n", ns);
                w.write("  %+Impl.swift\n", ns);
                }, namespaces),
            settings.support == module ? "file(GLOB SUPPORT_FILES ${GENERATED_FILES_DIR}/Support/*)" : "",
            module,
            settings.support == module ? "\n  ${SUPPORT_FILES}" : "",

            module,
            module,
            w.c_mod,
            bind_list("\n  ", depends),
            module,
            module);
        w.save_cmake();
    }

    // Write a package.swift file which includes the full enclosure of Swift modules being generated (including CWinRT) which are generated
    // by the project. This is useful for our test project, which just creates a single module.
    static void write_multimodule_package_swift(std::map<std::string, std::set<std::string>>& module_dependencies, settings_type const& settings)
    {
        writer w;
        auto filename{ w.root_directory() };
        filename += "Package.swift";
        if (!settings.has_project_type(project_type::spm))
        {
            std::filesystem::remove(filename);
            return;
        }

        auto exclude_cmake = settings.has_project_type(project_type::cmake) ? R"(,
      exclude: [ "CMakeLists.txt" ])" : "";
        auto package = R"(// swift-tools-version: 5.7

// WARNING: Generated by a tool. Do not hand-edit!

import PackageDescription

let package = Package(
  name: "WinRT",
  products: [
%
  ],
  targets: [
    .target(
       name: "CWinRT"%
    ),
%
  ]
)
)";


        w.write(package,
            bind([&](writer& w) {
                separator s{ w, "\n" };
        for (auto&& [module, _] : module_dependencies)
        {
            s();
            w.write(R"(    .library(name: "%", type: .dynamic, targets: ["%"]),)", module, module);
        }}),
            exclude_cmake,
            bind([&](writer& w) {
            for (auto [module, dependencies] : module_dependencies)
            {
                w.write(R"(    .target(
      name: "%",
      dependencies: [
        "CWinRT",
%
      ],
      path: "swift/%"%
    ),
)", module, bind([&](writer& w) {
                        separator s{ w, "\n" };
                for (auto&& ns : dependencies)
                {
                    s();
                    w.write(R"(      "%",)", ns);

                }}),
                    module);
            }}
        ), exclude_cmake);

        w.flush_to_file(filename);
    }

    static void write_singlemodule_package_swift(std::string_view const& module, std::set<std::string> const& depends)
    {
        writer w;
        w.type_namespace = module;
        auto filename{ w.project_directory() };
        filename += "Package.swift";
        if (!settings.has_project_type(project_type::spm))
        {
            std::filesystem::remove(filename);
            return;
        }

        auto exclude_cmake = settings.has_project_type(project_type::cmake) ? R"(,
      exclude: [ "CMakeLists.txt" ])" : "";
        auto package = R"(// swift-tools-version: 5.7

// WARNING: Generated by a tool. Do not hand-edit!

import PackageDescription

let package = Package(
  name: "%",
  products: [ 
    .library(name: "%", type: .dynamic, targets: ["%"])
  ],
  dependencies: [
    .package(path: "../CWinRT"),%
  ],
  targets: [
    .target(
       name: "%",
       dependencies: [
         "CWinRT",%
       ],
       path: "."%
    )
  ]
)
)";


        w.write(package,
            module,
            module, module,
            bind([&](writer& w) {
        for (auto&& module : depends)
        {
            w.write(R"(
    .package(path: "../%"),)", module);
        }}),
            module,
            bind([&](writer& w) {
            for (auto module : depends)
            {
                w.write(R"(
         "%",)", module);
            }}
        ), exclude_cmake);
      
        w.flush_to_file(filename);
    }
}
