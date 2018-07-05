var isRedirected = Response.redirected;

if (isRedirected) {
    $("#qr-code-modal").modal("show");
}