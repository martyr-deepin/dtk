# deepin-tool-kit

## 项目历史

deepin-tool-kit 项目原本是作为 DTK 项目的代码管理仓库用的，但是后来鉴于对 DTK 分模块管理的期望，将 DTK 分拆成了 [dtkwidget](https://github.com/linuxdeepin/dtkwidget)、[dtkcore](https://github.com/linuxdeepin/dtkcore) 和 [dtkwm](https://github.com/linuxdeepin/dtkwm) 三个子项目进行开发。在推进 DTK 文档的过程中，发现刚好可以使用这个项目作为为 DTK 文档生成、管理工具，所以演变成了现在的样子。



## 项目使用

正常使用此项目生成文档只需要修改 `dtkwidget`、` dtkcore` 和`dtkwm` 三个子模块的版本，然后运行`make` 即可。运行 `make` 默认会生成 html 和 qch 两种类型的文档，由于希望生成的 html 文档可以部署到 [deepin 文档中心](https://docs.deepin.io) ，用户点击文档中的 Qt 相关类时可以跳转到 Qt 在线文档；而生成的 qch 文档在 QtCreator 中使用的时候，用户点击文档中的 Qt 相关类可以跳转到 QtCreator 的离线文档，所以在构建 qch 文档的时候会复制Doxyfile 为 Doxyfile.qhp ，并进行一些配置的修改（主要是 TAG_FILES 项的修改，详情看 [Makefile](./Makefile)）。



## 其他工具

| 文件                   | 描述                      |
| ---------------------- | ------------------------- |
| tool/sync_latest.bash  | 同步几个子模块到最新的tag |
| tool/auto_release.bash | 未知                      |

