message("LLVM_ENABLE_PLUGINS: ${LLVM_ENABLE_PLUGINS}")
message("ARG_PLUGIN_TOOL: ${ARG_PLUGIN_TOOL}")
message("LLVM_EXPORT_SYMBOLS_FOR_PLUGINS: ${LLVM_EXPORT_SYMBOLS_FOR_PLUGINS}")

add_llvm_library(StaticCallCounter MODULE StaticCallCounter.cpp PLUGIN_TOOL opt)
add_llvm_library(DynamicCallCounter MODULE DynamicCallCounter.cpp PLUGIN_TOOL opt)
add_library(DynamicCallCounterStatic STATIC DynamicCallCounter.cpp)

add_llvm_library(MBAAdd MODULE MBAAdd.cpp Ratio.cpp PLUGIN_TOOL opt)
add_llvm_library(MBASub MODULE MBASub.cpp Ratio.cpp PLUGIN_TOOL opt)
add_llvm_library(RIV MODULE RIV.cpp PLUGIN_TOOL opt)
add_llvm_library(DuplicateBB MODULE DuplicateBB.cpp Ratio.cpp PLUGIN_TOOL opt)

# On Darwin (unlike on Linux), undefined symbols in shared objects are not
# allowed at the end of the link-edit. The plugins defined here:
#  - _are_ shared objects
#  - reference symbols from LLVM shared libraries, i.e. symbols which are
#    undefined until those shared objects are loaded in memory (and hence
#    _undefined_ during static linking)
# The build will fail with errors like this:
#    "Undefined symbols for architecture x86_64"
# with various LLVM symbols being undefined. Since those symbols are later
# loaded and resolved at runtime, these errors are false positives.
# This behaviour can be modified via the '-undefined' OS X linker flag as
# follows.
target_link_libraries(StaticCallCounter
  "$<$<PLATFORM_ID:Darwin>:-undefined dynamic_lookup>")
target_link_libraries(DynamicCallCounter
  "$<$<PLATFORM_ID:Darwin>:-undefined dynamic_lookup>")
target_link_libraries(MBAAdd
  "$<$<PLATFORM_ID:Darwin>:-undefined dynamic_lookup>")
target_link_libraries(MBASub
  "$<$<PLATFORM_ID:Darwin>:-undefined dynamic_lookup>")
target_link_libraries(RIV
  "$<$<PLATFORM_ID:Darwin>:-undefined dynamic_lookup>")
target_link_libraries(DuplicateBB
  "$<$<PLATFORM_ID:Darwin>:-undefined dynamic_lookup>")

# This LT_RUNTIME_LIB used by lt-cc-main.cpp
# FIXME Create a better name for this
add_library(lt-cc-rt DynamicCallCounterRT.cpp)
