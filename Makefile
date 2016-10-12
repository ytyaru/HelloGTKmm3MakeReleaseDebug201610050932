#-------------------------------------------------------------------------------
# 変数"buildtype"の値を"release"か"debug"にすることで切り替える。
#-------------------------------------------------------------------------------
#---------------------------------------
# 変数
#---------------------------------------
libs =
CompileOption = `pkg-config gtkmm-3.0 --cflags --libs` -mwindows -Wall -std=c++11
DirSrc = ./src
DirLib = ./lib
include = -I./include

sources = $(wildcard $(DirSrc)/*.cc)
objects = $(addprefix $(DirObj)/, $(notdir $(sources:.cc=.o)))
depends = $(objects:.o=.d)

#---------------------------------------
# ビルド release/debug切替
#---------------------------------------
buildtype := release
#buildtype := debug
ifeq ($(buildtype),release)
	CompileOption += -s -O3
else ifeq ($(buildtype),debug)
	CompileOption += -O0 -g
else
	$(error buildtype must be release, debug, profile or coverage)
endif
DirBin := ./Build/$(buildtype)
DirObj = ./Build/$(buildtype)/obj
exe := $(DirBin)/program.exe
objects = $(addprefix $(DirObj)/, $(notdir $(sources:.cc=.o)))
depends = $(objects:.o=.d)

#---------------------------------------
# ビルド実行
#---------------------------------------
$(exe): $(objects) $(libs)
	-mkdir -p $(DirBin)
	g++ -o $(exe) $(objects) $(CompileOption)

$(DirObj)/%.o: $(DirSrc)/%.cc
	-mkdir -p $(DirObj)
	g++ -o $@ -c $< $(include) $(CompileOption) 

#---------------------------------------
# 削除
#---------------------------------------
.PHONY : all
all:
	clean $(exe)

.PHONY : clean
clean :
	-rm $(exe) $(objects)

-include $(DEPENDS)
