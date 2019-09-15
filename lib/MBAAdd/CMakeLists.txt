message("LLVM_ENABLE_PLUGINS: ${LLVM_ENABLE_PLUGINS}")
message("ARG_PLUGIN_TOOL: ${ARG_PLUGIN_TOOL}")
message("LLVM_EXPORT_SYMBOLS_FOR_PLUGINS: ${LLVM_EXPORT_SYMBOLS_FOR_PLUGINS}")

add_llvm_library(MBAAdd MODULE MBAAdd.cpp Ratio.cpp PLUGIN_TOOL opt)
target_link_libraries(MBAAdd
  "$<$<PLATFORM_ID:Darwin>:-undefined dynamic_lookup>")
