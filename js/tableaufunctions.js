
window.onload = function(){
var vizDiv = document.getElementById('viz');
	var vizURL = "http://192.168.1.15:8000/views/ARTWorkBook/ARTProphylaxisDashboard"
	var options ={  
		width: '1040px',
		height: '540px',
        hideToolbar: true,
        hideTabs: true,
        onFirstInteractive:	function(){
		 	workbook = viz.getWorkbook();
			document.getElementById('sheetName').innerHTML = viz.getWorkbook().getActiveSheet().getName();
			}		
	};
      viz = new tableauSoftware.Viz(vizDiv,vizURL,options);  
	 /*viz.addEventListener('marksselection',function(){
	   alert('Marks have been selected');
	 });*/
	  viz.addEventListener('tabswitch', function(event){
      document.getElementById('sheetName').innerHTML = event.getNewSheetName();
  });
};
function switchView(sheetName) {
	//workBook = viz.getWorkbook();
	workbook.activateSheetAsync(sheetName);
}
function showOnly(filterName, values)
{
  sheet = viz.getWorkbook().getActiveSheet();
  if(sheet.getSheetType() === 'worksheet')
  {
  sheet.applyFilterAsync(filterName,values,'REPLACE');
  
  }
  else {
   worksheetArray = sheet.getWorksheets();
   for(var i =0; i<worksheetArray.length; i++)
   {
     worksheetArray[i].applyFilterAsync(filterName, values,'REPLACE');
   }
  }
  
}
function alsoShow(filterName, values) {
	sheet = viz.getWorkbook().getActiveSheet();
	if(sheet.getSheetType() === 'worksheet') {
		sheet.applyFilterAsync(filterName, values, 'ADD');
	} else {
		worksheetArray = sheet.getWorksheets();
		for(var i = 0; i < worksheetArray.length; i++) {
			worksheetArray[i].applyFilterAsync(filterName, values, 'ADD');
		}
	}
}

function dontShow(filterName, values) {
	sheet = viz.getWorkbook().getActiveSheet();
	if(sheet.getSheetType() === 'worksheet') {
		sheet.applyFilterAsync(filterName, values, 'REMOVE');
	} else {
		worksheetArray = sheet.getWorksheets();
		for(var i = 0; i < worksheetArray.length; i++) {
			worksheetArray[i].applyFilterAsync(filterName, values, 'REMOVE');
		}
	}
}


function clearFilter(filterName) {
	sheet = viz.getWorkbook().getActiveSheet();
	if(sheet.getSheetType() === 'worksheet') {
		sheet.clearFilterAsync(filterName);
	} else {
		worksheetArray = sheet.getWorksheets();
		for(var i = 0; i < worksheetArray.length; i++) {
			worksheetArray[i].clearFilterAsync(filterName);;
		}
	}
}
function selectMarks(filterName, values) {
	sheet = viz.getWorkbook().getActiveSheet();
	if(sheet.getSheetType() === 'worksheet') {
		sheet.selectMarksAsync(filterName, values, 'REPLACE');
	} else {
		worksheetArray = sheet.getWorksheets();
		for(var i = 0; i < worksheetArray.length; i++) {
			worksheetArray[i].selectMarksAsync(filterName, values, 'REPLACE');
		}
	}
}
function problemExample() {

	workbook.activateSheetAsync('LineChart');
	sheet = workbook.getActiveSheet();
	sheet.applyFilterAsync('Category','Stuffed Animal','REPLACE');
}
function solution() {
	//workbook = viz.getWorkbook();
	workbook.activateSheetAsync('LineChart').then(function() {
		sheet = workbook.getActiveSheet();
		//throw new Error('Oooops!');
		sheet.applyFilterAsync('Category','Stuffed Animal','REPLACE');
		return "Hello there";
	//.then(callback).otherwise(errback).always(callAlways)
	}).then(function(parameterString) {
		alert(parameterString + " it worked!");
	}, function(err) {
		alert(err + " It Didn't work!");
	});
}

function alertFunc()
{
 alert('Marks have been selectd');
}
var listenerOn = false;

function toggleSelectionAlert(){
	if(listenerOn){
	 listenerOn = false;
	 viz.removeEventListener('marksselection',alertFunc);
	} else {
	  listenerOn = true;
	  viz.addEventListener('marksselection',alertFunc);
	}
}
function showRange(filter, minVal,maxVal)
{
 sheet = workbook.getActiveSheet();
 sheet.applyRangeFilterAsync(filter,{
   min: minVal,
   max: maxVal
   //nullOption: "allValues"
 });
}

function showDateRange(filter,minDate,maxDate){
  sheet = workbook.getActiveSheet();
  sheet.applyRangeFilterAsync(filter,{
   min: new Date(minDate),
   min: new Date(maxDate)  
  });
}

function showLastNYears(filter,years,anchor){
  sheet = workbook.getActiveSheet();
  var dateObj;
  if(anchor)
  {
    dateObj = new Date(anchor);
  }
  else{
    dateObj = new Date();
  }
 
  sheet.applyRelativeDateFilterAsync(filter,{
   periodType: 'year',
   rangeType: 'lastn',
   rangeN: years,
   anchorDate: dateObj
 
  });
}
function resetViz(workbook)
{
   return workbook.revertAllAsync().then(function() {
   return workbook.getActiveSheet.clearSelectedMarksAsync();
 
 }) ;
}
function resetClick()
{
 resetViz(viz.getWorkbook());
}
function selectItemByValue(elmnt){

    var e = document.getElementById(elmnt);
var strUser = e.options[e.selectedIndex].text;
return strUser;
  }










