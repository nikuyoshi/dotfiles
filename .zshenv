alias ls="ls -v"
export LANG=ja_JP.UTF-8

# Macports
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export MANPATH=/opt/local/share/man:/opt/local/man:$MANPATH

# Vim
alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias mvim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim -g "$@"'

#pkgconfig
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:/usr/lib/pkgconfig

#Omake
export PATH=/usr/local/bin:$PATH

#Java
alias javac='javac -J-Dfile.encoding=UTF-8'
alias java='java -Dfile.encoding=UTF-8'

#MySQL
export PATH=$PATH:/usr/local/mysql/bin
alias mysql=/usr/local/mysql/bin/mysql
alias mysqladmin=/usr/local/mysql/bin/mysqladmin

#Git
PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/usr/local/git/bin/

#PlayFramework
export PATH=$PATH:/usr/local/play-2.1.2/

#gsed
export gsed='/opt/local/bin/gsed'

###sudo
## -x: export SUDO_PATH���ꏏ�ɍs���B
## -T: SUDO_PATH��sudo_path��A������B
typeset -xT SUDO_PATH sudo_path
## �d�������p�X��o�^���Ȃ��B
typeset -U sudo_path
## (N-/): ���݂��Ȃ��f�B���N�g���͓o�^���Ȃ��B
##    �p�X(...): ...�Ƃ��������Ƀ}�b�`����p�X�̂ݎc���B
##            N: NULL_GLOB�I�v�V������ݒ�B
##               glob���}�b�`���Ȃ������葶�݂��Ȃ��p�X�𖳎�����B
##            -: �V���{���b�N�����N��̃p�X��]���B
##            /: �f�B���N�g���̂ݎc���B
sudo_path=({,/usr/pkg,/usr/local,/usr}/sbin(N-/))

#Go
export PATH=$PATH:/usr/local/go/bin
