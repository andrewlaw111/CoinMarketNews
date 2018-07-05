const platform = window.navigator.platform

$("#download-button").click((e) => {
    if (platform === "iPhone" || platform === "iPod" || platform === "iPad" || platform === "Android") {
        return
    } else {
        e.preventDefault();
        $("#qr-code-modal").modal("show");
    }
});