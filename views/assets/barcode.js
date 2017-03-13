
function getMostFrequentBarcode(freq) {
    // Iterates through freq, keeping track of the barcode with the highest frequency
    var mostFrequentBarcode = Object.keys(freq).reduce( function(a, b){ return freq[a] > freq[b] ? a : b } );
    return mostFrequentBarcode;
}


function run() {
    var decoded = []
    var freq = {}
    Quagga.init({
        inputStream: {
            name: "Live",
            type: "LiveStream",
            target: document.querySelector('#yourElement'),
            constraints: {
                facing: "environment", // or user
            },
        },
        decoder: { // or code_39, codabar, ean_13, ean_8, upc_a, upc_e
            readers: ["code_128_reader",'ean_reader', 'ean_8_reader', 'code_39_reader', 'code_39_vin_reader', 'codabar_reader', 'upc_reader', 'upc_e_reader', 'i2of5_reader'],
        }
    }, function (err) {
        if (err) {
            console.log(err);
        }
        console.log("Initialization finished. Ready to start");
        Quagga.start();
    });
    Quagga.onDetected(function(data){
        console.log(decoded.length)
        if(decoded.length > 50){
            console.log(freq)
            var barcode = getMostFrequentBarcode(freq);
            $('.food-name').val(barcode);
            Quagga.stop();
        }else{
            decoded.splice(decoded.length,0,data.codeResult.code)
            if(!freq[data.codeResult.code]){
                freq[data.codeResult.code] = 1;
            }else{
                freq[data.codeResult.code] = freq[data.codeResult.code] + 1
            }
        }
    })
}
run();
