{...}: {
  services.mako = {
    enable = true;
    font = "JetBrainsMono Nerd Font11";
    format="<b>%a ⏵</b> %s\n%b";
    sort="-time";
    layer="overlay";
    backgroundColor="#1a1b26";
    anchor="top-center";
    width=300;
    height=110;
    margin="5";
    padding="10";
    borderSize=2;
    borderColor="#3ddbd9";
    borderRadius=16;
    icons=true;
    maxIconSize=64;
    defaultTimeout=5000;
    ignoreTimeout=false;
  };
}
