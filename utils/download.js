function export2txt() {

    let offers = {
        name: [],
        description: [],
        detail: [],
        redeem: [],
    };

    $(".d-none").each((i, e) => offers.name.push($(e).text()));

    $("p.mb-3").each((i, e) => offers.description.push($(e).text()));

    $("p.mb-3").next().each((i, e) => offers.detail.push($.trim($(e).text())));

    $(".offer-redeem-details").each((i, e) => offers.redeem.push($(e).text()));


    const link2 = document.createElement("a");
    link2.href = URL.createObjectURL(new Blob([JSON.stringify(offers, null, 2)], {
        type: "text/plain"
    }));
    link2.setAttribute("download", "data.txt");
    document.body.appendChild(link2);
    link2.click();
    document.body.removeChild(link2);
}