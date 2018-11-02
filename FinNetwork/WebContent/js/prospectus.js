function sortNumber(a,b) {
    return a - b;
}


    d3.json("rest/topic/prospectus/", function(error, data) {
    	var year_count = {year_2002:0, year_2003:0,year_2004:0, year_2005:0, year_2006:0, year_2007:0,year_2008:0 };
        
        data.forEach(function(d) {
        	
           if('2002'===d[1]){               
        	   year_count.year_2002=year_count.year_2002+1; 			
               }
           else if('2003'===d[1]){
        	   year_count.year_2003=year_count.year_2003+1;
               }
           else if('2004'===d[1]){
        	   year_count.year_2004=year_count.year_2004+1;
               }
           else if('2005'===d[1]){
        	   year_count.year_2005=year_count.year_2005+1;
               }
           else if('2006'===d[1]){
        	   year_count.year_2006=year_count.year_2006+1;
               }
           else if('2007'===d[1]){
        	   year_count.year_2007=year_count.year_2007+1;
               }
           else if('2008'===d[1]){
        	   year_count.year_2008=year_count.year_2008+1;
               }
        });
        var temp = [];
    	temp[0]=year_count.year_2002;
    	temp[1]=year_count.year_2003;
    	temp[2]=year_count.year_2004;
    	temp[3]=year_count.year_2005;
    	temp[4]=year_count.year_2006;
    	temp[5]=year_count.year_2007;
    	temp[6]=year_count.year_2008;
    																												
    
    	console.log(year_count);
    	temp.sort(sortNumber);
    
        var chart = c3.generate({
            data: {
                columns: [
                    ['Prospectus Count ',year_count.year_2002, year_count.year_2003, year_count.year_2004, year_count.year_2005, year_count.year_2006, year_count.year_2007,year_count.year_2008]
                ],
                type: 'bar'
            },
            bar: {
                width: {
                    ratio: 0.5 // this makes bar width 50% of length between ticks
                }
                // or
                //width: 100 // this makes bar width 100px
            },
            axis: {
                x : {label : {
                    text: 'Years',
                    position: 'outer-middle',
                },
                    type: 'category',
                    categories:  ['2002', '2003', '2004', '2005', '2006', '2007', '2008']
                },
                tick: {
                    x:{
                       
                        multiline:false,
                        culling: {
                            max: 1
                        },
                    },
                    label : {
                        text: 'Days',
                        position: 'center-bottom',

                    },
                },
                y: {
                    label : {
                        text: ' Prospectus Count',
                        position: 'outer-middle',
                    },
                    max: temp[6],
                    min: 0,
                    padding: {top:0, bottom:0}
                }
            }
        });


        

    });
    