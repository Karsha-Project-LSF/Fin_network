 $(document).ready(function (){
    	$("#company_network").hide();
     	$('.ui-pnotify').remove(); 
     	
     	
     	$.getJSON("rest/topic/issuers/",
     		function(data) {
     		//console.log('data.company',data.company);
     		$('#company_search').autoComplete({
                minChars: 1,
                source: function(term, suggest){
                    //console.log("AAAAA",term);
                    term = term.toLowerCase();
                    var choices = data.company;
                    var suggestions = [];
                    for (i=0;i<choices.length;i++)
                        if (~choices[i].toLowerCase().indexOf(term)) suggestions.push(choices[i]);
                    suggest(suggestions);
                }
            });        
     	});
     	
     	$("#select_company").click(function(){
     		//$('#edge_filter').val("ALL");
     		var search_company_record = $('#company_search').val();
     		
     		process_sec(search_company_record);
     		
     		
     	});
     		
     	function process_sec(search_company_record){
     		if(search_company_record){
     			var res = search_company_record.split(":");
     			if(res.length>1){
     				var company_record = res[0];
     				var id = res[1];
     				console.log("FI=",id);
     				if(res.length>1){
         				
     					$("#company_network").show();
     					$("#company_header").html("<h2>"+company_record+"</h2>");
     					issuers_draw_me("../../FinNetwork/rest/topic/"+id);      		      					
     				}
     			}
     		}
     	}
     	
     		
     		
     		
     					
     					
     		
     		
     		//console.log(company_cik+"  "+ company_tsy);
     	
    	
     	
     	//TNIC2_viz("rest/sec/ADP/2013","content_2015");
     	
     });

     function issuers_draw_me(url){
    	 console.log('issuers_draw_me_ URL',url);
    	 $.getJSON(url,function(data) {
    		 console.log('data__>',data);
    		 var y=['Count Of FC',0,0,0,0,0,0,0];
    		 
    	     		data.company.forEach(function(d) {
    	     			console.log('data__>',d);
    	     			if(d[2]===2002){
        	     			y[1]=d[0];		
        	     		}
    	     			else if(d[2]===2003){
    	     				y[2]=d[0];
            	     	}
    	     			else if(d[2]===2004){
    	     				y[3]=d[0];
    	     			}
    	     			else if(d[2]===2005){
    	     				y[4]=d[0];
    	     			}
    	     			else if(d[2]===2006){
    	     				y[5]=d[0];
    	     			}
    	     			else if(d[2]===2007){
    	     				y[6]=d[0];
    	     			}
    	     			else if(d[2]===2008){
    	     				y[7]=d[0];
    	     			}
        	     		})
        	     		console.log('y--> ',y);
    	     		var temp = y.slice(1, y.length).sort();
    	     		console.log('temp--> ',temp,'max',temp[temp.length-1]);
    	     		
    	     		
    		        var chart = c3.generate({
    		            data: {
    		                columns: [
    		                    y
    		                ],
    		                type: 'bar'
    		            },
    		            bindto : '#content_btn',
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
    		                        text: 'Count Of FC',
    		                        position: 'outer-middle',
    		                    },
    		                    max: temp[temp.length-1],
    		                    min: 0,
    		                    padding: {top:0, bottom:0}
    		                }
    		            }
    		        });

	     		       
    	     	});
         }
     
