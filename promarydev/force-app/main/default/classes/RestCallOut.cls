public class RestCallOut {

    
    public static void execute(){
        Http http = new Http();
HttpRequest request = new HttpRequest();
request.setEndpoint('https://trailhead.salesforce.com/en/me/00550000007ya8JAAQ');
request.setMethod('GET');
HttpResponse response = http.send(request);
// If the request is successful, parse the JSON response.
if (response.getStatusCode() == 200) {
    System.debug(response.getBody());
    /*
    // Deserialize the JSON string into collections of primitive data types.
    Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
    // Cast the values in the 'animals' key as a list
    List<Object> animals = (List<Object>) results.get('animals');
    System.debug('Received the following animals:');
    for (Object animal: animals) {
        System.debug(animal);
    }
    */
}
        
    }
}