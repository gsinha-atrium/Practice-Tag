@RestResource(urlMapping='/Account/*')
global class YourApexClass {
    
    @HttpGet
webservice static Account YourApexMethod() {
	return [select id from account limit 1];
}
}