$('#createPatient').on('click', function (e) {
	    	if(!is_valid_cnp($("#cnp").val())){
	    		$('#cnpErr').html("Invalid CNP");
	    		e.preventDefault();
	    	}
	    	else{
	    		$('#cnpErr').html("");
	    	}
	    	if(!is_valid_icn($("#icn").val())){
	    		$('#icnErr').html("Invalid Identity card number");
	    		//displayErr("#icn", "Invalid Identity card number");
	    		e.preventDefault();
	    	}
	    	else{
	    		$('#icnErr').html("");
	    	}
});

$('#createNext').on('click', function (e) {
	 if(!date_check(document.getElementById('consultationDate').valueAsDate)){
	  $('#dateError').html("Invalid Date");
	  e.preventDefault();
	 }
	 else{
	  $('#dateErr').html("");
	 }
	 if(!is_valid_icn($("#icn").val())){
	  $('#timeError').html("Invalid time");
	  e.preventDefault();
	 }
	 else{
	  $('#timeError').html("");
	 }

	 });
$('#updateNext').on('click', function (e) {
	 if(!date_check(document.getElementById('consultationDate').valueAsDate)){
	  $('#dateError').html("Invalid Date");
	  e.preventDefault();
	 }
	 else{
	  $('#dateError').html("");
	 }
	 if(!is_valid_icn($("#icn").val())){
	  $('#timeError').html("Invalid time");
	  e.preventDefault();
	 }
	 else{
	  $('#timeError').html("");
	 }

	 });

function date_check(value){
	
	var current = new Date();

	if(value.getFullYear()>2018){
		return false;
	}
	if(value.getFullYear()<current.getFullYear()){
		return false;
	} else if(value.getFullYear()==current.getFullYear()){
		if(value.getMonth()<current.getMonth()){
			return false;
		} else if(value.getMonth()==current.getMonth()){
			if(value.getDate()<current.getDate()){
				return false;
			} else if(value.getDate()==current.getDate()){
				return true;
			}
		}
	}
	
	return true;
	
}
$('#updatePatient').on('click', function (e) {
	if(!is_valid_icn($("#icn").val())){
		$('#icnErrUpdate').html("Invalid Identity card number");
		e.preventDefault();
	}
	else{
		$('#icnErrUpdate').html("");
	}
});
function is_valid_cnp(value) {
    // 0: cnp
    // 1: s (1-8)
    // 2: aa (00-99)
    // 3: ll (01-12)
    // 4: zz (01-31)
    // 5: jj (1-46, 51-52)
    // 6: nnn (001-999)
    // 7: c (279146358279)
    var m
    if (m = /^([1-8])(0[1-9]|[1-9][0-9])(0[1-9]|1[0-2])(\d{2})(\d{2})(\d{3})(\d)$/.exec(value)) {
        var ll = parseInt(m[3])
        var zz = parseInt(m[4])
        switch (ll) {
            case 2:
                if (zz > 29) {
                    return false
                }
            case 3:
            case 4:
            case 6:
            case 9:
            case 11:
                if (zz > 30) {
                    return false
                }
            default:
                if (zz > 31) {
                    return false
                }
        }
        var jj = parseInt(m[5])
        if (jj < 0 || (jj > 46 && jj < 51) || jj > 52) {
            return false
        }
        var nnn = parseInt(m[6])
        if (nnn < 0) {
            return false
        }
        var c = parseInt(m[7])
        var constanta = "279146358279"
        var suma = 0
        for(var i = 0; i < constanta.length; i++) {
            suma = suma + parseInt(m[0].charAt(i)) * constanta.charAt(i)
        }
        var rest = suma% 11
        return (((rest < 10) && (rest == m[0].charAt(12))) || ((rest == 10) && (m[0].charAt(12) == 1))) ? true : false
    }
    return false
}
function is_valid_icn(value){
	if(value.length==8){
		var seria=value.substring(0,2);
		var nr=value.substring(2,7);
		if(nr.matches("[0-9]+") && seria.matches("[a-zA-Z]+")){
			return true;
		}
	}
	return false;
}

/*function displayErr(input, errMsg) {
    var $div = $("<div class=color-message-error>", {id: "foo", "class": "errMsg"});
    $div.append(errMsg);
    $("#create").find(input).parent().append($div);
}*/