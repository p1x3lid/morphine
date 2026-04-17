{pkgs, ...}: {
  boot = {
    kernelPackages = pkgs.linuxKernel.packages.linux_zen;

    kernelModules = [
      "kvm-intel"
    ];

    extraModulePackages = [
    ];

    extraModprobeConfig = "";

    kernelParams = [
      "quiet"
      "splash"
      "rd.systemd.show_status=false"
      "intel_iommu=on"
      "iommu=pt"
      # make it harder to influence slab cache layout
      "slab_nomerge"
      # enables zeroing of memory during allocation and free time
      # helps mitigate use-after-free vulnerabilaties
      "init_on_alloc=1"
      "init_on_free=1"
      # randomizes page allocator freelist, improving security by
      # making page allocations less predictable
      "page_alloc.shuffle=1"
      # enables Kernel Page Table Isolation, which mitigates Meltdown and
      # prevents some KASLR bypasses
      "pti=on"
      # randomizes the kernel stack offset on each syscall
      # making attacks that rely on a deterministic stack layout difficult
      "randomize_kstack_offset=on"
      # disables vsyscalls, they've been replaced with vDSO
      "vsyscall=none"
      # disables debugfs, which exposes sensitive info about the kernel
      "debugfs=off"
      # certain exploits cause an "oops", this makes the kernel panic if an "oops" occurs
      "oops=panic"
      # only alows kernel modules that have been signed with a valid key to be loaded
      # making it harder to load malicious kernel modules
      # can make VirtualBox or Nvidia drivers unusable
      "module.sig_enforce=1"
      # prevents user space code excalation
      "lockdown=confidentiality"
      "loglevel=3"
      "udev.log_priority=3"
      "rd.udev.log_level=3"
    ];

    kernel = {
      sysctl = {
        "fs.suid_dumpable" = 0;
        # prevent pointer leaks
        "kernel.kptr_restrict" = 2;
        # restrict kernel log to CAP_SYSLOG capability
        "kernel.dmesg_restrict" = 1;
        # Note: certian container runtimes or browser sandboxes might rely on the following
        # restrict eBPF to the CAP_BPF capability
        "kernel.unprivileged_bpf_disabled" = 1;
        # should be enabled along with bpf above
        # "net.core.bpf_jit_harden" = 2;
        # restrict loading TTY line disciplines to the CAP_SYS_MODULE
        "dev.tty.ldisc_autoload" = 0;
        # prevent exploit of use-after-free flaws
        "vm.unprivileged_userfaultfd" = 0;
        # kexec is used to boot another kernel during runtime and can be abused
        "kernel.kexec_load_disabled" = 1;
        # Kernel self-protection
        # SysRq exposes a lot of potentially dangerous debugging functionality to unprivileged users
        # 4 makes it so a user can only use the secure attention key. A value of 0 would disable completely
        "kernel.sysrq" = 0;
        # disable unprivileged user namespaces, Note: Docker, NH, and other apps may need this
        # This should be set to 0 if you don't rely on flatpak, NH, Docker, etc.
        "kernel.unprivileged_userns_clone" = 1;
        # restrict all usage of performance events to the CAP_PERFMON capability
        "kernel.perf_event_paranoid" = 3;

        # Userspace
        # restrict usage of ptrace
        "kernel.yama.ptrace_scope" = 2;

        # ASLR memory protection (64-bit systems)
        "vm.mmap_rnd_bits" = 32;
        "vm.mmap_rnd_compat_bits" = 16;

        # only permit symlinks to be followed when outside of a world-writable sticky directory
        "fs.protected_symlinks" = 1;
        "fs.protected_hardlinks" = 1;
        # Prevent creating files in potentially attacker-controlled environments
        "fs.protected_fifos" = 2;
        "fs.protected_regular" = 2;

        # Randomize memory
        "kernel.randomize_va_space" = 2;

        ## TCP optimization
        # TCP Fast Open is a TCP extension that reduces network latency by packing
        # data in the sender’s initial TCP SYN. Setting 3 = enable TCP Fast Open for
        # both incoming and outgoing connections:
        "net.ipv4.tcp_fastopen" = 3;
        # Bufferbloat mitigations + slight improvement in throughput & latency
        "net.ipv4.tcp_congestion_control" = "bbr";
        "net.core.default_qdisc" = "cake";
      };
    };
  };
}
