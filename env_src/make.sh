#!/usr/bin/bash 

export PREFIX=~/Desktop/lua_tool_kit

os_type=macosx
lua_src_path=$PREFIX/env_src/lua-5.2.4/src
luarocks_src_path=$PREFIX/env_src/luarocks
luarocks_root=$PREFIX/$os_type
lua_bin_path=$PREFIX/$os_type
mkdir -p $luarocks_root/bin
mkdir -p $lua_bin_path/bin

# make lua
cd $lua_src_path && make $os_type
cp $lua_src_path/lua $lua_bin_path/bin
cp $lua_src_path/luac $lua_bin_path/bin

echo $luarocks_root

cd $luarocks_src_path
./configure --prefix=$luarocks_root --sysconfdir=$luarocks_root/conf/ --force-config --lua-version=5.2 --with-lua=$lua_bin_path --with-lua-include=$lua_src_path --with-downloader=wget
make build && make install

cd $lua_bin_path/bin
sudo ./luarocks install luafilesystem
sudo ./luarocks install lub
sudo ./luarocks install luasocket
sudo ./luarocks install md5
sudo ./luarocks install xml
sudo ./luarocks install lua-cjson
sudo ./luarocks install busted
sudo ./luarocks install lpeg
sudo ./luarocks install argparse
sudo ./luarocks install lua-gd
