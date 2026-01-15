pragma Singleton

import QtQuick
import Quickshell

Singleton {
    function withTransparency(hex, opacity) {
        // strip leading #
        hex = hex.replace(/^#/, '');
        // expand short form
        if (hex.length === 3)
            hex = hex.split('').map(c => c + c).join('');
        if (hex.length !== 6) return 'transparent';

        const r = parseInt(hex.substr(0, 2), 16) / 255;
        const g = parseInt(hex.substr(2, 2), 16) / 255;
        const b = parseInt(hex.substr(4, 2), 16) / 255;

        return Qt.rgba(r, g, b, opacity);
    }
}
