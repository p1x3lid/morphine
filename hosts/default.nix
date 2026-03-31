{inputs}: {
  nixos = {
    ibuprofen = import ./x86_64-linux/ibuprofen {inherit inputs;};
  };
}
