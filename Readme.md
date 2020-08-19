# Dual Screen Qt Wayland compositor

This example allows to start two applications one on the left and one on the right screen when using the Qt Wayland plugin. The first application that starts is shown on the left screen and the second on the right screen. The wayland compositor is implemented with Qt. This example was tested on an iMX8M Plus.

## Environment
For the compositor the following environment variables need to be set:
```bash
# export QT_LOGGING_RULES=qt.qpa.*=true # Optional for logging
export QT_QPA_EGLFS_KMS_CONFIG=/etc/kms.conf
export QT_QPA_EGLFS_INTEGRATION=kms
# export QT_QPA_EGLFS_INTEGRATION=eglfs_kms # kms doesn't work on boot2qt but eglfs_kms
export QT_QPA_PLATFORM=eglfs
export QT_QPA_EGLFS_KMS_ATOMIC=1
```

For the clients the QPA platform should be set to wayland:
```bash
export QT_QPA_PLATFORM=wayland
```

The /etc/kms.conf file can look as follows:
```
{
  "device": "/dev/dri/card0",
  "hwcursor": true,
  "pbuffers": false,
  "outputs": [
      { "name": "HDMI1", "mode": "1920x1080", "virtualIndex": 0, "primary": true },
      { "name": "HDMI2", "mode": "1280x720", "virtualIndex": 1 }
  ]
}
```
