# Needed for all installers
sudo pacman -Syyuu --noconfirm
sudo pacman -S curl git unzip --noconfirm
# Run terminal and desktop installers
# for installer in $OHMYDOT_PATH/install/modules/terminal/*.sh; do echo $installer; done
# for installer in $OHMYDOT_PATH/install/modules/desktop/*.sh; do echo $installer; done
for installer in $OHMYDOT_PATH/install/modules/terminal/*.sh; do echo $installer; source $installer; done
for installer in $OHMYDOT_PATH/install/modules/desktop/*.sh; do echo $installer; source $installer; done

echo "Finished installing all apps and configurations. Log out and log back in."
