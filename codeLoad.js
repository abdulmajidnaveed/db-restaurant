var fC = {};
fC.folderName='sqlcode';
fC.fileName1Path = './'+fC.folderName;
fC.forwardSlash = '/';
fC.fileName1 = fC.folderName+fC.forwardSlash+'sql_fig2b.sql';
//  fC.fileName1Path = (fC.fileName1Path+fC.forwardSlash+fC.fileName1);
Globals={};
Globals.textProp = '';

$(document).ready(function () {
    $("button").click(function () {
        $("#div1filecode").load(fC.fileName1, function (responseTxt, statusTxt, xhr) {
            if (statusTxt == "success") {
                //alert("External content loaded successfully!");
                setTimeout(function () {
                    setTimeout(function () { $('pre code').each(function (i, e) { hljs.highlightBlock(e) }); }, 01);
                }, 01);
            } else if (statusTxt == "error") {
                alert("Error: " + xhr.status + ": " + xhr.statusText);
            }
        });
    });
    if (document.body.innerText) Globals.textProp="innerText";
    else Globals.textProp = "textContent";        
});

function selectonchange(val) {
    fC.fileName1 = fC.folderName+fC.forwardSlash+val;
    // console.log('selected:', val);
    $("#optionShow").val(val);
    // console.log(fC.fileName1);
}
