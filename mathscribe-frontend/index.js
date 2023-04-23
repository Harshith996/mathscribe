// /*jslint es6:true*/

const dragArea = document.querySelector('.drag-area');
const dragText = document.querySelector('.header');

let button = document.getElementById('bob');

let input = document.querySelector('input');

let file;




// button.onclick = () =>{    
//     input.click();
// };

$('.file-upload').on('click', function (e) {
    e.preventDefault();
    $('#file').trigger('click');
});


const fileInput = document.getElementById('file');
const submitButton = document.getElementById('submit');

fileInput.addEventListener('change', () => {
    if (fileInput.files.length > 0) {
        document.querySelector('#submit').disabled = false;
    } else {
        document.querySelector('#submit').disabled = true;
    }
});
//when browse is clicked:

input.addEventListener('change', function () {
    file = this.files[0];
    dragArea.classList.add('active');
    displayFile();

})

//when file is inside the drag area
dragArea.addEventListener('dragover', (event) => {
    event.preventDefault();
    dragText.textContent = 'Release to Upload';
    dragArea.classList.add('active');
    console.log('File is inside the drag area');
});

//when file leaves drag area

dragArea.addEventListener('dragleave', () => {
    dragText.textContent = 'Drag & Drop';
    dragArea.classList.remove('active');
    //  console.log('File left the drag area');
});

//when the file is dropped
dragArea.addEventListener('drop', (event) => {
    event.preventDefault();
    file = event.dataTransfer.files[0];
    //console.log(file);
    displayFile();
});


function displayFile() {
    let filetype = file.type;
    let validExtensions = ['image/jpeg', 'image/jpg', 'image/png'];

    if (validExtensions.includes(filetype)) {
        let fileReader = new FileReader();

        fileReader.onload = () => {
            let fileURL = fileReader.result;
            let imgTag = `<img src = "${fileURL}" alt = "">`;
            dragArea.innerHTML = imgTag;
        };

        fileReader.readAsDataURL(file);
    }

    else {
        alert('This file is not an Image!');
        dragArea.classList.remove('active');

    }

}
//  console.log('File is dropped');

let x = 0;

window.onload = function () {
    //when the document is finished loading, replace everything
    //between the <a ...> </a> tags with the value of splitText
    // fetch("http://169.232.97.85:8080/backend/flutter_apis/obtainSessionCode.php", {
    //     mode: "no-cors",
    //     method: "POST",
    //     headers: {
    //         "Accept": "application/json"
    //     }
    // })
    //     .then(response => response.json())
    //     .then(response => {
    //         var nric = response['pc_id'];
    //         var url = 'https://api.qrserver.com/v1/create-qr-code/?data=' + nric + '&amp;size=50x50';
    //         $('#barcode').attr('src', url);
    //         simpleText = url;
    //         document.getElementbyId("barcode").src = url;
    //     })
    $.get('./backend/flutter_apis/obtainSessionCode.php', function (data) {
        x = data;
        var nric = data;
        var url = 'https://api.qrserver.com/v1/create-qr-code/?data=' + nric + '&amp;size=50x50';
        $('#barcode').attr('src', url);
        simpleText = url;
        document.getElementById("barcode").src = url;
    })

    // var nric = myJson["pc_id"];
    // var url = 'https://api.qrserver.com/v1/create-qr-code/?data=' + nric + '&amp;size=50x50';
    // $('#barcode').attr('src', url);
    // simpleText = url;
    // document.getElementbyId("barcode").src = url;
}

jQuery(function ($) {
    setInterval(function () {
        $.ajax({
            method: "POST",
            url: "test.php",
            data: { text: x },
            success: function (response) {
                if (response != "false") {
                    
                    window.location.replace('render.html?img='+response);
                }
            },
        })
    }, 2000); // 2000ms == 2 seconds
});

