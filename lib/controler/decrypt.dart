

List<String> decryptLiner(var data, List<String> cle){
      List<String> result =[];  

            for (var i = 0; i < cle.length; i++) {
                  result.add(data[cle[i]]);
            }
      return result;
}



List<List<String>> decryptMultiline(List data, List<String> cle){
      List<Map> userInfo =[];  
      List<List<String>>infofinal=[];

          for (var i = 0; i < data.length; i++) {
             userInfo.add(data[i]);
          }

           for (var element in userInfo) {
            List<String>inRow =[]; 

             for (var j = 0; j < cle.length; j++) {
                    inRow.add(element[cle[j]]);
              }

        infofinal.add(inRow);
        
      }
  return infofinal;
}