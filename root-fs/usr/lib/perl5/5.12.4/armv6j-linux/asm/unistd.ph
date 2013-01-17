require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&__ASM_ARM_UNISTD_H)) {
    eval 'sub __ASM_ARM_UNISTD_H () {1;}' unless defined(&__ASM_ARM_UNISTD_H);
    eval 'sub __NR_OABI_SYSCALL_BASE () {0x900000;}' unless defined(&__NR_OABI_SYSCALL_BASE);
    if(defined(&__thumb__) || defined(&__ARM_EABI__)) {
	eval 'sub __NR_SYSCALL_BASE () {0;}' unless defined(&__NR_SYSCALL_BASE);
    } else {
	eval 'sub __NR_SYSCALL_BASE () { &__NR_OABI_SYSCALL_BASE;}' unless defined(&__NR_SYSCALL_BASE);
    }
    eval 'sub __NR_restart_syscall () {( &__NR_SYSCALL_BASE+ 0);}' unless defined(&__NR_restart_syscall);
    eval 'sub __NR_exit () {( &__NR_SYSCALL_BASE+ 1);}' unless defined(&__NR_exit);
    eval 'sub __NR_fork () {( &__NR_SYSCALL_BASE+ 2);}' unless defined(&__NR_fork);
    eval 'sub __NR_read () {( &__NR_SYSCALL_BASE+ 3);}' unless defined(&__NR_read);
    eval 'sub __NR_write () {( &__NR_SYSCALL_BASE+ 4);}' unless defined(&__NR_write);
    eval 'sub __NR_open () {( &__NR_SYSCALL_BASE+ 5);}' unless defined(&__NR_open);
    eval 'sub __NR_close () {( &__NR_SYSCALL_BASE+ 6);}' unless defined(&__NR_close);
    eval 'sub __NR_creat () {( &__NR_SYSCALL_BASE+ 8);}' unless defined(&__NR_creat);
    eval 'sub __NR_link () {( &__NR_SYSCALL_BASE+ 9);}' unless defined(&__NR_link);
    eval 'sub __NR_unlink () {( &__NR_SYSCALL_BASE+ 10);}' unless defined(&__NR_unlink);
    eval 'sub __NR_execve () {( &__NR_SYSCALL_BASE+ 11);}' unless defined(&__NR_execve);
    eval 'sub __NR_chdir () {( &__NR_SYSCALL_BASE+ 12);}' unless defined(&__NR_chdir);
    eval 'sub __NR_time () {( &__NR_SYSCALL_BASE+ 13);}' unless defined(&__NR_time);
    eval 'sub __NR_mknod () {( &__NR_SYSCALL_BASE+ 14);}' unless defined(&__NR_mknod);
    eval 'sub __NR_chmod () {( &__NR_SYSCALL_BASE+ 15);}' unless defined(&__NR_chmod);
    eval 'sub __NR_lchown () {( &__NR_SYSCALL_BASE+ 16);}' unless defined(&__NR_lchown);
    eval 'sub __NR_lseek () {( &__NR_SYSCALL_BASE+ 19);}' unless defined(&__NR_lseek);
    eval 'sub __NR_getpid () {( &__NR_SYSCALL_BASE+ 20);}' unless defined(&__NR_getpid);
    eval 'sub __NR_mount () {( &__NR_SYSCALL_BASE+ 21);}' unless defined(&__NR_mount);
    eval 'sub __NR_umount () {( &__NR_SYSCALL_BASE+ 22);}' unless defined(&__NR_umount);
    eval 'sub __NR_setuid () {( &__NR_SYSCALL_BASE+ 23);}' unless defined(&__NR_setuid);
    eval 'sub __NR_getuid () {( &__NR_SYSCALL_BASE+ 24);}' unless defined(&__NR_getuid);
    eval 'sub __NR_stime () {( &__NR_SYSCALL_BASE+ 25);}' unless defined(&__NR_stime);
    eval 'sub __NR_ptrace () {( &__NR_SYSCALL_BASE+ 26);}' unless defined(&__NR_ptrace);
    eval 'sub __NR_alarm () {( &__NR_SYSCALL_BASE+ 27);}' unless defined(&__NR_alarm);
    eval 'sub __NR_pause () {( &__NR_SYSCALL_BASE+ 29);}' unless defined(&__NR_pause);
    eval 'sub __NR_utime () {( &__NR_SYSCALL_BASE+ 30);}' unless defined(&__NR_utime);
    eval 'sub __NR_access () {( &__NR_SYSCALL_BASE+ 33);}' unless defined(&__NR_access);
    eval 'sub __NR_nice () {( &__NR_SYSCALL_BASE+ 34);}' unless defined(&__NR_nice);
    eval 'sub __NR_sync () {( &__NR_SYSCALL_BASE+ 36);}' unless defined(&__NR_sync);
    eval 'sub __NR_kill () {( &__NR_SYSCALL_BASE+ 37);}' unless defined(&__NR_kill);
    eval 'sub __NR_rename () {( &__NR_SYSCALL_BASE+ 38);}' unless defined(&__NR_rename);
    eval 'sub __NR_mkdir () {( &__NR_SYSCALL_BASE+ 39);}' unless defined(&__NR_mkdir);
    eval 'sub __NR_rmdir () {( &__NR_SYSCALL_BASE+ 40);}' unless defined(&__NR_rmdir);
    eval 'sub __NR_dup () {( &__NR_SYSCALL_BASE+ 41);}' unless defined(&__NR_dup);
    eval 'sub __NR_pipe () {( &__NR_SYSCALL_BASE+ 42);}' unless defined(&__NR_pipe);
    eval 'sub __NR_times () {( &__NR_SYSCALL_BASE+ 43);}' unless defined(&__NR_times);
    eval 'sub __NR_brk () {( &__NR_SYSCALL_BASE+ 45);}' unless defined(&__NR_brk);
    eval 'sub __NR_setgid () {( &__NR_SYSCALL_BASE+ 46);}' unless defined(&__NR_setgid);
    eval 'sub __NR_getgid () {( &__NR_SYSCALL_BASE+ 47);}' unless defined(&__NR_getgid);
    eval 'sub __NR_geteuid () {( &__NR_SYSCALL_BASE+ 49);}' unless defined(&__NR_geteuid);
    eval 'sub __NR_getegid () {( &__NR_SYSCALL_BASE+ 50);}' unless defined(&__NR_getegid);
    eval 'sub __NR_acct () {( &__NR_SYSCALL_BASE+ 51);}' unless defined(&__NR_acct);
    eval 'sub __NR_umount2 () {( &__NR_SYSCALL_BASE+ 52);}' unless defined(&__NR_umount2);
    eval 'sub __NR_ioctl () {( &__NR_SYSCALL_BASE+ 54);}' unless defined(&__NR_ioctl);
    eval 'sub __NR_fcntl () {( &__NR_SYSCALL_BASE+ 55);}' unless defined(&__NR_fcntl);
    eval 'sub __NR_setpgid () {( &__NR_SYSCALL_BASE+ 57);}' unless defined(&__NR_setpgid);
    eval 'sub __NR_umask () {( &__NR_SYSCALL_BASE+ 60);}' unless defined(&__NR_umask);
    eval 'sub __NR_chroot () {( &__NR_SYSCALL_BASE+ 61);}' unless defined(&__NR_chroot);
    eval 'sub __NR_ustat () {( &__NR_SYSCALL_BASE+ 62);}' unless defined(&__NR_ustat);
    eval 'sub __NR_dup2 () {( &__NR_SYSCALL_BASE+ 63);}' unless defined(&__NR_dup2);
    eval 'sub __NR_getppid () {( &__NR_SYSCALL_BASE+ 64);}' unless defined(&__NR_getppid);
    eval 'sub __NR_getpgrp () {( &__NR_SYSCALL_BASE+ 65);}' unless defined(&__NR_getpgrp);
    eval 'sub __NR_setsid () {( &__NR_SYSCALL_BASE+ 66);}' unless defined(&__NR_setsid);
    eval 'sub __NR_sigaction () {( &__NR_SYSCALL_BASE+ 67);}' unless defined(&__NR_sigaction);
    eval 'sub __NR_setreuid () {( &__NR_SYSCALL_BASE+ 70);}' unless defined(&__NR_setreuid);
    eval 'sub __NR_setregid () {( &__NR_SYSCALL_BASE+ 71);}' unless defined(&__NR_setregid);
    eval 'sub __NR_sigsuspend () {( &__NR_SYSCALL_BASE+ 72);}' unless defined(&__NR_sigsuspend);
    eval 'sub __NR_sigpending () {( &__NR_SYSCALL_BASE+ 73);}' unless defined(&__NR_sigpending);
    eval 'sub __NR_sethostname () {( &__NR_SYSCALL_BASE+ 74);}' unless defined(&__NR_sethostname);
    eval 'sub __NR_setrlimit () {( &__NR_SYSCALL_BASE+ 75);}' unless defined(&__NR_setrlimit);
    eval 'sub __NR_getrlimit () {( &__NR_SYSCALL_BASE+ 76);}' unless defined(&__NR_getrlimit);
    eval 'sub __NR_getrusage () {( &__NR_SYSCALL_BASE+ 77);}' unless defined(&__NR_getrusage);
    eval 'sub __NR_gettimeofday () {( &__NR_SYSCALL_BASE+ 78);}' unless defined(&__NR_gettimeofday);
    eval 'sub __NR_settimeofday () {( &__NR_SYSCALL_BASE+ 79);}' unless defined(&__NR_settimeofday);
    eval 'sub __NR_getgroups () {( &__NR_SYSCALL_BASE+ 80);}' unless defined(&__NR_getgroups);
    eval 'sub __NR_setgroups () {( &__NR_SYSCALL_BASE+ 81);}' unless defined(&__NR_setgroups);
    eval 'sub __NR_select () {( &__NR_SYSCALL_BASE+ 82);}' unless defined(&__NR_select);
    eval 'sub __NR_symlink () {( &__NR_SYSCALL_BASE+ 83);}' unless defined(&__NR_symlink);
    eval 'sub __NR_readlink () {( &__NR_SYSCALL_BASE+ 85);}' unless defined(&__NR_readlink);
    eval 'sub __NR_uselib () {( &__NR_SYSCALL_BASE+ 86);}' unless defined(&__NR_uselib);
    eval 'sub __NR_swapon () {( &__NR_SYSCALL_BASE+ 87);}' unless defined(&__NR_swapon);
    eval 'sub __NR_reboot () {( &__NR_SYSCALL_BASE+ 88);}' unless defined(&__NR_reboot);
    eval 'sub __NR_readdir () {( &__NR_SYSCALL_BASE+ 89);}' unless defined(&__NR_readdir);
    eval 'sub __NR_mmap () {( &__NR_SYSCALL_BASE+ 90);}' unless defined(&__NR_mmap);
    eval 'sub __NR_munmap () {( &__NR_SYSCALL_BASE+ 91);}' unless defined(&__NR_munmap);
    eval 'sub __NR_truncate () {( &__NR_SYSCALL_BASE+ 92);}' unless defined(&__NR_truncate);
    eval 'sub __NR_ftruncate () {( &__NR_SYSCALL_BASE+ 93);}' unless defined(&__NR_ftruncate);
    eval 'sub __NR_fchmod () {( &__NR_SYSCALL_BASE+ 94);}' unless defined(&__NR_fchmod);
    eval 'sub __NR_fchown () {( &__NR_SYSCALL_BASE+ 95);}' unless defined(&__NR_fchown);
    eval 'sub __NR_getpriority () {( &__NR_SYSCALL_BASE+ 96);}' unless defined(&__NR_getpriority);
    eval 'sub __NR_setpriority () {( &__NR_SYSCALL_BASE+ 97);}' unless defined(&__NR_setpriority);
    eval 'sub __NR_statfs () {( &__NR_SYSCALL_BASE+ 99);}' unless defined(&__NR_statfs);
    eval 'sub __NR_fstatfs () {( &__NR_SYSCALL_BASE+100);}' unless defined(&__NR_fstatfs);
    eval 'sub __NR_socketcall () {( &__NR_SYSCALL_BASE+102);}' unless defined(&__NR_socketcall);
    eval 'sub __NR_syslog () {( &__NR_SYSCALL_BASE+103);}' unless defined(&__NR_syslog);
    eval 'sub __NR_setitimer () {( &__NR_SYSCALL_BASE+104);}' unless defined(&__NR_setitimer);
    eval 'sub __NR_getitimer () {( &__NR_SYSCALL_BASE+105);}' unless defined(&__NR_getitimer);
    eval 'sub __NR_stat () {( &__NR_SYSCALL_BASE+106);}' unless defined(&__NR_stat);
    eval 'sub __NR_lstat () {( &__NR_SYSCALL_BASE+107);}' unless defined(&__NR_lstat);
    eval 'sub __NR_fstat () {( &__NR_SYSCALL_BASE+108);}' unless defined(&__NR_fstat);
    eval 'sub __NR_vhangup () {( &__NR_SYSCALL_BASE+111);}' unless defined(&__NR_vhangup);
    eval 'sub __NR_syscall () {( &__NR_SYSCALL_BASE+113);}' unless defined(&__NR_syscall);
    eval 'sub __NR_wait4 () {( &__NR_SYSCALL_BASE+114);}' unless defined(&__NR_wait4);
    eval 'sub __NR_swapoff () {( &__NR_SYSCALL_BASE+115);}' unless defined(&__NR_swapoff);
    eval 'sub __NR_sysinfo () {( &__NR_SYSCALL_BASE+116);}' unless defined(&__NR_sysinfo);
    eval 'sub __NR_ipc () {( &__NR_SYSCALL_BASE+117);}' unless defined(&__NR_ipc);
    eval 'sub __NR_fsync () {( &__NR_SYSCALL_BASE+118);}' unless defined(&__NR_fsync);
    eval 'sub __NR_sigreturn () {( &__NR_SYSCALL_BASE+119);}' unless defined(&__NR_sigreturn);
    eval 'sub __NR_clone () {( &__NR_SYSCALL_BASE+120);}' unless defined(&__NR_clone);
    eval 'sub __NR_setdomainname () {( &__NR_SYSCALL_BASE+121);}' unless defined(&__NR_setdomainname);
    eval 'sub __NR_uname () {( &__NR_SYSCALL_BASE+122);}' unless defined(&__NR_uname);
    eval 'sub __NR_adjtimex () {( &__NR_SYSCALL_BASE+124);}' unless defined(&__NR_adjtimex);
    eval 'sub __NR_mprotect () {( &__NR_SYSCALL_BASE+125);}' unless defined(&__NR_mprotect);
    eval 'sub __NR_sigprocmask () {( &__NR_SYSCALL_BASE+126);}' unless defined(&__NR_sigprocmask);
    eval 'sub __NR_init_module () {( &__NR_SYSCALL_BASE+128);}' unless defined(&__NR_init_module);
    eval 'sub __NR_delete_module () {( &__NR_SYSCALL_BASE+129);}' unless defined(&__NR_delete_module);
    eval 'sub __NR_quotactl () {( &__NR_SYSCALL_BASE+131);}' unless defined(&__NR_quotactl);
    eval 'sub __NR_getpgid () {( &__NR_SYSCALL_BASE+132);}' unless defined(&__NR_getpgid);
    eval 'sub __NR_fchdir () {( &__NR_SYSCALL_BASE+133);}' unless defined(&__NR_fchdir);
    eval 'sub __NR_bdflush () {( &__NR_SYSCALL_BASE+134);}' unless defined(&__NR_bdflush);
    eval 'sub __NR_sysfs () {( &__NR_SYSCALL_BASE+135);}' unless defined(&__NR_sysfs);
    eval 'sub __NR_personality () {( &__NR_SYSCALL_BASE+136);}' unless defined(&__NR_personality);
    eval 'sub __NR_setfsuid () {( &__NR_SYSCALL_BASE+138);}' unless defined(&__NR_setfsuid);
    eval 'sub __NR_setfsgid () {( &__NR_SYSCALL_BASE+139);}' unless defined(&__NR_setfsgid);
    eval 'sub __NR__llseek () {( &__NR_SYSCALL_BASE+140);}' unless defined(&__NR__llseek);
    eval 'sub __NR_getdents () {( &__NR_SYSCALL_BASE+141);}' unless defined(&__NR_getdents);
    eval 'sub __NR__newselect () {( &__NR_SYSCALL_BASE+142);}' unless defined(&__NR__newselect);
    eval 'sub __NR_flock () {( &__NR_SYSCALL_BASE+143);}' unless defined(&__NR_flock);
    eval 'sub __NR_msync () {( &__NR_SYSCALL_BASE+144);}' unless defined(&__NR_msync);
    eval 'sub __NR_readv () {( &__NR_SYSCALL_BASE+145);}' unless defined(&__NR_readv);
    eval 'sub __NR_writev () {( &__NR_SYSCALL_BASE+146);}' unless defined(&__NR_writev);
    eval 'sub __NR_getsid () {( &__NR_SYSCALL_BASE+147);}' unless defined(&__NR_getsid);
    eval 'sub __NR_fdatasync () {( &__NR_SYSCALL_BASE+148);}' unless defined(&__NR_fdatasync);
    eval 'sub __NR__sysctl () {( &__NR_SYSCALL_BASE+149);}' unless defined(&__NR__sysctl);
    eval 'sub __NR_mlock () {( &__NR_SYSCALL_BASE+150);}' unless defined(&__NR_mlock);
    eval 'sub __NR_munlock () {( &__NR_SYSCALL_BASE+151);}' unless defined(&__NR_munlock);
    eval 'sub __NR_mlockall () {( &__NR_SYSCALL_BASE+152);}' unless defined(&__NR_mlockall);
    eval 'sub __NR_munlockall () {( &__NR_SYSCALL_BASE+153);}' unless defined(&__NR_munlockall);
    eval 'sub __NR_sched_setparam () {( &__NR_SYSCALL_BASE+154);}' unless defined(&__NR_sched_setparam);
    eval 'sub __NR_sched_getparam () {( &__NR_SYSCALL_BASE+155);}' unless defined(&__NR_sched_getparam);
    eval 'sub __NR_sched_setscheduler () {( &__NR_SYSCALL_BASE+156);}' unless defined(&__NR_sched_setscheduler);
    eval 'sub __NR_sched_getscheduler () {( &__NR_SYSCALL_BASE+157);}' unless defined(&__NR_sched_getscheduler);
    eval 'sub __NR_sched_yield () {( &__NR_SYSCALL_BASE+158);}' unless defined(&__NR_sched_yield);
    eval 'sub __NR_sched_get_priority_max () {( &__NR_SYSCALL_BASE+159);}' unless defined(&__NR_sched_get_priority_max);
    eval 'sub __NR_sched_get_priority_min () {( &__NR_SYSCALL_BASE+160);}' unless defined(&__NR_sched_get_priority_min);
    eval 'sub __NR_sched_rr_get_interval () {( &__NR_SYSCALL_BASE+161);}' unless defined(&__NR_sched_rr_get_interval);
    eval 'sub __NR_nanosleep () {( &__NR_SYSCALL_BASE+162);}' unless defined(&__NR_nanosleep);
    eval 'sub __NR_mremap () {( &__NR_SYSCALL_BASE+163);}' unless defined(&__NR_mremap);
    eval 'sub __NR_setresuid () {( &__NR_SYSCALL_BASE+164);}' unless defined(&__NR_setresuid);
    eval 'sub __NR_getresuid () {( &__NR_SYSCALL_BASE+165);}' unless defined(&__NR_getresuid);
    eval 'sub __NR_poll () {( &__NR_SYSCALL_BASE+168);}' unless defined(&__NR_poll);
    eval 'sub __NR_nfsservctl () {( &__NR_SYSCALL_BASE+169);}' unless defined(&__NR_nfsservctl);
    eval 'sub __NR_setresgid () {( &__NR_SYSCALL_BASE+170);}' unless defined(&__NR_setresgid);
    eval 'sub __NR_getresgid () {( &__NR_SYSCALL_BASE+171);}' unless defined(&__NR_getresgid);
    eval 'sub __NR_prctl () {( &__NR_SYSCALL_BASE+172);}' unless defined(&__NR_prctl);
    eval 'sub __NR_rt_sigreturn () {( &__NR_SYSCALL_BASE+173);}' unless defined(&__NR_rt_sigreturn);
    eval 'sub __NR_rt_sigaction () {( &__NR_SYSCALL_BASE+174);}' unless defined(&__NR_rt_sigaction);
    eval 'sub __NR_rt_sigprocmask () {( &__NR_SYSCALL_BASE+175);}' unless defined(&__NR_rt_sigprocmask);
    eval 'sub __NR_rt_sigpending () {( &__NR_SYSCALL_BASE+176);}' unless defined(&__NR_rt_sigpending);
    eval 'sub __NR_rt_sigtimedwait () {( &__NR_SYSCALL_BASE+177);}' unless defined(&__NR_rt_sigtimedwait);
    eval 'sub __NR_rt_sigqueueinfo () {( &__NR_SYSCALL_BASE+178);}' unless defined(&__NR_rt_sigqueueinfo);
    eval 'sub __NR_rt_sigsuspend () {( &__NR_SYSCALL_BASE+179);}' unless defined(&__NR_rt_sigsuspend);
    eval 'sub __NR_pread64 () {( &__NR_SYSCALL_BASE+180);}' unless defined(&__NR_pread64);
    eval 'sub __NR_pwrite64 () {( &__NR_SYSCALL_BASE+181);}' unless defined(&__NR_pwrite64);
    eval 'sub __NR_chown () {( &__NR_SYSCALL_BASE+182);}' unless defined(&__NR_chown);
    eval 'sub __NR_getcwd () {( &__NR_SYSCALL_BASE+183);}' unless defined(&__NR_getcwd);
    eval 'sub __NR_capget () {( &__NR_SYSCALL_BASE+184);}' unless defined(&__NR_capget);
    eval 'sub __NR_capset () {( &__NR_SYSCALL_BASE+185);}' unless defined(&__NR_capset);
    eval 'sub __NR_sigaltstack () {( &__NR_SYSCALL_BASE+186);}' unless defined(&__NR_sigaltstack);
    eval 'sub __NR_sendfile () {( &__NR_SYSCALL_BASE+187);}' unless defined(&__NR_sendfile);
    eval 'sub __NR_vfork () {( &__NR_SYSCALL_BASE+190);}' unless defined(&__NR_vfork);
    eval 'sub __NR_ugetrlimit () {( &__NR_SYSCALL_BASE+191);}' unless defined(&__NR_ugetrlimit);
    eval 'sub __NR_mmap2 () {( &__NR_SYSCALL_BASE+192);}' unless defined(&__NR_mmap2);
    eval 'sub __NR_truncate64 () {( &__NR_SYSCALL_BASE+193);}' unless defined(&__NR_truncate64);
    eval 'sub __NR_ftruncate64 () {( &__NR_SYSCALL_BASE+194);}' unless defined(&__NR_ftruncate64);
    eval 'sub __NR_stat64 () {( &__NR_SYSCALL_BASE+195);}' unless defined(&__NR_stat64);
    eval 'sub __NR_lstat64 () {( &__NR_SYSCALL_BASE+196);}' unless defined(&__NR_lstat64);
    eval 'sub __NR_fstat64 () {( &__NR_SYSCALL_BASE+197);}' unless defined(&__NR_fstat64);
    eval 'sub __NR_lchown32 () {( &__NR_SYSCALL_BASE+198);}' unless defined(&__NR_lchown32);
    eval 'sub __NR_getuid32 () {( &__NR_SYSCALL_BASE+199);}' unless defined(&__NR_getuid32);
    eval 'sub __NR_getgid32 () {( &__NR_SYSCALL_BASE+200);}' unless defined(&__NR_getgid32);
    eval 'sub __NR_geteuid32 () {( &__NR_SYSCALL_BASE+201);}' unless defined(&__NR_geteuid32);
    eval 'sub __NR_getegid32 () {( &__NR_SYSCALL_BASE+202);}' unless defined(&__NR_getegid32);
    eval 'sub __NR_setreuid32 () {( &__NR_SYSCALL_BASE+203);}' unless defined(&__NR_setreuid32);
    eval 'sub __NR_setregid32 () {( &__NR_SYSCALL_BASE+204);}' unless defined(&__NR_setregid32);
    eval 'sub __NR_getgroups32 () {( &__NR_SYSCALL_BASE+205);}' unless defined(&__NR_getgroups32);
    eval 'sub __NR_setgroups32 () {( &__NR_SYSCALL_BASE+206);}' unless defined(&__NR_setgroups32);
    eval 'sub __NR_fchown32 () {( &__NR_SYSCALL_BASE+207);}' unless defined(&__NR_fchown32);
    eval 'sub __NR_setresuid32 () {( &__NR_SYSCALL_BASE+208);}' unless defined(&__NR_setresuid32);
    eval 'sub __NR_getresuid32 () {( &__NR_SYSCALL_BASE+209);}' unless defined(&__NR_getresuid32);
    eval 'sub __NR_setresgid32 () {( &__NR_SYSCALL_BASE+210);}' unless defined(&__NR_setresgid32);
    eval 'sub __NR_getresgid32 () {( &__NR_SYSCALL_BASE+211);}' unless defined(&__NR_getresgid32);
    eval 'sub __NR_chown32 () {( &__NR_SYSCALL_BASE+212);}' unless defined(&__NR_chown32);
    eval 'sub __NR_setuid32 () {( &__NR_SYSCALL_BASE+213);}' unless defined(&__NR_setuid32);
    eval 'sub __NR_setgid32 () {( &__NR_SYSCALL_BASE+214);}' unless defined(&__NR_setgid32);
    eval 'sub __NR_setfsuid32 () {( &__NR_SYSCALL_BASE+215);}' unless defined(&__NR_setfsuid32);
    eval 'sub __NR_setfsgid32 () {( &__NR_SYSCALL_BASE+216);}' unless defined(&__NR_setfsgid32);
    eval 'sub __NR_getdents64 () {( &__NR_SYSCALL_BASE+217);}' unless defined(&__NR_getdents64);
    eval 'sub __NR_pivot_root () {( &__NR_SYSCALL_BASE+218);}' unless defined(&__NR_pivot_root);
    eval 'sub __NR_mincore () {( &__NR_SYSCALL_BASE+219);}' unless defined(&__NR_mincore);
    eval 'sub __NR_madvise () {( &__NR_SYSCALL_BASE+220);}' unless defined(&__NR_madvise);
    eval 'sub __NR_fcntl64 () {( &__NR_SYSCALL_BASE+221);}' unless defined(&__NR_fcntl64);
    eval 'sub __NR_gettid () {( &__NR_SYSCALL_BASE+224);}' unless defined(&__NR_gettid);
    eval 'sub __NR_readahead () {( &__NR_SYSCALL_BASE+225);}' unless defined(&__NR_readahead);
    eval 'sub __NR_setxattr () {( &__NR_SYSCALL_BASE+226);}' unless defined(&__NR_setxattr);
    eval 'sub __NR_lsetxattr () {( &__NR_SYSCALL_BASE+227);}' unless defined(&__NR_lsetxattr);
    eval 'sub __NR_fsetxattr () {( &__NR_SYSCALL_BASE+228);}' unless defined(&__NR_fsetxattr);
    eval 'sub __NR_getxattr () {( &__NR_SYSCALL_BASE+229);}' unless defined(&__NR_getxattr);
    eval 'sub __NR_lgetxattr () {( &__NR_SYSCALL_BASE+230);}' unless defined(&__NR_lgetxattr);
    eval 'sub __NR_fgetxattr () {( &__NR_SYSCALL_BASE+231);}' unless defined(&__NR_fgetxattr);
    eval 'sub __NR_listxattr () {( &__NR_SYSCALL_BASE+232);}' unless defined(&__NR_listxattr);
    eval 'sub __NR_llistxattr () {( &__NR_SYSCALL_BASE+233);}' unless defined(&__NR_llistxattr);
    eval 'sub __NR_flistxattr () {( &__NR_SYSCALL_BASE+234);}' unless defined(&__NR_flistxattr);
    eval 'sub __NR_removexattr () {( &__NR_SYSCALL_BASE+235);}' unless defined(&__NR_removexattr);
    eval 'sub __NR_lremovexattr () {( &__NR_SYSCALL_BASE+236);}' unless defined(&__NR_lremovexattr);
    eval 'sub __NR_fremovexattr () {( &__NR_SYSCALL_BASE+237);}' unless defined(&__NR_fremovexattr);
    eval 'sub __NR_tkill () {( &__NR_SYSCALL_BASE+238);}' unless defined(&__NR_tkill);
    eval 'sub __NR_sendfile64 () {( &__NR_SYSCALL_BASE+239);}' unless defined(&__NR_sendfile64);
    eval 'sub __NR_futex () {( &__NR_SYSCALL_BASE+240);}' unless defined(&__NR_futex);
    eval 'sub __NR_sched_setaffinity () {( &__NR_SYSCALL_BASE+241);}' unless defined(&__NR_sched_setaffinity);
    eval 'sub __NR_sched_getaffinity () {( &__NR_SYSCALL_BASE+242);}' unless defined(&__NR_sched_getaffinity);
    eval 'sub __NR_io_setup () {( &__NR_SYSCALL_BASE+243);}' unless defined(&__NR_io_setup);
    eval 'sub __NR_io_destroy () {( &__NR_SYSCALL_BASE+244);}' unless defined(&__NR_io_destroy);
    eval 'sub __NR_io_getevents () {( &__NR_SYSCALL_BASE+245);}' unless defined(&__NR_io_getevents);
    eval 'sub __NR_io_submit () {( &__NR_SYSCALL_BASE+246);}' unless defined(&__NR_io_submit);
    eval 'sub __NR_io_cancel () {( &__NR_SYSCALL_BASE+247);}' unless defined(&__NR_io_cancel);
    eval 'sub __NR_exit_group () {( &__NR_SYSCALL_BASE+248);}' unless defined(&__NR_exit_group);
    eval 'sub __NR_lookup_dcookie () {( &__NR_SYSCALL_BASE+249);}' unless defined(&__NR_lookup_dcookie);
    eval 'sub __NR_epoll_create () {( &__NR_SYSCALL_BASE+250);}' unless defined(&__NR_epoll_create);
    eval 'sub __NR_epoll_ctl () {( &__NR_SYSCALL_BASE+251);}' unless defined(&__NR_epoll_ctl);
    eval 'sub __NR_epoll_wait () {( &__NR_SYSCALL_BASE+252);}' unless defined(&__NR_epoll_wait);
    eval 'sub __NR_remap_file_pages () {( &__NR_SYSCALL_BASE+253);}' unless defined(&__NR_remap_file_pages);
    eval 'sub __NR_set_tid_address () {( &__NR_SYSCALL_BASE+256);}' unless defined(&__NR_set_tid_address);
    eval 'sub __NR_timer_create () {( &__NR_SYSCALL_BASE+257);}' unless defined(&__NR_timer_create);
    eval 'sub __NR_timer_settime () {( &__NR_SYSCALL_BASE+258);}' unless defined(&__NR_timer_settime);
    eval 'sub __NR_timer_gettime () {( &__NR_SYSCALL_BASE+259);}' unless defined(&__NR_timer_gettime);
    eval 'sub __NR_timer_getoverrun () {( &__NR_SYSCALL_BASE+260);}' unless defined(&__NR_timer_getoverrun);
    eval 'sub __NR_timer_delete () {( &__NR_SYSCALL_BASE+261);}' unless defined(&__NR_timer_delete);
    eval 'sub __NR_clock_settime () {( &__NR_SYSCALL_BASE+262);}' unless defined(&__NR_clock_settime);
    eval 'sub __NR_clock_gettime () {( &__NR_SYSCALL_BASE+263);}' unless defined(&__NR_clock_gettime);
    eval 'sub __NR_clock_getres () {( &__NR_SYSCALL_BASE+264);}' unless defined(&__NR_clock_getres);
    eval 'sub __NR_clock_nanosleep () {( &__NR_SYSCALL_BASE+265);}' unless defined(&__NR_clock_nanosleep);
    eval 'sub __NR_statfs64 () {( &__NR_SYSCALL_BASE+266);}' unless defined(&__NR_statfs64);
    eval 'sub __NR_fstatfs64 () {( &__NR_SYSCALL_BASE+267);}' unless defined(&__NR_fstatfs64);
    eval 'sub __NR_tgkill () {( &__NR_SYSCALL_BASE+268);}' unless defined(&__NR_tgkill);
    eval 'sub __NR_utimes () {( &__NR_SYSCALL_BASE+269);}' unless defined(&__NR_utimes);
    eval 'sub __NR_arm_fadvise64_64 () {( &__NR_SYSCALL_BASE+270);}' unless defined(&__NR_arm_fadvise64_64);
    eval 'sub __NR_pciconfig_iobase () {( &__NR_SYSCALL_BASE+271);}' unless defined(&__NR_pciconfig_iobase);
    eval 'sub __NR_pciconfig_read () {( &__NR_SYSCALL_BASE+272);}' unless defined(&__NR_pciconfig_read);
    eval 'sub __NR_pciconfig_write () {( &__NR_SYSCALL_BASE+273);}' unless defined(&__NR_pciconfig_write);
    eval 'sub __NR_mq_open () {( &__NR_SYSCALL_BASE+274);}' unless defined(&__NR_mq_open);
    eval 'sub __NR_mq_unlink () {( &__NR_SYSCALL_BASE+275);}' unless defined(&__NR_mq_unlink);
    eval 'sub __NR_mq_timedsend () {( &__NR_SYSCALL_BASE+276);}' unless defined(&__NR_mq_timedsend);
    eval 'sub __NR_mq_timedreceive () {( &__NR_SYSCALL_BASE+277);}' unless defined(&__NR_mq_timedreceive);
    eval 'sub __NR_mq_notify () {( &__NR_SYSCALL_BASE+278);}' unless defined(&__NR_mq_notify);
    eval 'sub __NR_mq_getsetattr () {( &__NR_SYSCALL_BASE+279);}' unless defined(&__NR_mq_getsetattr);
    eval 'sub __NR_waitid () {( &__NR_SYSCALL_BASE+280);}' unless defined(&__NR_waitid);
    eval 'sub __NR_socket () {( &__NR_SYSCALL_BASE+281);}' unless defined(&__NR_socket);
    eval 'sub __NR_bind () {( &__NR_SYSCALL_BASE+282);}' unless defined(&__NR_bind);
    eval 'sub __NR_connect () {( &__NR_SYSCALL_BASE+283);}' unless defined(&__NR_connect);
    eval 'sub __NR_listen () {( &__NR_SYSCALL_BASE+284);}' unless defined(&__NR_listen);
    eval 'sub __NR_accept () {( &__NR_SYSCALL_BASE+285);}' unless defined(&__NR_accept);
    eval 'sub __NR_getsockname () {( &__NR_SYSCALL_BASE+286);}' unless defined(&__NR_getsockname);
    eval 'sub __NR_getpeername () {( &__NR_SYSCALL_BASE+287);}' unless defined(&__NR_getpeername);
    eval 'sub __NR_socketpair () {( &__NR_SYSCALL_BASE+288);}' unless defined(&__NR_socketpair);
    eval 'sub __NR_send () {( &__NR_SYSCALL_BASE+289);}' unless defined(&__NR_send);
    eval 'sub __NR_sendto () {( &__NR_SYSCALL_BASE+290);}' unless defined(&__NR_sendto);
    eval 'sub __NR_recv () {( &__NR_SYSCALL_BASE+291);}' unless defined(&__NR_recv);
    eval 'sub __NR_recvfrom () {( &__NR_SYSCALL_BASE+292);}' unless defined(&__NR_recvfrom);
    eval 'sub __NR_shutdown () {( &__NR_SYSCALL_BASE+293);}' unless defined(&__NR_shutdown);
    eval 'sub __NR_setsockopt () {( &__NR_SYSCALL_BASE+294);}' unless defined(&__NR_setsockopt);
    eval 'sub __NR_getsockopt () {( &__NR_SYSCALL_BASE+295);}' unless defined(&__NR_getsockopt);
    eval 'sub __NR_sendmsg () {( &__NR_SYSCALL_BASE+296);}' unless defined(&__NR_sendmsg);
    eval 'sub __NR_recvmsg () {( &__NR_SYSCALL_BASE+297);}' unless defined(&__NR_recvmsg);
    eval 'sub __NR_semop () {( &__NR_SYSCALL_BASE+298);}' unless defined(&__NR_semop);
    eval 'sub __NR_semget () {( &__NR_SYSCALL_BASE+299);}' unless defined(&__NR_semget);
    eval 'sub __NR_semctl () {( &__NR_SYSCALL_BASE+300);}' unless defined(&__NR_semctl);
    eval 'sub __NR_msgsnd () {( &__NR_SYSCALL_BASE+301);}' unless defined(&__NR_msgsnd);
    eval 'sub __NR_msgrcv () {( &__NR_SYSCALL_BASE+302);}' unless defined(&__NR_msgrcv);
    eval 'sub __NR_msgget () {( &__NR_SYSCALL_BASE+303);}' unless defined(&__NR_msgget);
    eval 'sub __NR_msgctl () {( &__NR_SYSCALL_BASE+304);}' unless defined(&__NR_msgctl);
    eval 'sub __NR_shmat () {( &__NR_SYSCALL_BASE+305);}' unless defined(&__NR_shmat);
    eval 'sub __NR_shmdt () {( &__NR_SYSCALL_BASE+306);}' unless defined(&__NR_shmdt);
    eval 'sub __NR_shmget () {( &__NR_SYSCALL_BASE+307);}' unless defined(&__NR_shmget);
    eval 'sub __NR_shmctl () {( &__NR_SYSCALL_BASE+308);}' unless defined(&__NR_shmctl);
    eval 'sub __NR_add_key () {( &__NR_SYSCALL_BASE+309);}' unless defined(&__NR_add_key);
    eval 'sub __NR_request_key () {( &__NR_SYSCALL_BASE+310);}' unless defined(&__NR_request_key);
    eval 'sub __NR_keyctl () {( &__NR_SYSCALL_BASE+311);}' unless defined(&__NR_keyctl);
    eval 'sub __NR_semtimedop () {( &__NR_SYSCALL_BASE+312);}' unless defined(&__NR_semtimedop);
    eval 'sub __NR_vserver () {( &__NR_SYSCALL_BASE+313);}' unless defined(&__NR_vserver);
    eval 'sub __NR_ioprio_set () {( &__NR_SYSCALL_BASE+314);}' unless defined(&__NR_ioprio_set);
    eval 'sub __NR_ioprio_get () {( &__NR_SYSCALL_BASE+315);}' unless defined(&__NR_ioprio_get);
    eval 'sub __NR_inotify_init () {( &__NR_SYSCALL_BASE+316);}' unless defined(&__NR_inotify_init);
    eval 'sub __NR_inotify_add_watch () {( &__NR_SYSCALL_BASE+317);}' unless defined(&__NR_inotify_add_watch);
    eval 'sub __NR_inotify_rm_watch () {( &__NR_SYSCALL_BASE+318);}' unless defined(&__NR_inotify_rm_watch);
    eval 'sub __NR_mbind () {( &__NR_SYSCALL_BASE+319);}' unless defined(&__NR_mbind);
    eval 'sub __NR_get_mempolicy () {( &__NR_SYSCALL_BASE+320);}' unless defined(&__NR_get_mempolicy);
    eval 'sub __NR_set_mempolicy () {( &__NR_SYSCALL_BASE+321);}' unless defined(&__NR_set_mempolicy);
    eval 'sub __NR_openat () {( &__NR_SYSCALL_BASE+322);}' unless defined(&__NR_openat);
    eval 'sub __NR_mkdirat () {( &__NR_SYSCALL_BASE+323);}' unless defined(&__NR_mkdirat);
    eval 'sub __NR_mknodat () {( &__NR_SYSCALL_BASE+324);}' unless defined(&__NR_mknodat);
    eval 'sub __NR_fchownat () {( &__NR_SYSCALL_BASE+325);}' unless defined(&__NR_fchownat);
    eval 'sub __NR_futimesat () {( &__NR_SYSCALL_BASE+326);}' unless defined(&__NR_futimesat);
    eval 'sub __NR_fstatat64 () {( &__NR_SYSCALL_BASE+327);}' unless defined(&__NR_fstatat64);
    eval 'sub __NR_unlinkat () {( &__NR_SYSCALL_BASE+328);}' unless defined(&__NR_unlinkat);
    eval 'sub __NR_renameat () {( &__NR_SYSCALL_BASE+329);}' unless defined(&__NR_renameat);
    eval 'sub __NR_linkat () {( &__NR_SYSCALL_BASE+330);}' unless defined(&__NR_linkat);
    eval 'sub __NR_symlinkat () {( &__NR_SYSCALL_BASE+331);}' unless defined(&__NR_symlinkat);
    eval 'sub __NR_readlinkat () {( &__NR_SYSCALL_BASE+332);}' unless defined(&__NR_readlinkat);
    eval 'sub __NR_fchmodat () {( &__NR_SYSCALL_BASE+333);}' unless defined(&__NR_fchmodat);
    eval 'sub __NR_faccessat () {( &__NR_SYSCALL_BASE+334);}' unless defined(&__NR_faccessat);
    eval 'sub __NR_pselect6 () {( &__NR_SYSCALL_BASE+335);}' unless defined(&__NR_pselect6);
    eval 'sub __NR_ppoll () {( &__NR_SYSCALL_BASE+336);}' unless defined(&__NR_ppoll);
    eval 'sub __NR_unshare () {( &__NR_SYSCALL_BASE+337);}' unless defined(&__NR_unshare);
    eval 'sub __NR_set_robust_list () {( &__NR_SYSCALL_BASE+338);}' unless defined(&__NR_set_robust_list);
    eval 'sub __NR_get_robust_list () {( &__NR_SYSCALL_BASE+339);}' unless defined(&__NR_get_robust_list);
    eval 'sub __NR_splice () {( &__NR_SYSCALL_BASE+340);}' unless defined(&__NR_splice);
    eval 'sub __NR_arm_sync_file_range () {( &__NR_SYSCALL_BASE+341);}' unless defined(&__NR_arm_sync_file_range);
    eval 'sub __NR_sync_file_range2 () { &__NR_arm_sync_file_range;}' unless defined(&__NR_sync_file_range2);
    eval 'sub __NR_tee () {( &__NR_SYSCALL_BASE+342);}' unless defined(&__NR_tee);
    eval 'sub __NR_vmsplice () {( &__NR_SYSCALL_BASE+343);}' unless defined(&__NR_vmsplice);
    eval 'sub __NR_move_pages () {( &__NR_SYSCALL_BASE+344);}' unless defined(&__NR_move_pages);
    eval 'sub __NR_getcpu () {( &__NR_SYSCALL_BASE+345);}' unless defined(&__NR_getcpu);
    eval 'sub __NR_epoll_pwait () {( &__NR_SYSCALL_BASE+346);}' unless defined(&__NR_epoll_pwait);
    eval 'sub __NR_kexec_load () {( &__NR_SYSCALL_BASE+347);}' unless defined(&__NR_kexec_load);
    eval 'sub __NR_utimensat () {( &__NR_SYSCALL_BASE+348);}' unless defined(&__NR_utimensat);
    eval 'sub __NR_signalfd () {( &__NR_SYSCALL_BASE+349);}' unless defined(&__NR_signalfd);
    eval 'sub __NR_timerfd_create () {( &__NR_SYSCALL_BASE+350);}' unless defined(&__NR_timerfd_create);
    eval 'sub __NR_eventfd () {( &__NR_SYSCALL_BASE+351);}' unless defined(&__NR_eventfd);
    eval 'sub __NR_fallocate () {( &__NR_SYSCALL_BASE+352);}' unless defined(&__NR_fallocate);
    eval 'sub __NR_timerfd_settime () {( &__NR_SYSCALL_BASE+353);}' unless defined(&__NR_timerfd_settime);
    eval 'sub __NR_timerfd_gettime () {( &__NR_SYSCALL_BASE+354);}' unless defined(&__NR_timerfd_gettime);
    eval 'sub __NR_signalfd4 () {( &__NR_SYSCALL_BASE+355);}' unless defined(&__NR_signalfd4);
    eval 'sub __NR_eventfd2 () {( &__NR_SYSCALL_BASE+356);}' unless defined(&__NR_eventfd2);
    eval 'sub __NR_epoll_create1 () {( &__NR_SYSCALL_BASE+357);}' unless defined(&__NR_epoll_create1);
    eval 'sub __NR_dup3 () {( &__NR_SYSCALL_BASE+358);}' unless defined(&__NR_dup3);
    eval 'sub __NR_pipe2 () {( &__NR_SYSCALL_BASE+359);}' unless defined(&__NR_pipe2);
    eval 'sub __NR_inotify_init1 () {( &__NR_SYSCALL_BASE+360);}' unless defined(&__NR_inotify_init1);
    eval 'sub __NR_preadv () {( &__NR_SYSCALL_BASE+361);}' unless defined(&__NR_preadv);
    eval 'sub __NR_pwritev () {( &__NR_SYSCALL_BASE+362);}' unless defined(&__NR_pwritev);
    eval 'sub __NR_rt_tgsigqueueinfo () {( &__NR_SYSCALL_BASE+363);}' unless defined(&__NR_rt_tgsigqueueinfo);
    eval 'sub __NR_perf_event_open () {( &__NR_SYSCALL_BASE+364);}' unless defined(&__NR_perf_event_open);
    eval 'sub __NR_recvmmsg () {( &__NR_SYSCALL_BASE+365);}' unless defined(&__NR_recvmmsg);
    eval 'sub __NR_accept4 () {( &__NR_SYSCALL_BASE+366);}' unless defined(&__NR_accept4);
    eval 'sub __NR_fanotify_init () {( &__NR_SYSCALL_BASE+367);}' unless defined(&__NR_fanotify_init);
    eval 'sub __NR_fanotify_mark () {( &__NR_SYSCALL_BASE+368);}' unless defined(&__NR_fanotify_mark);
    eval 'sub __NR_prlimit64 () {( &__NR_SYSCALL_BASE+369);}' unless defined(&__NR_prlimit64);
    eval 'sub __NR_name_to_handle_at () {( &__NR_SYSCALL_BASE+370);}' unless defined(&__NR_name_to_handle_at);
    eval 'sub __NR_open_by_handle_at () {( &__NR_SYSCALL_BASE+371);}' unless defined(&__NR_open_by_handle_at);
    eval 'sub __NR_clock_adjtime () {( &__NR_SYSCALL_BASE+372);}' unless defined(&__NR_clock_adjtime);
    eval 'sub __NR_syncfs () {( &__NR_SYSCALL_BASE+373);}' unless defined(&__NR_syncfs);
    eval 'sub __NR_sendmmsg () {( &__NR_SYSCALL_BASE+374);}' unless defined(&__NR_sendmmsg);
    eval 'sub __NR_setns () {( &__NR_SYSCALL_BASE+375);}' unless defined(&__NR_setns);
    eval 'sub __NR_process_vm_readv () {( &__NR_SYSCALL_BASE+376);}' unless defined(&__NR_process_vm_readv);
    eval 'sub __NR_process_vm_writev () {( &__NR_SYSCALL_BASE+377);}' unless defined(&__NR_process_vm_writev);
    eval 'sub __ARM_NR_BASE () {( &__NR_SYSCALL_BASE+0xf0000);}' unless defined(&__ARM_NR_BASE);
    eval 'sub __ARM_NR_breakpoint () {( &__ARM_NR_BASE+1);}' unless defined(&__ARM_NR_breakpoint);
    eval 'sub __ARM_NR_cacheflush () {( &__ARM_NR_BASE+2);}' unless defined(&__ARM_NR_cacheflush);
    eval 'sub __ARM_NR_usr26 () {( &__ARM_NR_BASE+3);}' unless defined(&__ARM_NR_usr26);
    eval 'sub __ARM_NR_usr32 () {( &__ARM_NR_BASE+4);}' unless defined(&__ARM_NR_usr32);
    eval 'sub __ARM_NR_set_tls () {( &__ARM_NR_BASE+5);}' unless defined(&__ARM_NR_set_tls);
    if(defined(&__ARM_EABI__)) {
	undef(&__NR_time) if defined(&__NR_time);
	undef(&__NR_umount) if defined(&__NR_umount);
	undef(&__NR_stime) if defined(&__NR_stime);
	undef(&__NR_alarm) if defined(&__NR_alarm);
	undef(&__NR_utime) if defined(&__NR_utime);
	undef(&__NR_getrlimit) if defined(&__NR_getrlimit);
	undef(&__NR_select) if defined(&__NR_select);
	undef(&__NR_readdir) if defined(&__NR_readdir);
	undef(&__NR_mmap) if defined(&__NR_mmap);
	undef(&__NR_socketcall) if defined(&__NR_socketcall);
	undef(&__NR_syscall) if defined(&__NR_syscall);
	undef(&__NR_ipc) if defined(&__NR_ipc);
    }
}
1;
